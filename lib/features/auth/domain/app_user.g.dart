// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AppUserImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'user_id',
            'username',
            'email',
            'password_hash',
            'is_premium',
            'premium_start_date',
            'premium_end_date'
          ],
        );
        final val = _$AppUserImpl(
          userId: $checkedConvert('user_id', (v) => v as int?),
          username: $checkedConvert('username', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          passwordHash: $checkedConvert('password_hash', (v) => v as String?),
          isPremium: $checkedConvert('is_premium', (v) => v as bool?),
          premiumStartDate: $checkedConvert('premium_start_date',
              (v) => v == null ? null : DateTime.parse(v as String)),
          premiumEndDate: $checkedConvert('premium_end_date',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'passwordHash': 'password_hash',
        'isPremium': 'is_premium',
        'premiumStartDate': 'premium_start_date',
        'premiumEndDate': 'premium_end_date'
      },
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'password_hash': instance.passwordHash,
      'is_premium': instance.isPremium,
      'premium_start_date': instance.premiumStartDate?.toIso8601String(),
      'premium_end_date': instance.premiumEndDate?.toIso8601String(),
    };
