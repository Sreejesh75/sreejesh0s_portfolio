import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_sreejesh/utils/constants.dart';
import 'package:portfolio_sreejesh/utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          Text(
            "PROJECTS",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _ProjectCard(
                    title: "UPI QR Scanner & Generator",
                    description:
                        "Developed a Flutter application to scan and generate UPI QR codes. Implemented QR scanning logic and custom generator.",
                    techStack: ["Flutter", "Dart", "QR Code"],
                    githubLink: "https://github.com/",
                  ),
                  _ProjectCard(
                    title: "Recipe App",
                    description:
                        "Integrated TheMealDB API to fetch meal categories and details. Features search, favorites, and onboarding screens.",
                    techStack: ["Flutter", "REST API", "Provider"],
                    githubLink: "https://github.com/",
                  ),
                  _ProjectCard(
                    title: "Expense Tracker App",
                    description:
                        "Track income and expenses with multiple categories. Persists data locally using Hive and manages state with Provider.",
                    techStack: ["Flutter", "Hive", "Provider"],
                    githubLink: "https://github.com/",
                  ),
                  _ProjectCard(
                    title: "Weather App",
                    description:
                        "Real-time weather data using OpenWeatherMap API. Displays temperature and weather conditions based on city.",
                    techStack: ["Flutter", "REST API"],
                    githubLink: "https://github.com/",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final String githubLink;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.techStack,
    required this.githubLink,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.githubLink);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch \$uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: Responsive.isMobile(context) ? double.infinity : 350,
        padding: const EdgeInsets.all(25),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(15),
          border: _isHovered
              ? Border.all(color: AppColors.accent, width: 2)
              : Border.all(color: Colors.white.withValues(alpha: 0.05)),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.accent.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.3),
              blurRadius: _isHovered ? 20 : 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[400],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.techStack
                  .map(
                    (tech) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.accent.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        tech,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchUrl,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              child: const Text("View on GitHub"),
            ),
          ],
        ),
      ),
    );
  }
}
