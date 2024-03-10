// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSearch,
    required TResult Function(ProductsResponse productsResponse) successSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSearch,
    TResult? Function(ProductsResponse productsResponse)? successSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSearch,
    TResult Function(ProductsResponse productsResponse)? successSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingSearch value) loadingSearch,
    required TResult Function(SuccessSearch value) successSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingSearch value)? loadingSearch,
    TResult? Function(SuccessSearch value)? successSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadingSearch value)? loadingSearch,
    TResult Function(SuccessSearch value)? successSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSearch,
    required TResult Function(ProductsResponse productsResponse) successSearch,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSearch,
    TResult? Function(ProductsResponse productsResponse)? successSearch,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSearch,
    TResult Function(ProductsResponse productsResponse)? successSearch,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingSearch value) loadingSearch,
    required TResult Function(SuccessSearch value) successSearch,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingSearch value)? loadingSearch,
    TResult? Function(SuccessSearch value)? successSearch,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadingSearch value)? loadingSearch,
    TResult Function(SuccessSearch value)? successSearch,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SearchState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingSearchImplCopyWith<$Res> {
  factory _$$LoadingSearchImplCopyWith(
          _$LoadingSearchImpl value, $Res Function(_$LoadingSearchImpl) then) =
      __$$LoadingSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingSearchImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$LoadingSearchImpl>
    implements _$$LoadingSearchImplCopyWith<$Res> {
  __$$LoadingSearchImplCopyWithImpl(
      _$LoadingSearchImpl _value, $Res Function(_$LoadingSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingSearchImpl implements LoadingSearch {
  const _$LoadingSearchImpl();

  @override
  String toString() {
    return 'SearchState.loadingSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSearch,
    required TResult Function(ProductsResponse productsResponse) successSearch,
  }) {
    return loadingSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSearch,
    TResult? Function(ProductsResponse productsResponse)? successSearch,
  }) {
    return loadingSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSearch,
    TResult Function(ProductsResponse productsResponse)? successSearch,
    required TResult orElse(),
  }) {
    if (loadingSearch != null) {
      return loadingSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingSearch value) loadingSearch,
    required TResult Function(SuccessSearch value) successSearch,
  }) {
    return loadingSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingSearch value)? loadingSearch,
    TResult? Function(SuccessSearch value)? successSearch,
  }) {
    return loadingSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadingSearch value)? loadingSearch,
    TResult Function(SuccessSearch value)? successSearch,
    required TResult orElse(),
  }) {
    if (loadingSearch != null) {
      return loadingSearch(this);
    }
    return orElse();
  }
}

abstract class LoadingSearch implements SearchState {
  const factory LoadingSearch() = _$LoadingSearchImpl;
}

/// @nodoc
abstract class _$$SuccessSearchImplCopyWith<$Res> {
  factory _$$SuccessSearchImplCopyWith(
          _$SuccessSearchImpl value, $Res Function(_$SuccessSearchImpl) then) =
      __$$SuccessSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductsResponse productsResponse});
}

/// @nodoc
class __$$SuccessSearchImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SuccessSearchImpl>
    implements _$$SuccessSearchImplCopyWith<$Res> {
  __$$SuccessSearchImplCopyWithImpl(
      _$SuccessSearchImpl _value, $Res Function(_$SuccessSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsResponse = null,
  }) {
    return _then(_$SuccessSearchImpl(
      null == productsResponse
          ? _value.productsResponse
          : productsResponse // ignore: cast_nullable_to_non_nullable
              as ProductsResponse,
    ));
  }
}

/// @nodoc

class _$SuccessSearchImpl implements SuccessSearch {
  const _$SuccessSearchImpl(this.productsResponse);

  @override
  final ProductsResponse productsResponse;

  @override
  String toString() {
    return 'SearchState.successSearch(productsResponse: $productsResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessSearchImpl &&
            (identical(other.productsResponse, productsResponse) ||
                other.productsResponse == productsResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productsResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessSearchImplCopyWith<_$SuccessSearchImpl> get copyWith =>
      __$$SuccessSearchImplCopyWithImpl<_$SuccessSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingSearch,
    required TResult Function(ProductsResponse productsResponse) successSearch,
  }) {
    return successSearch(productsResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingSearch,
    TResult? Function(ProductsResponse productsResponse)? successSearch,
  }) {
    return successSearch?.call(productsResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingSearch,
    TResult Function(ProductsResponse productsResponse)? successSearch,
    required TResult orElse(),
  }) {
    if (successSearch != null) {
      return successSearch(productsResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingSearch value) loadingSearch,
    required TResult Function(SuccessSearch value) successSearch,
  }) {
    return successSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingSearch value)? loadingSearch,
    TResult? Function(SuccessSearch value)? successSearch,
  }) {
    return successSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadingSearch value)? loadingSearch,
    TResult Function(SuccessSearch value)? successSearch,
    required TResult orElse(),
  }) {
    if (successSearch != null) {
      return successSearch(this);
    }
    return orElse();
  }
}

abstract class SuccessSearch implements SearchState {
  const factory SuccessSearch(final ProductsResponse productsResponse) =
      _$SuccessSearchImpl;

  ProductsResponse get productsResponse;
  @JsonKey(ignore: true)
  _$$SuccessSearchImplCopyWith<_$SuccessSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
