// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wireguard_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WireguardItemImpl _$$WireguardItemImplFromJson(Map<String, dynamic> json) =>
    _$WireguardItemImpl(
      private_key: json['private_key'] as String,
      public_key: json['public_key'] as String,
      preshared_key: json['preshared_key'] as String,
      endpoint: json['endpoint'] as String,
      allocated_ips: (json['allocated_ips'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      allowed_ips: (json['allowed_ips'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$WireguardItemImplToJson(_$WireguardItemImpl instance) =>
    <String, dynamic>{
      'private_key': instance.private_key,
      'public_key': instance.public_key,
      'preshared_key': instance.preshared_key,
      'endpoint': instance.endpoint,
      'allocated_ips': instance.allocated_ips,
      'allowed_ips': instance.allowed_ips,
    };
