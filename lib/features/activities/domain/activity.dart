import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  factory Activity({
    required String activityId,
    String? userId,
    // String? icon,
    String? title,
    // Tag? tag,
    String? description,
    String? imageUrl,
    String? createdAt,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

// class TagConverter implements JsonConverter<Tag, String> {
//   const TagConverter();

//   @override
//   Tag fromJson(String json) {
//     return Tag(tagId: , name: );
//   }

//   @override
//   String toJson(DateTime dateTime) {
//     return dateTime.toLocal().toString();
//   }
// }
