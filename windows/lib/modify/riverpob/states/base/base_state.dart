import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:g_manager_app/modify/models/models.dart';
import 'package:image_picker/image_picker.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState({
    @Default([]) List<BaseData>? base,
    @Default(0) int? baseSelected,
    @Default(false) bool? baseLoading,
    @Default(false) bool? employeesLoading,
    @Default(true) bool? createDataRequest,
    @Default("Loading...") String? msgBase,
    @Default([]) List<EmployeeData>? employees,
    @Default("pos-system") String? blockSelected,
    @Default("") String? roleCodeSelected,
    @Default("") String? roleNameSelected,
    @Default("") String? noteAddEmployee,
    @Default(false) bool? accessPosSystemBlock,
    @Default(false) bool? accessBaseManagerBlock,
    @Default(false) bool? accessUserSettingBlock,
    @Default(false) bool? accessGlobalSettingBlock,
    @Default({}) dynamic baseInfomation,
    XFile? image,
    XFile? video,
  }) = _BaseState;

  const BaseState._();
}
