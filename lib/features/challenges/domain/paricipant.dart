import 'package:freezed_annotation/freezed_annotation.dart';

part 'paricipant.freezed.dart';
part 'paricipant.g.dart';

@freezed
class Paricipant with _$Paricipant {
  factory Paricipant({
    int? participantId,
    int? challengeId,
    int? userId,
    String? joinDate,
  }) = _Paricipant;

  factory Paricipant.fromJson(Map<String, dynamic> json) =>
      _$ParicipantFromJson(json);
}
