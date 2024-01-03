import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nost/ui/home/home_notifier.dart';
import 'package:stacked_listview/stacked_listview.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(homeNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        switch (activities) {
          AsyncData(:final value) => SizedBox(
              height: 300,
              child: StackedListView(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 8,
                ),
                itemCount: value.length,
                itemExtent: 150,
                heightFactor: 0.8,
                onRemove: (index, direction) {},
                beforeRemove: (index, direction) async {
                  return true;
                },
                builder: (_, index) {
                  return const ListTile(title: Text('テスト'));
                },
              ),
            ),
          AsyncError(:final error) => Text('error: $error'),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        },
      ],
    );
  }
}
