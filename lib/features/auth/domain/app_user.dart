import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    int? userId,
    String? username,
    String? email,
    String? passwordHash,
    bool? isPremium,
    DateTime? premiumStartDate,
    DateTime? premiumEndDate,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
