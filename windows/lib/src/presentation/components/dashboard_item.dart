import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class DashboardItem extends StatelessWidget {
  final IconData iconData;
  final int? number;
  final String title;
  final Color iconColor;
  final Function()? onTap;

  const DashboardItem({
    Key? key,
    required this.iconData,
    this.number,
    required this.title,
    required this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 129.r,
            padding: REdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: iconColor.withOpacity(0.1),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    iconData,
                    size: 20.r,
                    color: iconColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$number',
                      style: AppTypographies.styBlack20W600,
                    ),
                    2.verticalSpace,
                    Text(
                      title,
                      style: AppTypographies.styBlack14W400Opacity30,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
