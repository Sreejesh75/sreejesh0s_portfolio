import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_sreejesh/utils/constants.dart';
import 'package:portfolio_sreejesh/sections/hero_section.dart';
import 'package:portfolio_sreejesh/sections/about_section.dart';
import 'package:portfolio_sreejesh/sections/skills_section.dart';
import 'package:portfolio_sreejesh/sections/projects_section.dart';
import 'package:portfolio_sreejesh/sections/services_section.dart';
import 'package:portfolio_sreejesh/sections/contact_section.dart';
import 'package:portfolio_sreejesh/widgets/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sreejesh OS - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: AppColors.textPrimary),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void _scrollToSection(String section) {
    GlobalKey? key;
    switch (section) {
      case "About":
        key = aboutKey;
        break;
      case "Skills":
        key = skillsKey;
        break;
      case "Projects":
        key = projectsKey;
        break;
      case "Services":
        key = servicesKey;
        break;
      case "Contact":
        key = contactKey;
        break;
    }

    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const HeroSection(),
                SizedBox(key: aboutKey, child: const AboutSection()),
                SizedBox(key: skillsKey, child: const SkillsSection()),
                SizedBox(key: projectsKey, child: const ProjectsSection()),
                SizedBox(key: servicesKey, child: const ServicesSection()),
                SizedBox(key: contactKey, child: const ContactSection()),
                // Footer can go here
                const SizedBox(height: 50),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(onNavTap: _scrollToSection),
          ),
        ],
      ),
    );
  }
}
