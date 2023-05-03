import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_manager_app/modify/models/models.dart';
import 'package:g_manager_app/modify/presentation/pages/orders/add/widgets/client/client_info_modal.dart';
import 'package:g_manager_app/modify/presentation/pages/orders/add/widgets/order_detail/tickets/list_ticket_modal.dart';
import 'package:g_manager_app/modify/presentation/pages/products/widgets/products_edit_modal.dart';
import 'package:g_manager_app/modify/presentation/pages/products/widgets/products_filter_modal.dart';

import '../../../../src/riverpod/providers/providers.dart';
import 'package:g_manager_app/modify/riverpob/providers/providers.dart';
import '../../../../modify/presentation/theme/theme.dart';
import '../../../../modify/presentation/components/components.dart';
import '../products/widgets/products_product_item_pos.dart';

class DashboardPASPage extends ConsumerStatefulWidget {
  const DashboardPASPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardPASPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPASPage> {
  String message = "";
  double heightContainerProduct = 340;
  int selectTicketLine = 0;
  int selectCategory = 0;
  int selectTicket = 0;
  bool keyboardVisible = false;
  late FocusNode focusNode;

  void showKeyboard() {
    focusNode.requestFocus();
    setState(() {
      keyboardVisible = true;
    });
  }

  void dismissKeyboard() {
    focusNode.unfocus();
    setState(() {
      keyboardVisible = false;
    });
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    KeyboardVisibilityController().onChange.listen((isVisible) {
      if (isVisible) {
        setState(() {
          heightContainerProduct = 70;
        });
      } else {
        setState(() {
          heightContainerProduct = 340;
        });
      }
    });
    Future.delayed(
      Duration.zero,
      () {
        ref.read(productsProvider.notifier).fetchProducts();
        ref.read(categoriesProvider.notifier).fetchCategories();
        ref.read(posSystemPASProvider.notifier).initListTicket();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardProvider);
    final stateProducts = ref.watch(productsProvider);
    final stateCategory = ref.watch(categoriesProvider);
    final statePos = ref.watch(posSystemPASProvider);
    final notifierPos = ref.read(posSystemPASProvider.notifier);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.mainBackground,
        body: state.isCountsLoading ||
                state.isTotalEarningsLoading ||
                state.isTopCustomersLoading ||
                state.isTopProductsLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.r,
                  color: AppColors.greenMain,
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 30,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Hàng",
                              style: AppTypographies.styBlack11W400Opacity40,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              "Giá",
                              style: AppTypographies.styBlack11W400Opacity40,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Text(
                              "SL",
                              style: AppTypographies.styBlack11W400Opacity40,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Text(
                              "%",
                              style: AppTypographies.styBlack11W400Opacity40,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              "Giá + %",
                              style: AppTypographies.styBlack11W400Opacity40,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              "Tiền",
                              style: AppTypographies.styBlack11W400Opacity40,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                    child: SizedBox(
                      height: 210,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const CustomBouncingScrollPhysics(),
                        itemCount: statePos.listTicket != null
                            ? statePos
                                .listTicket![selectTicket].ticketlines!.length
                            : 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectTicketLine = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                              child: Container(
                                height: 30,
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          "${stateProducts.products.where((product) => product.id == statePos.listTicket![selectTicket].ticketlines![index].productId).toList().first.translation!.title}",
                                          style: selectTicketLine == index
                                              ? AppTypographies.styGreen11W700
                                              : AppTypographies.styBlack11W700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          notifierPos.convertNumberZero(
                                              double.parse(
                                                  "${statePos.listTicket![selectTicket].ticketlines![index].price}")),
                                          style: selectTicketLine == index
                                              ? AppTypographies.styGreen11W700
                                              : AppTypographies.styBlack11W700,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Text(
                                          "${statePos.listTicket![selectTicket].ticketlines![index].unit}",
                                          style: selectTicketLine == index
                                              ? AppTypographies.styGreen11W700
                                              : AppTypographies.styBlack11W700,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Text(
                                          "${statePos.listTicket![selectTicket].ticketlines![index].taxId}%",
                                          style: selectTicketLine == index
                                              ? AppTypographies.styGreen11W700
                                              : AppTypographies.styBlack11W700,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          notifierPos.convertNumberZero(statePos
                                                  .listTicket![selectTicket]
                                                  .ticketlines![index]
                                                  .price! *
                                              (1 +
                                                  int.parse(
                                                          "${statePos.listTicket![selectTicket].ticketlines![index].taxId}") /
                                                      100)),
                                          style: selectTicketLine == index
                                              ? AppTypographies.styGreen11W700
                                              : AppTypographies.styBlack11W700,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          notifierPos.convertNumberZero(statePos
                                                  .listTicket![selectTicket]
                                                  .ticketlines![index]
                                                  .price! *
                                              (1 +
                                                  int.parse(
                                                          "${statePos.listTicket![selectTicket].ticketlines![index].taxId}") /
                                                      100) *
                                              int.parse(
                                                  "${statePos.listTicket![selectTicket].ticketlines![index].unit}")),
                                          style: selectTicketLine == index
                                              ? AppTypographies.styGreen11W700
                                              : AppTypographies.styBlack11W700,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                    child: Container(
                      height: 40,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const ListTicketModal();
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Container(
                                  width: 150,
                                  alignment: Alignment.center,
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(53.r),
                                    color: const Color.fromARGB(
                                        255, 202, 199, 199),
                                  ),
                                  child: Text(
                                    statePos.listTicket != null
                                        ? "${statePos.listTicket![selectTicket].title}"
                                        : "",
                                    textAlign: TextAlign.center,
                                    style: AppTypographies.styBlack10W500,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return const ClientInfoModal();
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Container(
                                    width: 30.r,
                                    height: 30.r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: AppColors.inProgressOrders
                                          .withOpacity(0.1),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.person,
                                      size: 20.r,
                                      color: AppColors.inProgressOrders,
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) =>
                                      const ProductsFilterModal(),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Container(
                                    width: 30.r,
                                    height: 30.r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: AppColors.canceledOrders
                                          .withOpacity(0.1),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.search,
                                      size: 20.r,
                                      color: AppColors.canceledOrders,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Container(
                                width: 30.r,
                                height: 30.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: AppColors.deliveredOrders
                                      .withOpacity(0.1),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.print,
                                  size: 20.r,
                                  color: AppColors.deliveredOrders,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Container(
                                width: 30.r,
                                height: 30.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.red.withOpacity(0.1),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.wallet,
                                  size: 20.r,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Text("TS: ", style: AppTypographies.styBlack11W400),
                            Expanded(
                              child: Text(notifierPos.totalMoney(selectTicket),
                                  textAlign: TextAlign.center,
                                  style: AppTypographies.styBlack11W400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: SizedBox(
                      height: heightContainerProduct,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: REdgeInsets.symmetric(vertical: 5),
                              physics: const CustomBouncingScrollPhysics(),
                              itemCount: stateCategory.categories.length,
                              shrinkWrap: false,
                              itemBuilder: (context, index) {
                                return CategoryPosItem(
                                  title:
                                      '${stateCategory.categories[index].translation?.title}',
                                  isSelected:
                                      selectCategory == index ? true : false,
                                  onTap: () {
                                    setState(() {
                                      selectCategory = index;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 325,
                            child: ListView(
                              physics: const CustomBouncingScrollPhysics(),
                              children: [
                                GridView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: stateProducts.products.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 200 / 110,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    final product =
                                        stateProducts.products[index];
                                    return TextButton(
                                      onPressed: () {
                                        TicketLineData ticketline = TicketLineData(
                                            id: notifierPos
                                                    .listTicket[selectTicket]
                                                    .ticketlines!
                                                    .isNotEmpty
                                                ? notifierPos
                                                        .listTicket[
                                                            selectTicket]
                                                        .ticketlines!
                                                        .length +
                                                    1
                                                : 1,
                                            ticketId: notifierPos
                                                .listTicket[selectTicket]
                                                .ticketId,
                                            line: 1,
                                            productId: stateProducts
                                                .products[index].id,
                                            attributesetInstanceId: 1,
                                            unit: stateProducts.products[index]
                                                    .stocks!.isNotEmpty
                                                ? 1
                                                : 0,
                                            price: stateProducts.products[index]
                                                    .stocks!.isNotEmpty
                                                ? double.parse(
                                                    "${stateProducts.products[index].stocks![0].price}")
                                                : 0,
                                            taxId:
                                                int.parse("${stateProducts.products[index].tax}"),
                                            attributes: "");
                                        notifierPos.addTicketline(
                                            ticketline, selectTicket);
                                      },
                                      child: ProductsProductItemPOS(
                                        product: product,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      height: 40,
                      color: Colors.white,
                      child: Row(children: [
                        keyboardVisible
                            ? GestureDetector(
                                onTap: () {
                                  dismissKeyboard();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                    width: 30.r,
                                    height: 30.r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.lightBlue.withOpacity(0.1),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20.r,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  showKeyboard();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                    width: 30.r,
                                    height: 30.r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Colors.lightBlue.withOpacity(0.1),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.keyboard,
                                      size: 20.r,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                ),
                              ),
                        GestureDetector(
                          onTap: () {
                            notifierPos.deleteTicketline(
                                selectTicket, selectTicketLine);
                            setState(() {
                              if (selectTicketLine > 0) {
                                selectTicketLine -= 1;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              width: 30.r,
                              height: 30.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.red.withOpacity(0.1),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.close,
                                size: 20.r,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => const ProductsEditModal(),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              width: 30.r,
                              height: 30.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.orange.withOpacity(0.1),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.edit,
                                size: 20.r,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            notifierPos.addTicket();
                            selectTicket = statePos.listTicket!.length - 1;
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              width: 30.r,
                              height: 30.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.purple.withOpacity(0.1),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                size: 20.r,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            notifierPos.deleteTicket(selectTicket);
                            selectTicket = statePos.listTicket!.length - 1;
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              width: 30.r,
                              height: 30.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.delete,
                                size: 20.r,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 5, 10),
                          child: TextField(
                            focusNode: focusNode,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                        )),
                        const SizedBox(
                          width: 60,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 10),
                            child: SizedBox(
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ));
  }
}
