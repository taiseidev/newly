import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  factory Activity({
    required String activityId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? userId,
    String? title,
    String? description,
    List<String>? imageUrls,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
