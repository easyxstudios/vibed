import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef PremiumWideBannerOnTap = void Function();

class PremiumWideBanner extends StatelessWidget {
  final Color bgColor;
  final String imagePath;
  final String smallText;
  final String title;
  final PremiumWideBannerOnTap onTap;

  const PremiumWideBanner({
    super.key,
    required this.bgColor,
    required this.imagePath,
    required this.smallText,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        color: Colors.transparent,
        child: Ink(
          // height: 116,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: bgColor,
            // border: Border.all(color: borderColor),
          ),
          child: InkWell(
            onTap: () => onTap(),
            child: Row(
              children: [
                Image.asset(
                  imagePath,
                  width: constraints.maxWidth * 0.32,
                  // height: 116,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        smallText.toUpperCase(),
                        style: GoogleFonts.albertSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF49250A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: GoogleFonts.albertSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
      );
    });
  }
}
