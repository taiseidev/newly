import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nost/features/activities/domain/activity.dart';
import 'package:nost/ui/home/home_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stacked_listview/stacked_listview.dart';

part 'home_page.g.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(homeNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 24,
          ),
          child: Text(
            '今日の新しい事',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xffee8c00),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: ProviderScope(
            overrides: [
              _currentActivityProvider.overrideWith(
                (ref) => Activity(
                  activityId: 'テスト',
                  title: 'テスト',
                  description: 'テスト🚀',
                ),
              ),
            ],
            child: const _ActivityItem(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 24,
          ),
          child: Text(
            '履歴一覧',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xffee8c00),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        switch (activities) {
          AsyncData(:final value) => Expanded(
              child: StackedListView(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 8,
                ),
                itemCount: value.length,
                itemExtent: 200,
                heightFactor: 0.8,
                onRemove: (index, direction) {},
                beforeRemove: (index, direction) async {
                  return true;
                },
                builder: (_, index) {
                  final activity = value[index];
                  return Hero(
                    tag: activity,
                    child: ProviderScope(
                      overrides: [
                        _currentActivityProvider
                            .overrideWith((ref) => activity),
                      ],
                      child: const _ActivityItem(),
                    ),
                  );
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

@riverpod
Activity _currentActivity(_CurrentActivityRef ref) =>
    throw UnimplementedError();

class _ActivityItem extends ConsumerWidget {
  const _ActivityItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(_currentActivityProvider);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 8,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(2, 1),
                      ),
                    ],
                  ),
                  child: const Text('🚀'),
                ),
                const SizedBox(width: 16),
                const Text(
                  '料理',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                const FaIcon(
                  FontAwesomeIcons.share,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 16,
                ),
                const FaIcon(
                  FontAwesomeIcons.heart,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      activity.title!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xffee8c00),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  activity.description!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityDetailPage extends StatelessWidget {
  const ActivityDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('テスト'),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('戻る'),
          ),
        ],
      ),
    );
  }
}
