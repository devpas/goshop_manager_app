import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../models/models.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'order_status_modal.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class OrderShopExpansionTile extends StatefulWidget {
  const OrderShopExpansionTile({
    Key? key,
    required this.orderDetails,
    required this.child,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
  }) : super(key: key);

  final ShopOrderDetails? orderDetails;

  final ValueChanged<bool>? onExpansionChanged;

  final Widget child;

  final bool initiallyExpanded;

  @override
  State<OrderShopExpansionTile> createState() => _OrderShopExpansionTileState();
}

class _OrderShopExpansionTileState extends State<OrderShopExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {});
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget? _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: Icon(
        FlutterRemix.arrow_drop_down_line,
        color: AppColors.black,
        size: 24.r,
      ),
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: [
            Material(
              color: AppColors.white,
              child: InkWell(
                onTap: _handleTap,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 60.r,
                      padding: EdgeInsetsDirectional.only(start: 15.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CommonImage(
                                      imageUrl:
                                          widget.orderDetails?.shop?.logoImg,
                                      width: 40,
                                      height: 40,
                                      radius: 35,
                                    ),
                                    12.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.orderDetails?.shop?.translation?.title}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            letterSpacing: -1,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.store),
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            letterSpacing: -1,
                                            color: AppColors.commentHint,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                if (!_isExpanded)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${widget.orderDetails?.orderStocks?.length}',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          letterSpacing: -1,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        AppHelpers.getTranslation(
                                            TrKeys.products),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          letterSpacing: -1,
                                          color: AppColors.commentHint,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          IconButton(
                            splashRadius: 18.r,
                            onPressed: _handleTap,
                            icon: SizedBox(child: _buildIcon(context)),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.r,
                      thickness: 1.r,
                      color: AppColors.mainBackground,
                    ),
                    Container(
                      height: 45.r,
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30.r,
                                height: 30.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color:
                                      widget.orderDetails?.status != 'delivered'
                                          ? AppColors.black
                                          : AppColors.greenMain,
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  AppHelpers.getOrderStatusIcon(
                                      widget.orderDetails?.status),
                                  size: 16.r,
                                  color: AppColors.white,
                                ),
                              ),
                              17.horizontalSpace,
                              Text(
                                AppHelpers.getOrderStatusText(
                                  widget.orderDetails?.status,
                                ),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  letterSpacing: -1,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150.r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: LinearProgressIndicator(
                                value: AppHelpers.getOrderStatusProgress(
                                  widget.orderDetails?.status,
                                ),
                                color: AppColors.greenMain,
                                backgroundColor: AppColors.emailHint,
                              ),
                            ),
                          ),
                          SmallIconButton(
                            icon: Icon(
                              FlutterRemix.edit_line,
                              size: 24.r,
                              color: AppColors.darkBlue,
                            ),
                            onPressed: () {
                              showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return OrderStatusModal(
                                    orderDetails: widget.orderDetails,
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
            ),
            1.verticalSpace,
          ],
        ),
        ClipRect(
          child: Align(
            alignment: expansionTileTheme.expandedAlignment ?? Alignment.center,
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
        10.verticalSpace,
      ],
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = expansionTileTheme.collapsedTextColor ??
          theme.textTheme.subtitle1!.color
      ..end = expansionTileTheme.textColor ?? colorScheme.primary;
    _iconColorTween
      ..begin =
          expansionTileTheme.collapsedIconColor ?? theme.unselectedWidgetColor
      ..end = expansionTileTheme.iconColor ?? colorScheme.primary;
    _backgroundColorTween.end = expansionTileTheme.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: widget.child,
      ),
    );
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: result,
    );
  }
}
