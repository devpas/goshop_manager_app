import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../riverpod/providers/providers.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';

class SearchBrandInPosFilterModal extends ConsumerStatefulWidget {
  const SearchBrandInPosFilterModal({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchBrandInPosFilterModal> createState() =>
      _SearchBrandModalState();
}

class _SearchBrandModalState
    extends ConsumerState<SearchBrandInPosFilterModal> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(posSystemProvider.notifier).fetchBrands(
              query: '',
              checkYourNetwork: () {
                AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
                );
              },
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(posSystemProvider);
    final notifier = ref.read(posSystemProvider.notifier);
    return Material(
      color: AppColors.mainBackground,
      child: Container(
        padding: REdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchTextField(
              onChanged: (value) =>
                  notifier.setBrandQuery(context, value.trim()),
              hintText: AppHelpers.getTranslation(TrKeys.searchBrand),
            ),
            10.verticalSpace,
            SearchedItem(
              title: AppHelpers.getTranslation(TrKeys.allBrands),
              isSelected: state.selectedBrand == null,
              onTap: () {
                notifier.setSelectedBrand(null);
                context.popRoute();
              },
            ),
            state.isBrandsLoading
                ? Padding(
                    padding: REdgeInsets.symmetric(vertical: 20.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 3.r,
                      color: AppColors.greenMain,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: REdgeInsets.symmetric(vertical: 10),
                      physics: const CustomBouncingScrollPhysics(),
                      itemCount: state.brands.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final brand = state.brands[index];
                        return SearchedItem(
                          title: '${brand.title}',
                          isSelected: brand.id == state.selectedBrand?.id,
                          onTap: () {
                            notifier.setSelectedBrand(brand);
                            context.popRoute();
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
