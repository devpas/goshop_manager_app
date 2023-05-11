// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsState {
  List<ProductPasData>? get products => throw _privateConstructorUsedError;
  List<ProductPasData>? get productsAfterFilter =>
      throw _privateConstructorUsedError;
  ProductPasData? get productsSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {List<ProductPasData>? products,
      List<ProductPasData>? productsAfterFilter,
      ProductPasData? productsSelected});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? productsAfterFilter = freezed,
    Object? productsSelected = freezed,
  }) {
    return _then(_value.copyWith(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductPasData>?,
      productsAfterFilter: freezed == productsAfterFilter
          ? _value.productsAfterFilter
          : productsAfterFilter // ignore: cast_nullable_to_non_nullable
              as List<ProductPasData>?,
      productsSelected: freezed == productsSelected
          ? _value.productsSelected
          : productsSelected // ignore: cast_nullable_to_non_nullable
              as ProductPasData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsStateCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$_ProductsStateCopyWith(
          _$_ProductsState value, $Res Function(_$_ProductsState) then) =
      __$$_ProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductPasData>? products,
      List<ProductPasData>? productsAfterFilter,
      ProductPasData? productsSelected});
}

/// @nodoc
class __$$_ProductsStateCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$_ProductsState>
    implements _$$_ProductsStateCopyWith<$Res> {
  __$$_ProductsStateCopyWithImpl(
      _$_ProductsState _value, $Res Function(_$_ProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? productsAfterFilter = freezed,
    Object? productsSelected = freezed,
  }) {
    return _then(_$_ProductsState(
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductPasData>?,
      productsAfterFilter: freezed == productsAfterFilter
          ? _value._productsAfterFilter
          : productsAfterFilter // ignore: cast_nullable_to_non_nullable
              as List<ProductPasData>?,
      productsSelected: freezed == productsSelected
          ? _value.productsSelected
          : productsSelected // ignore: cast_nullable_to_non_nullable
              as ProductPasData?,
    ));
  }
}

/// @nodoc

class _$_ProductsState extends _ProductsState {
  const _$_ProductsState(
      {final List<ProductPasData>? products = const [],
      final List<ProductPasData>? productsAfterFilter = const [],
      this.productsSelected})
      : _products = products,
        _productsAfterFilter = productsAfterFilter,
        super._();

  final List<ProductPasData>? _products;
  @override
  @JsonKey()
  List<ProductPasData>? get products {
    final value = _products;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductPasData>? _productsAfterFilter;
  @override
  @JsonKey()
  List<ProductPasData>? get productsAfterFilter {
    final value = _productsAfterFilter;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ProductPasData? productsSelected;

  @override
  String toString() {
    return 'ProductsState(products: $products, productsAfterFilter: $productsAfterFilter, productsSelected: $productsSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._productsAfterFilter, _productsAfterFilter) &&
            (identical(other.productsSelected, productsSelected) ||
                other.productsSelected == productsSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_productsAfterFilter),
      productsSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      __$$_ProductsStateCopyWithImpl<_$_ProductsState>(this, _$identity);
}

abstract class _ProductsState extends ProductsState {
  const factory _ProductsState(
      {final List<ProductPasData>? products,
      final List<ProductPasData>? productsAfterFilter,
      final ProductPasData? productsSelected}) = _$_ProductsState;
  const _ProductsState._() : super._();

  @override
  List<ProductPasData>? get products;
  @override
  List<ProductPasData>? get productsAfterFilter;
  @override
  ProductPasData? get productsSelected;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
