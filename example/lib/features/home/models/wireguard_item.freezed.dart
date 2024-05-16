// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wireguard_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WireguardItem _$WireguardItemFromJson(Map<String, dynamic> json) {
  return _WireguardItem.fromJson(json);
}

/// @nodoc
mixin _$WireguardItem {
  String get private_key => throw _privateConstructorUsedError;
  String get public_key => throw _privateConstructorUsedError;
  String get preshared_key => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  List<String> get allocated_ips => throw _privateConstructorUsedError;
  List<String> get allowed_ips => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WireguardItemCopyWith<WireguardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WireguardItemCopyWith<$Res> {
  factory $WireguardItemCopyWith(
          WireguardItem value, $Res Function(WireguardItem) then) =
      _$WireguardItemCopyWithImpl<$Res, WireguardItem>;
  @useResult
  $Res call(
      {String private_key,
      String public_key,
      String preshared_key,
      String endpoint,
      List<String> allocated_ips,
      List<String> allowed_ips});
}

/// @nodoc
class _$WireguardItemCopyWithImpl<$Res, $Val extends WireguardItem>
    implements $WireguardItemCopyWith<$Res> {
  _$WireguardItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? public_key = null,
    Object? preshared_key = null,
    Object? endpoint = null,
    Object? allocated_ips = null,
    Object? allowed_ips = null,
  }) {
    return _then(_value.copyWith(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      public_key: null == public_key
          ? _value.public_key
          : public_key // ignore: cast_nullable_to_non_nullable
              as String,
      preshared_key: null == preshared_key
          ? _value.preshared_key
          : preshared_key // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      allocated_ips: null == allocated_ips
          ? _value.allocated_ips
          : allocated_ips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowed_ips: null == allowed_ips
          ? _value.allowed_ips
          : allowed_ips // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WireguardItemImplCopyWith<$Res>
    implements $WireguardItemCopyWith<$Res> {
  factory _$$WireguardItemImplCopyWith(
          _$WireguardItemImpl value, $Res Function(_$WireguardItemImpl) then) =
      __$$WireguardItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String private_key,
      String public_key,
      String preshared_key,
      String endpoint,
      List<String> allocated_ips,
      List<String> allowed_ips});
}

/// @nodoc
class __$$WireguardItemImplCopyWithImpl<$Res>
    extends _$WireguardItemCopyWithImpl<$Res, _$WireguardItemImpl>
    implements _$$WireguardItemImplCopyWith<$Res> {
  __$$WireguardItemImplCopyWithImpl(
      _$WireguardItemImpl _value, $Res Function(_$WireguardItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? public_key = null,
    Object? preshared_key = null,
    Object? endpoint = null,
    Object? allocated_ips = null,
    Object? allowed_ips = null,
  }) {
    return _then(_$WireguardItemImpl(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      public_key: null == public_key
          ? _value.public_key
          : public_key // ignore: cast_nullable_to_non_nullable
              as String,
      preshared_key: null == preshared_key
          ? _value.preshared_key
          : preshared_key // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      allocated_ips: null == allocated_ips
          ? _value._allocated_ips
          : allocated_ips // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowed_ips: null == allowed_ips
          ? _value._allowed_ips
          : allowed_ips // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WireguardItemImpl implements _WireguardItem {
  const _$WireguardItemImpl(
      {required this.private_key,
      required this.public_key,
      required this.preshared_key,
      required this.endpoint,
      required final List<String> allocated_ips,
      required final List<String> allowed_ips})
      : _allocated_ips = allocated_ips,
        _allowed_ips = allowed_ips;

  factory _$WireguardItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WireguardItemImplFromJson(json);

  @override
  final String private_key;
  @override
  final String public_key;
  @override
  final String preshared_key;
  @override
  final String endpoint;
  final List<String> _allocated_ips;
  @override
  List<String> get allocated_ips {
    if (_allocated_ips is EqualUnmodifiableListView) return _allocated_ips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocated_ips);
  }

  final List<String> _allowed_ips;
  @override
  List<String> get allowed_ips {
    if (_allowed_ips is EqualUnmodifiableListView) return _allowed_ips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowed_ips);
  }

  @override
  String toString() {
    return 'WireguardItem(private_key: $private_key, public_key: $public_key, preshared_key: $preshared_key, endpoint: $endpoint, allocated_ips: $allocated_ips, allowed_ips: $allowed_ips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WireguardItemImpl &&
            (identical(other.private_key, private_key) ||
                other.private_key == private_key) &&
            (identical(other.public_key, public_key) ||
                other.public_key == public_key) &&
            (identical(other.preshared_key, preshared_key) ||
                other.preshared_key == preshared_key) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            const DeepCollectionEquality()
                .equals(other._allocated_ips, _allocated_ips) &&
            const DeepCollectionEquality()
                .equals(other._allowed_ips, _allowed_ips));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      private_key,
      public_key,
      preshared_key,
      endpoint,
      const DeepCollectionEquality().hash(_allocated_ips),
      const DeepCollectionEquality().hash(_allowed_ips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WireguardItemImplCopyWith<_$WireguardItemImpl> get copyWith =>
      __$$WireguardItemImplCopyWithImpl<_$WireguardItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WireguardItemImplToJson(
      this,
    );
  }
}

abstract class _WireguardItem implements WireguardItem {
  const factory _WireguardItem(
      {required final String private_key,
      required final String public_key,
      required final String preshared_key,
      required final String endpoint,
      required final List<String> allocated_ips,
      required final List<String> allowed_ips}) = _$WireguardItemImpl;

  factory _WireguardItem.fromJson(Map<String, dynamic> json) =
      _$WireguardItemImpl.fromJson;

  @override
  String get private_key;
  @override
  String get public_key;
  @override
  String get preshared_key;
  @override
  String get endpoint;
  @override
  List<String> get allocated_ips;
  @override
  List<String> get allowed_ips;
  @override
  @JsonKey(ignore: true)
  _$$WireguardItemImplCopyWith<_$WireguardItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
