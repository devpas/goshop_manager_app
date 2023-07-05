import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_manager_app/modify/models/data/product_data.dart';
import 'package:g_manager_app/modify/presentation/pages/pos/pos_manage/products_manage/products/widgets/products_product_item_pas.dart';
import 'package:g_manager_app/modify/riverpob/providers/providers.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../src/core/constants/constants.dart';
import '../../../../../../../src/core/routes/app_router.gr.dart';
import '../../../../../../../src/core/utils/utils.dart';
import '../../../../../../../src/riverpod/providers/providers.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'widgets/list_products_filter_modal.dart';
import 'widgets/products_product_item.dart';
import 'widgets/w_delete_product_dialog.dart';

class ProductsPasPage extends ConsumerStatefulWidget {
  const ProductsPasPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsPasPage> createState() => _ProductsPasPageState();
}

class _ProductsPasPageState extends ConsumerState<ProductsPasPage> {
  late ScrollController _scrollController;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(productsPASProvider.notifier).fetchProductsByCategory(
            ref.read(productsPASProvider.notifier).minCategoryId);
        if (ref.watch(categoriesPASProvider).categorySelected == null) {
          ref.read(categoriesPASProvider.notifier).setCategorySelected(
              ref.watch(categoriesPASProvider).categories![0]);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsPASProvider);
    final notifier = ref.read(productsPASProvider.notifier);
    return AbsorbPointer(
      absorbing: false,
      child: Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: CustomAppbarPOS(
          actions: getProductsActions(context),
          title: Text(
            "Sản phẩm",
            style: AppTypographies.styBlack16W500,
            textAlign: TextAlign.center,
          ),
          leading: Builder(
            builder: (context) => SmallIconButton(
              icon: Icon(
                FlutterRemix.arrow_left_s_line,
                size: 24.r,
                color: AppColors.black,
              ),
              onPressed: context.popRoute,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchTextField(
              textEditingController: searchController,
              onChanged: (e) {
                if (e.length >= 3) {
                  notifier.productName = e;
                  notifier.searchProducts(-1);
                } else {
                  notifier.resetSearch();
                }
              },
              hintText: AppHelpers.getTranslation(TrKeys.searchProducts),
              suffixIcon: SmallIconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => ListProductsFilterModal(),
                  );
                },
                icon: Icon(
                  FlutterRemix.sound_module_line,
                  size: 24.r,
                  color: AppColors.black,
                ),
              ),
            ),
            Expanded(
              child: state.productsLoading!
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.greenMain,
                        strokeWidth: 3.r,
                      ),
                    )
                  : ListView(
                      physics: const CustomBouncingScrollPhysics(),
                      controller: _scrollController,
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: REdgeInsets.only(
                            top: 20,
                            left: 15,
                            right: 15,
                            bottom: 0,
                          ),
                          shrinkWrap: true,
                          itemCount: state.productsAfterFilter!.isEmpty
                              ? state.products!.length
                              : state.productsAfterFilter!.length,
                          itemBuilder: (context, index) {
                            ProductPasData product;
                            if (state.productsAfterFilter!.isEmpty) {
                              product = state.products![index];
                            } else {
                              product = state.productsAfterFilter![index];
                            }
                            return ListProductsProductItemPas(
                              product: product,
                              onTap: () async {
                                notifier.setProductSelected(product);
                                final shouldUpdate = await context.pushRoute(
                                  EditProductPasRoute(productData: product),
                                ) as bool?;
                                if (shouldUpdate != null && shouldUpdate) {
                                  // await notifier.updateProducts();
                                }
                              },
                              onDeleteTap: () {
                                print(product.id);
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return WDeleteProductDialog(
                                      productId: product.id!,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
