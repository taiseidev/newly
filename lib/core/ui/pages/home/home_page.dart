import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nost/core/extension/async_value_ext.dart';
import 'package:nost/features/activities/domain/activity.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:nost/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

final class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  final uuid = const Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final user = ref.watch(userProvider);

    ref.handleAsyncValue<void>(
      testProvider,
      complete: (context, _) async {},
      completeMessage: '完了しました！',
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ref.invalidate(testProvider);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('↓毎日投稿の機能'),
            const Text('タイトル'),
            TextFormField(
              controller: titleController,
            ),
            const Text('説明'),
            TextFormField(
              controller: descriptionController,
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.read(activityRepositoryProvider).insert(
                      Activity(
                        activityId: uuid.v4(),
                        userId: Supabase.instance.client.auth.currentUser!.id,
                        title: titleController.text,
                        description: descriptionController.text,
                      ),
                    );
              },
              child: const Text('投稿'),
            ),
            Text(user?.id ?? 'テスト'),
          ],
        ),
      ),
    );
  }
}

final testProvider = FutureProvider<int>((ref) async {
  await Future<void>.delayed(const Duration(seconds: 3));
  return Future(() => 1);
});
