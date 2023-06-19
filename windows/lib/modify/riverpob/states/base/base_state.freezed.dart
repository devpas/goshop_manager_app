// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState {
  List<BaseData>? get base => throw _privateConstructorUsedError;
  int? get baseSelected => throw _privateConstructorUsedError;
  bool? get baseLoading => throw _privateConstructorUsedError;
  bool? get createDataRequest => throw _privateConstructorUsedError;
  String? get msgBase => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseStateCopyWith<BaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<$Res> {
  factory $BaseStateCopyWith(BaseState value, $Res Function(BaseState) then) =
      _$BaseStateCopyWithImpl<$Res, BaseState>;
  @useResult
  $Res call(
      {List<BaseData>? base,
      int? baseSelected,
      bool? baseLoading,
      bool? createDataRequest,
      String? msgBase});
}

/// @nodoc
class _$BaseStateCopyWithImpl<$Res, $Val extends BaseState>
    implements $BaseStateCopyWith<$Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = freezed,
    Object? baseSelected = freezed,
    Object? baseLoading = freezed,
    Object? createDataRequest = freezed,
    Object? msgBase = freezed,
  }) {
    return _then(_value.copyWith(
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as List<BaseData>?,
      baseSelected: freezed == baseSelected
          ? _value.baseSelected
          : baseSelected // ignore: cast_nullable_to_non_nullable
              as int?,
      baseLoading: freezed == baseLoading
          ? _value.baseLoading
          : baseLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      createDataRequest: freezed == createDataRequest
          ? _value.createDataRequest
          : createDataRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      msgBase: freezed == msgBase
          ? _value.msgBase
          : msgBase // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseStateCopyWith<$Res> implements $BaseStateCopyWith<$Res> {
  factory _$$_BaseStateCopyWith(
          _$_BaseState value, $Res Function(_$_BaseState) then) =
      __$$_BaseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BaseData>? base,
      int? baseSelected,
      bool? baseLoading,
      bool? createDataRequest,
      String? msgBase});
}

/// @nodoc
class __$$_BaseStateCopyWithImpl<$Res>
    extends _$BaseStateCopyWithImpl<$Res, _$_BaseState>
    implements _$$_BaseStateCopyWith<$Res> {
  __$$_BaseStateCopyWithImpl(
      _$_BaseState _value, $Res Function(_$_BaseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = freezed,
    Object? baseSelected = freezed,
    Object? baseLoading = freezed,
    Object? createDataRequest = freezed,
    Object? msgBase = freezed,
  }) {
    return _then(_$_BaseState(
      base: freezed == base
          ? _value._base
          : base // ignore: cast_nullable_to_non_nullable
              as List<BaseData>?,
      baseSelected: freezed == baseSelected
          ? _value.baseSelected
          : baseSelected // ignore: cast_nullable_to_non_nullable
              as int?,
      baseLoading: freezed == baseLoading
          ? _value.baseLoading
          : baseLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      createDataRequest: freezed == createDataRequest
          ? _value.createDataRequest
          : createDataRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      msgBase: freezed == msgBase
          ? _value.msgBase
          : msgBase // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BaseState extends _BaseState {
  const _$_BaseState(
      {final List<BaseData>? base = const [],
      this.baseSelected = 0,
      this.baseLoading = false,
      this.createDataRequest = true,
      this.msgBase = "Loading..."})
      : _base = base,
        super._();

  final List<BaseData>? _base;
  @override
  @JsonKey()
  List<BaseData>? get base {
    final value = _base;
    if (value == null) return null;
    if (_base is EqualUnmodifiableListView) return _base;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int? baseSelected;
  @override
  @JsonKey()
  final bool? baseLoading;
  @override
  @JsonKey()
  final bool? createDataRequest;
  @override
  @JsonKey()
  final String? msgBase;

  @override
  String toString() {
    return 'BaseState(base: $base, baseSelected: $baseSelected, baseLoading: $baseLoading, createDataRequest: $createDataRequest, msgBase: $msgBase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseState &&
            const DeepCollectionEquality().equals(other._base, _base) &&
            (identical(other.baseSelected, baseSelected) ||
                other.baseSelected == baseSelected) &&
            (identical(other.baseLoading, baseLoading) ||
                other.baseLoading == baseLoading) &&
            (identical(other.createDataRequest, createDataRequest) ||
                other.createDataRequest == createDataRequest) &&
            (identical(other.msgBase, msgBase) || other.msgBase == msgBase));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_base),
      baseSelected,
      baseLoading,
      createDataRequest,
      msgBase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateCopyWith<_$_BaseState> get copyWith =>
      __$$_BaseStateCopyWithImpl<_$_BaseState>(this, _$identity);
}

abstract class _BaseState extends BaseState {
  const factory _BaseState(
      {final List<BaseData>? base,
      final int? baseSelected,
      final bool? baseLoading,
      final bool? createDataRequest,
      final String? msgBase}) = _$_BaseState;
  const _BaseState._() : super._();

  @override
  List<BaseData>? get base;
  @override
  int? get baseSelected;
  @override
  bool? get baseLoading;
  @override
  bool? get createDataRequest;
  @override
  String? get msgBase;
  @override
  @JsonKey(ignore: true)
  _$$_BaseStateCopyWith<_$_BaseState> get copyWith =>
      throw _privateConstructorUsedError;
}