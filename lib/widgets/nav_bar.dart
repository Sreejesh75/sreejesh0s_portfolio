import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_sreejesh/utils/constants.dart';
import 'package:portfolio_sreejesh/utils/responsive.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: AppColors.primary.withValues(
        alpha: 0.9,
      ), // Glassmorphism effect preparation
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "< Sreejesh OS />",
            style: GoogleFonts.firaCode(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.accent,
            ),
          ),
          if (!Responsive.isMobile(context))
            Row(
              children: [
                _NavBarItem(title: "About", onTap: () => onNavTap("About")),
                _NavBarItem(title: "Skills", onTap: () => onNavTap("Skills")),
                _NavBarItem(
                  title: "Projects",
                  onTap: () => onNavTap("Projects"),
                ),
                _NavBarItem(
                  title: "Services",
                  onTap: () => onNavTap("Services"),
                ),
                _NavBarItem(title: "Contact", onTap: () => onNavTap("Contact")),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  child: const Text("Resume"),
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                color: _isHovered ? AppColors.accent : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                shadows: _isHovered
                    ? [
                        Shadow(
                          color: AppColors.accent.withValues(alpha: 0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
