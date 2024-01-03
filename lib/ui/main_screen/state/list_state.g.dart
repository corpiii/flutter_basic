// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListStateImpl _$$ListStateImplFromJson(Map<String, dynamic> json) =>
    _$ListStateImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLoading: json['isLoading'] as bool,
    );

Map<String, dynamic> _$$ListStateImplToJson(_$ListStateImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
      'isLoading': instance.isLoading,
    };
