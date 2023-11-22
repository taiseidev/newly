// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paricipant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParicipantImpl _$$ParicipantImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ParicipantImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'participant_id',
            'challenge_id',
            'user_id',
            'join_date'
          ],
        );
        final val = _$ParicipantImpl(
          participantId: $checkedConvert('participant_id', (v) => v as int?),
          challengeId: $checkedConvert('challenge_id', (v) => v as int?),
          userId: $checkedConvert('user_id', (v) => v as int?),
          joinDate: $checkedConvert('join_date', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'participantId': 'participant_id',
        'challengeId': 'challenge_id',
        'userId': 'user_id',
        'joinDate': 'join_date'
      },
    );

Map<String, dynamic> _$$ParicipantImplToJson(_$ParicipantImpl instance) =>
    <String, dynamic>{
      'participant_id': instance.participantId,
      'challenge_id': instance.challengeId,
      'user_id': instance.userId,
      'join_date': instance.joinDate,
    };
