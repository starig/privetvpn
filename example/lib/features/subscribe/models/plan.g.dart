// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanImpl _$$PlanImplFromJson(Map<String, dynamic> json) => _$PlanImpl(
      period: json['period'] as String,
      summary: json['summary'] as int,
      monthly: json['monthly'] as int,
    );

Map<String, dynamic> _$$PlanImplToJson(_$PlanImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'summary': instance.summary,
      'monthly': instance.monthly,
    };
