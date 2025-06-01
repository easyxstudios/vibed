import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumFeature extends StatelessWidget {
  final String text;

  const PremiumFeature({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8, 0, 0),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.albertSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
