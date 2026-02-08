import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_sreejesh/utils/constants.dart';
import 'package:portfolio_sreejesh/utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          Text(
            "SKILLS & EXPERTISE",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _SkillCard(
                title: "Flutter Development",
                icon: Icons.flutter_dash,
                skills: [
                  "Android & iOS",
                  "Web & Desktop",
                  "State Management (Bloc, Provider)",
                  "Clean Architecture",
                ],
              ),
              _SkillCard(
                title: "Backend Development",
                icon: FontAwesomeIcons.nodeJs,
                skills: [
                  "Node.js",
                  "Express.js",
                  "REST APIs",
                  "Firebase Functions",
                ],
              ),
              _SkillCard(
                title: "Database & Cloud",
                icon: FontAwesomeIcons.database,
                skills: [
                  "Firebase Firestore",
                  "Realtime Database",
                  "SQL (Basic)",
                  "Cloud Storage",
                ],
              ),
              _SkillCard(
                title: "Tools & DevOps",
                icon: FontAwesomeIcons.gitAlt,
                skills: [
                  "Git & GitHub",
                  "CI/CD (Basic)",
                  "Postman",
                  "Figma (UI/UX)",
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const _SkillCard({
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: Responsive.isMobile(context) ? double.infinity : 300,
        padding: const EdgeInsets.all(25),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(15),
          border: _isHovered
              ? Border.all(color: AppColors.accent, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.accent.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.2),
              blurRadius: _isHovered ? 20 : 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, size: 40, color: AppColors.accent),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            ...widget.skills.map(
              (skill) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.accent,
                      size: 16,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        skill,
                        style: GoogleFonts.poppins(color: Colors.grey[400]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
