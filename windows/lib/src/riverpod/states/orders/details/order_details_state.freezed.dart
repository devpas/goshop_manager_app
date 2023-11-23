// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdatingStatus => throw _privateConstructorUsedError;
  List<ShopOrderDetails> get shopOrderDetails =>
      throw _privateConstructorUsedError;
  OrderDetailsResponse? get orderDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailsStateCopyWith<OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res, OrderDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdatingStatus,
      List<ShopOrderDetails> shopOrderDetails,
      OrderDetailsResponse? orderDetails});
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res, $Val extends OrderDetailsState>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdatingStatus = null,
    Object? shopOrderDetails = null,
    Object? orderDetails = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _value.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shopOrderDetails: null == shopOrderDetails
          ? _value.shopOrderDetails
          : shopOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<ShopOrderDetails>,
      orderDetails: freezed == orderDetails
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as OrderDetailsResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailsStateImplCopyWith<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  factory _$$OrderDetailsStateImplCopyWith(_$OrderDetailsStateImpl value,
          $Res Function(_$OrderDetailsStateImpl) then) =
      __$$OrderDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdatingStatus,
      List<ShopOrderDetails> shopOrderDetails,
      OrderDetailsResponse? orderDetails});
}

/// @nodoc
class __$$OrderDetailsStateImplCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res, _$OrderDetailsStateImpl>
    implements _$$OrderDetailsStateImplCopyWith<$Res> {
  __$$OrderDetailsStateImplCopyWithImpl(_$OrderDetailsStateImpl _value,
      $Res Function(_$OrderDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdatingStatus = null,
    Object? shopOrderDetails = null,
    Object? orderDetails = freezed,
  }) {
    return _then(_$OrderDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _value.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shopOrderDetails: null == shopOrderDetails
          ? _value._shopOrderDetails
          : shopOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<ShopOrderDetails>,
      orderDetails: freezed == orderDetails
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as OrderDetailsResponse?,
    ));
  }
}

/// @nodoc

class _$OrderDetailsStateImpl extends _OrderDetailsState {
  const _$OrderDetailsStateImpl(
      {this.isLoading = false,
      this.isUpdatingStatus = false,
      final List<ShopOrderDetails> shopOrderDetails = const [],
      this.orderDetails})
      : _shopOrderDetails = shopOrderDetails,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdatingStatus;
  final List<ShopOrderDetails> _shopOrderDetails;
  @override
  @JsonKey()
  List<ShopOrderDetails> get shopOrderDetails {
    if (_shopOrderDetails is EqualUnmodifiableListView)
      return _shopOrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopOrderDetails);
  }

  @override
  final OrderDetailsResponse? orderDetails;

  @override
  String toString() {
    return 'OrderDetailsState(isLoading: $isLoading, isUpdatingStatus: $isUpdatingStatus, shopOrderDetails: $shopOrderDetails, orderDetails: $orderDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdatingStatus, isUpdatingStatus) ||
                other.isUpdatingStatus == isUpdatingStatus) &&
            const DeepCollectionEquality()
                .equals(other._shopOrderDetails, _shopOrderDetails) &&
            (identical(other.orderDetails, orderDetails) ||
                other.orderDetails == orderDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isUpdatingStatus,
      const DeepCollectionEquality().hash(_shopOrderDetails), orderDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailsStateImplCopyWith<_$OrderDetailsStateImpl> get copyWith =>
      __$$OrderDetailsStateImplCopyWithImpl<_$OrderDetailsStateImpl>(
          this, _$identity);
}

abstract class _OrderDetailsState extends OrderDetailsState {
  const factory _OrderDetailsState(
      {final bool isLoading,
      final bool isUpdatingStatus,
      final List<ShopOrderDetails> shopOrderDetails,
      final OrderDetailsResponse? orderDetails}) = _$OrderDetailsStateImpl;
  const _OrderDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isUpdatingStatus;
  @override
  List<ShopOrderDetails> get shopOrderDetails;
  @override
  OrderDetailsResponse? get orderDetails;
  @override
  @JsonKey(ignore: true)
  _$$OrderDetailsStateImplCopyWith<_$OrderDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
