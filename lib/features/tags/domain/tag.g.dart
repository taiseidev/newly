// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$TagImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'name',
            'id',
            'created_at',
            'user_id',
            'is_private'
          ],
        );
        final val = _$TagImpl(
          name: $checkedConvert('name', (v) => v as String),
          id: $checkedConvert('id', (v) => v as String?),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          userId: $checkedConvert('user_id', (v) => v as String?),
          isPrivate: $checkedConvert('is_private', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'userId': 'user_id',
        'isPrivate': 'is_private'
      },
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'user_id': instance.userId,
      'is_private': instance.isPrivate,
    };
