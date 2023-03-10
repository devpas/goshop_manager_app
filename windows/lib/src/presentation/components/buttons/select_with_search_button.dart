import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';

class SelectWithSearchButton extends StatelessWidget {
  final String title;
  final String label;
  final Function() onTap;

  const SelectWithSearchButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            letterSpacing: -0.4,
            color: AppColors.black.withOpacity(0.3),
          ),
        ),
        10.verticalSpace,
        Material(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.dropdownFill,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Icon(
                    FlutterRemix.arrow_down_s_line,
                    size: 24.r,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
