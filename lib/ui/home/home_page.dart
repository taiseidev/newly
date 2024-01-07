import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nost/core/extension/async_value_ext.dart';
import 'package:nost/core/utils/logger.dart';
import 'package:nost/ui/home/home_notifier.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);

    ref.handleAsyncValue(homeNotifierProvider);

    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final titleUpdateController = useTextEditingController();
    final descriptionUpdateController = useTextEditingController();
    final image = useState<List<File>?>(null);

    Future<void> getImageFromGallery() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        return;
      }

      if (image.value != null) {
        image.value!.add(File(pickedFile.path));
      } else {
        image.value = [File(pickedFile.path)];
      }
    }

    logger.i(state);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              child: state.maybeWhen(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final activity = data[index];
                      return Column(
                        children: [
                          Text(activity.title ?? ''),
                          Text(activity.description ?? ''),
                          if (activity.imageUrls != null)
                            SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: activity.imageUrls!.length,
                                itemBuilder: (context, index) {
                                  final img = activity.imageUrls![index];
                                  return Image.network(
                                    img,
                                    width: 50,
                                  );
                                },
                              ),
                            ),
                          const Text('↓更新処理'),
                          const Text('タイトル'),
                          TextFormField(
                            controller: titleUpdateController,
                          ),
                          const Text('内容'),
                          TextFormField(
                            controller: descriptionUpdateController,
                          ),
                          ElevatedButton(
                            onPressed: () => ref
                                .read(homeNotifierProvider.notifier)
                                .updateActivity(
                                  activity: activity,
                                  title: titleController.text,
                                  description: descriptionController.text,
                                ),
                            child: const Text('更新'),
                          ),
                          ElevatedButton(
                            onPressed: () => ref
                                .read(homeNotifierProvider.notifier)
                                .deleteActivity(activity.activityId),
                            child: const Text('削除ボタン'),
                          ),
                        ],
                      );
                    },
                  );
                },
                orElse: SizedBox.shrink,
              ),
            ),
          ),
          const Text('↓画像登録処理'),
          if (image.value != null)
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: image.value!.length,
                itemBuilder: (context, index) {
                  final img = image.value![index];
                  return Image.file(
                    img,
                    width: 50,
                    height: 50,
                  );
                },
              ),
            )
          else
            const SizedBox.shrink(),
          Align(
            child: ElevatedButton(
              onPressed: getImageFromGallery,
              child: const Text('画像追加'),
            ),
          ),
          const Text('↓登録処理'),
          const Text('タイトル'),
          TextFormField(
            controller: titleController,
          ),
          const Text('内容'),
          TextFormField(
            controller: descriptionController,
          ),
          Align(
            child: ElevatedButton(
              onPressed: () =>
                  ref.read(homeNotifierProvider.notifier).addActivity(
                        title: titleController.text,
                        description: descriptionController.text,
                        files: image.value ?? [],
                      ),
              child: const Text('追加'),
            ),
          ),
          ElevatedButton(
            onPressed: () => ref.read(homeNotifierProvider.notifier).createTag(
                  tagName: 'banana',
                  isPrivate: false,
                ),
            child: const Text('タグ追加'),
          ),
        ],
      ),
    );
  }
}
