// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_tunnel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerTunnel _$ServerTunnelFromJson(Map<String, dynamic> json) {
  return _ServerTunnel.fromJson(json);
}

/// @nodoc
mixin _$ServerTunnel {
  String get private_key => throw _privateConstructorUsedError;
  String get public_key => throw _privateConstructorUsedError;
  String get preshared_key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get use_server_dns => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerTunnelCopyWith<ServerTunnel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerTunnelCopyWith<$Res> {
  factory $ServerTunnelCopyWith(
          ServerTunnel value, $Res Function(ServerTunnel) then) =
      _$ServerTunnelCopyWithImpl<$Res, ServerTunnel>;
  @useResult
  $Res call(
      {String private_key,
      String public_key,
      String preshared_key,
      String name,
      bool use_server_dns,
      bool enabled,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$ServerTunnelCopyWithImpl<$Res, $Val extends ServerTunnel>
    implements $ServerTunnelCopyWith<$Res> {
  _$ServerTunnelCopyWithImpl(this._value, this._then);

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
    Object? name = null,
    Object? use_server_dns = null,
    Object? enabled = null,
    Object? created_at = null,
    Object? updated_at = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      use_server_dns: null == use_server_dns
          ? _value.use_server_dns
          : use_server_dns // ignore: cast_nullable_to_non_nullable
              as bool,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerTunnelImplCopyWith<$Res>
    implements $ServerTunnelCopyWith<$Res> {
  factory _$$ServerTunnelImplCopyWith(
          _$ServerTunnelImpl value, $Res Function(_$ServerTunnelImpl) then) =
      __$$ServerTunnelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String private_key,
      String public_key,
      String preshared_key,
      String name,
      bool use_server_dns,
      bool enabled,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$$ServerTunnelImplCopyWithImpl<$Res>
    extends _$ServerTunnelCopyWithImpl<$Res, _$ServerTunnelImpl>
    implements _$$ServerTunnelImplCopyWith<$Res> {
  __$$ServerTunnelImplCopyWithImpl(
      _$ServerTunnelImpl _value, $Res Function(_$ServerTunnelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? public_key = null,
    Object? preshared_key = null,
    Object? name = null,
    Object? use_server_dns = null,
    Object? enabled = null,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$ServerTunnelImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      use_server_dns: null == use_server_dns
          ? _value.use_server_dns
          : use_server_dns // ignore: cast_nullable_to_non_nullable
              as bool,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerTunnelImpl implements _ServerTunnel {
  const _$ServerTunnelImpl(
      {required this.private_key,
      required this.public_key,
      required this.preshared_key,
      required this.name,
      required this.use_server_dns,
      required this.enabled,
      required this.created_at,
      required this.updated_at});

  factory _$ServerTunnelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerTunnelImplFromJson(json);

  @override
  final String private_key;
  @override
  final String public_key;
  @override
  final String preshared_key;
  @override
  final String name;
  @override
  final bool use_server_dns;
  @override
  final bool enabled;
  @override
  final String created_at;
  @override
  final String updated_at;

  @override
  String toString() {
    return 'ServerTunnel(private_key: $private_key, public_key: $public_key, preshared_key: $preshared_key, name: $name, use_server_dns: $use_server_dns, enabled: $enabled, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerTunnelImpl &&
            (identical(other.private_key, private_key) ||
                other.private_key == private_key) &&
            (identical(other.public_key, public_key) ||
                other.public_key == public_key) &&
            (identical(other.preshared_key, preshared_key) ||
                other.preshared_key == preshared_key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.use_server_dns, use_server_dns) ||
                other.use_server_dns == use_server_dns) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private_key, public_key,
      preshared_key, name, use_server_dns, enabled, created_at, updated_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerTunnelImplCopyWith<_$ServerTunnelImpl> get copyWith =>
      __$$ServerTunnelImplCopyWithImpl<_$ServerTunnelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerTunnelImplToJson(
      this,
    );
  }
}

abstract class _ServerTunnel implements ServerTunnel {
  const factory _ServerTunnel(
      {required final String private_key,
      required final String public_key,
      required final String preshared_key,
      required final String name,
      required final bool use_server_dns,
      required final bool enabled,
      required final String created_at,
      required final String updated_at}) = _$ServerTunnelImpl;

  factory _ServerTunnel.fromJson(Map<String, dynamic> json) =
      _$ServerTunnelImpl.fromJson;

  @override
  String get private_key;
  @override
  String get public_key;
  @override
  String get preshared_key;
  @override
  String get name;
  @override
  bool get use_server_dns;
  @override
  bool get enabled;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$ServerTunnelImplCopyWith<_$ServerTunnelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
