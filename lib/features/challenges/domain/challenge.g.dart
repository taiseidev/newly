// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeImpl _$$ChallengeImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ChallengeImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'challenge_id',
            'title',
            'description',
            'start_date',
            'end_date'
          ],
        );
        final val = _$ChallengeImpl(
          challengeId: $checkedConvert('challenge_id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          startDate: $checkedConvert('start_date', (v) => v as String?),
          endDate: $checkedConvert('end_date', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'challengeId': 'challenge_id',
        'startDate': 'start_date',
        'endDate': 'end_date'
      },
    );

Map<String, dynamic> _$$ChallengeImplToJson(_$ChallengeImpl instance) =>
    <String, dynamic>{
      'challenge_id': instance.challengeId,
      'title': instance.title,
      'description': instance.description,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
