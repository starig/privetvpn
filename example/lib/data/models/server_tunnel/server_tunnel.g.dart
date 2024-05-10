// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_tunnel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerTunnelImpl _$$ServerTunnelImplFromJson(Map<String, dynamic> json) =>
    _$ServerTunnelImpl(
      private_key: json['private_key'] as String,
      public_key: json['public_key'] as String,
      preshared_key: json['preshared_key'] as String,
      name: json['name'] as String,
      use_server_dns: json['use_server_dns'] as bool,
      enabled: json['enabled'] as bool,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$ServerTunnelImplToJson(_$ServerTunnelImpl instance) =>
    <String, dynamic>{
      'private_key': instance.private_key,
      'public_key': instance.public_key,
      'preshared_key': instance.preshared_key,
      'name': instance.name,
      'use_server_dns': instance.use_server_dns,
      'enabled': instance.enabled,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
