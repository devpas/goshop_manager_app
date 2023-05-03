import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../src/models/models.dart';
import '../../../../src/presentation/theme/theme.dart';

class ColorExtras extends StatelessWidget {
  final int groupIndex;
  final List<UiExtra> uiExtras;
  final Function(UiExtra) onUpdate;

  const ColorExtras({
    Key? key,
    required this.groupIndex,
    required this.uiExtras,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.r,
      runSpacing: 10.r,
      children: uiExtras
          .map(
            (uiExtra) => Material(
              borderRadius: BorderRadius.circular(21.r),
              color: Color(int.parse('0xFF${uiExtra.value.substring(1, 7)}')),
              child: InkWell(
                borderRadius: BorderRadius.circular(21.r),
                onTap: () {
                  if (uiExtra.isSelected) {
                    return;
                  }
                  onUpdate(uiExtra);
                },
                child: uiExtra.isSelected
                    ? Container(
                        width: 42.r,
                        height: 42.r,
                        alignment: Alignment.center,
                        child: Container(
                          width: 22.r,
                          height: 22.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.r),
                            color: AppColors.greenMain,
                            border:
                                Border.all(color: AppColors.white, width: 8.r),
                          ),
                        ),
                      )
                    : SizedBox(width: 42.r, height: 42.r),
              ),
            ),
          )
          .toList(),
    );
  }
}
