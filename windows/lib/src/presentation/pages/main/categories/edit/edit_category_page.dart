import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../riverpod/providers/providers.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'widgets/search_category_modal_in_edit_category.dart';

class EditCategoryPage extends ConsumerStatefulWidget {
  final String alias;

  const EditCategoryPage({Key? key, required this.alias}) : super(key: key);

  @override
  ConsumerState<EditCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends ConsumerState<EditCategoryPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editCategoryProvider);
    final notifier = ref.read(editCategoryProvider.notifier);
    return AbsorbPointer(
      absorbing: state.isLoading || state.isSaving,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor: AppColors.shopsPageBack,
          appBar: CustomAppbar(
            title: AppHelpers.getTranslation(TrKeys.editCategory),
            leading: SmallIconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                color: AppColors.black,
              ),
              onPressed: context.popRoute,
            ),
          ),
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greenMain,
                    strokeWidth: 3.r,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    physics: const CustomBouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          40.verticalSpace,
                          Align(
                            alignment: Alignment.center,
                            child: SelectImage(
                              imageUrl: state.imageUrl,
                              file: state.image,
                              onChangePhoto: (XFile file) {
                                notifier.setCategoryFile(file);
                              },
                            ),
                          ),
                          30.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.name),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: -0.4,
                              color: AppColors.black.withOpacity(0.3),
                            ),
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: notifier.setCategoryName,
                            initialValue: state.name,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: AppColors.black,
                            ),
                            decoration: InputDecoration(
                              hintText:
                                  AppHelpers.getTranslation(TrKeys.inputName),
                              hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: AppColors.inputNameHint,
                              ),
                            ),
                          ),
                          30.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.description),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: -0.4,
                              color: AppColors.black.withOpacity(0.3),
                            ),
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: notifier.setDescription,
                            initialValue: state.description,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: -0.4,
                              color: AppColors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: AppHelpers.getTranslation(
                                  TrKeys.inputDescription),
                              hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.4,
                                color: AppColors.inputNameHint,
                              ),
                            ),
                          ),
                          30.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.keywords),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              letterSpacing: -0.4,
                              color: AppColors.black.withOpacity(0.3),
                            ),
                          ),
                          CustomMultiSelectionFormField(
                            initialValues: state.keywords,
                            onSaved: (keywords) {
                              notifier.setKeywords(keywords as List<String>);
                            },
                          ),
                          30.verticalSpace,
                          SelectWithSearchButton(
                            label: AppHelpers.getTranslation(
                                TrKeys.parentCategory),
                            title: state.parentCategory ??
                                AppHelpers.getTranslation(
                                    TrKeys.selectParentCategory),
                            onTap: () {
                              notifier.setQuery('');
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const SearchCategoryModalInEdit(),
                              );
                            },
                          ),
                          39.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.status),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                          17.verticalSpace,
                          Row(
                            children: [
                              RoundedCheckBox(
                                value: state.status,
                                onChanged: (value) {
                                  notifier.setCategoryStatus(!state.status);
                                },
                              ),
                              10.horizontalSpace,
                              Text(
                                state.status
                                    ? AppHelpers.getTranslation(TrKeys.active)
                                    : AppHelpers.getTranslation(
                                        TrKeys.inactive),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: state.status
                                      ? AppColors.black
                                      : AppColors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          40.verticalSpace,
                          CommonAccentButton(
                            isLoading: state.isSaving,
                            title: AppHelpers.getTranslation(TrKeys.save),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                notifier.updateCategory(context, widget.alias);
                              }
                            },
                          ),
                          30.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
