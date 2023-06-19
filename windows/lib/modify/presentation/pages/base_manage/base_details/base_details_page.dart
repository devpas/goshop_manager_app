import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_manager_app/src/core/routes/app_router.gr.dart';

import '../../../../../src/core/constants/constants.dart';
import '../../../../../src/core/utils/utils.dart';
import '../../../../../src/riverpod/providers/providers.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'widgets/base_address.dart';
import 'widgets/base_details_body.dart';
import 'widgets/base_list_employee.dart';
import 'widgets/list_option.dart';

class BaseDetailsPage extends ConsumerStatefulWidget {
  final String? uuid;
  final String title;
  final OpenEditUserFrom from;

  const BaseDetailsPage({
    Key? key,
    this.uuid,
    required this.title,
    required this.from,
  }) : super(key: key);

  @override
  ConsumerState<BaseDetailsPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends ConsumerState<BaseDetailsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    Future.delayed(
      Duration.zero,
      () {
        ref.read(editUserProvider.notifier).fetchUserDetails(
              uuid: widget.uuid,
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
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editUserProvider);
    return AbsorbPointer(
      absorbing: state.isLoading || state.isSaving,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomAppbarPOS(
            title: Text(
              "Thông tin chi tiết",
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
            children: [
              Container(
                color: AppColors.white,
                child: TabBar(
                  indicatorColor: AppColors.greenMain,
                  indicatorWeight: 2,
                  labelPadding: EdgeInsets.zero,
                  controller: _tabController,
                  labelColor: AppColors.black,
                  unselectedLabelColor: AppColors.unselectedTabBar,
                  unselectedLabelStyle: AppTypographies.styUnselected14W500,
                  labelStyle: AppTypographies.styBlack14W500,
                  tabs: const [
                    Tab(text: "Cơ sở"),
                    Tab(text: "Địa điểm"),
                    Tab(text: "Nhân sự"),
                    Tab(text: "Tùy chọn"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const CustomBouncingScrollPhysics(),
                  children: [
                    BaseDetailsBody(from: widget.from),
                    BaseAddressBody(userData: state.userData),
                    const BaseListEmployee(),
                    const ListOption(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}