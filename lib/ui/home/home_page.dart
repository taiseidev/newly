import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    logger.i(state);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: state.maybeWhen(
            data: (data) {
              return Text(data.length.toString());
            },
            orElse: SizedBox.shrink,
          ),
        ),
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
                    ),
            child: const Text('追加'),
          ),
        ),
      ],
    );
  }
}
