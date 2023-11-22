// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paricipant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Paricipant _$ParicipantFromJson(Map<String, dynamic> json) {
  return _Paricipant.fromJson(json);
}

/// @nodoc
mixin _$Paricipant {
  int? get participantId => throw _privateConstructorUsedError;
  int? get challengeId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get joinDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParicipantCopyWith<Paricipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParicipantCopyWith<$Res> {
  factory $ParicipantCopyWith(
          Paricipant value, $Res Function(Paricipant) then) =
      _$ParicipantCopyWithImpl<$Res, Paricipant>;
  @useResult
  $Res call(
      {int? participantId, int? challengeId, int? userId, String? joinDate});
}

/// @nodoc
class _$ParicipantCopyWithImpl<$Res, $Val extends Paricipant>
    implements $ParicipantCopyWith<$Res> {
  _$ParicipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = freezed,
    Object? challengeId = freezed,
    Object? userId = freezed,
    Object? joinDate = freezed,
  }) {
    return _then(_value.copyWith(
      participantId: freezed == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParicipantImplCopyWith<$Res>
    implements $ParicipantCopyWith<$Res> {
  factory _$$ParicipantImplCopyWith(
          _$ParicipantImpl value, $Res Function(_$ParicipantImpl) then) =
      __$$ParicipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? participantId, int? challengeId, int? userId, String? joinDate});
}

/// @nodoc
class __$$ParicipantImplCopyWithImpl<$Res>
    extends _$ParicipantCopyWithImpl<$Res, _$ParicipantImpl>
    implements _$$ParicipantImplCopyWith<$Res> {
  __$$ParicipantImplCopyWithImpl(
      _$ParicipantImpl _value, $Res Function(_$ParicipantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = freezed,
    Object? challengeId = freezed,
    Object? userId = freezed,
    Object? joinDate = freezed,
  }) {
    return _then(_$ParicipantImpl(
      participantId: freezed == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as int?,
      challengeId: freezed == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParicipantImpl implements _Paricipant {
  _$ParicipantImpl(
      {this.participantId, this.challengeId, this.userId, this.joinDate});

  factory _$ParicipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParicipantImplFromJson(json);

  @override
  final int? participantId;
  @override
  final int? challengeId;
  @override
  final int? userId;
  @override
  final String? joinDate;

  @override
  String toString() {
    return 'Paricipant(participantId: $participantId, challengeId: $challengeId, userId: $userId, joinDate: $joinDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParicipantImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, participantId, challengeId, userId, joinDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParicipantImplCopyWith<_$ParicipantImpl> get copyWith =>
      __$$ParicipantImplCopyWithImpl<_$ParicipantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParicipantImplToJson(
      this,
    );
  }
}

abstract class _Paricipant implements Paricipant {
  factory _Paricipant(
      {final int? participantId,
      final int? challengeId,
      final int? userId,
      final String? joinDate}) = _$ParicipantImpl;

  factory _Paricipant.fromJson(Map<String, dynamic> json) =
      _$ParicipantImpl.fromJson;

  @override
  int? get participantId;
  @override
  int? get challengeId;
  @override
  int? get userId;
  @override
  String? get joinDate;
  @override
  @JsonKey(ignore: true)
  _$$ParicipantImplCopyWith<_$ParicipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
