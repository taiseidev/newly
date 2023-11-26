import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nost/features/activities/domain/activity.dart';
import 'package:stacked_listview/stacked_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          child: _ActivityItem(
            activity: Activity(
              title: '今日の投稿',
              description: '今日の投稿です',
            ),
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
        Expanded(
          child: StackedListView(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 8,
            ),
            itemCount: dummyActivities.length,
            itemExtent: 200,
            heightFactor: 0.8,
            onRemove: (index, direction) {},
            beforeRemove: (index, direction) async {
              return true;
            },
            builder: (_, index) {
              final activity = dummyActivities[index];
              return Hero(
                tag: activity,
                child: _ActivityItem(
                  activity: activity,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ActivityDetail extends StatelessWidget {
  const ActivityDetail(this.activity, {super.key});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: activity,
      child: Scaffold(
        body: Column(
          children: [
            const Text('テスト'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({
    required this.activity,
    super.key,
  });

  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => ActivityDetail(activity),
            fullscreenDialog: true,
          ),
        );
      },
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
                        color: Colors.grey, //色
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

final dummyActivities = [
  Activity(
    title: '初めてのハーブティー作り',
    description:
        '今日は、初めて自分でハーブティーを作ってみました。使ったのは、レモングラスとカモミール。香り高いレモングラスと、リラックス効果のあるカモミールの組み合わせです。水を沸騰させてハーブを浸し、5分待つだけ。',
  ),
  Activity(
    title: '星空観察の魅力',
    description:
        '今夜は久しぶりに晴れたので、星空観察に挑戦してみました。家の近くの公園で、寝転びながら空を見上げると、都市の光に隠れがちな星々が見え始めました。特に、北斗七星は明るく輝いていて、その美しさに心奪われました。',
  ),
  Activity(
    title: '手作りパンの挑戦',
    description:
        '今日は初めてパン作りに挑戦しました。イーストを使って生地を発酵させる過程は、まるで魔法のよう。オーブンから出てきたパンは外はサクサク、中はふわふわ。自分で作ったパンの味は格別で、朝食が楽しみになりました。',
  ),
  Activity(
    title: '新しいレシピで料理',
    description: '家で作ったことのない料理に挑戦し、そのプロセスや完成した料理の写真を記録。',
  ),
  Activity(
    title: '読書感想',
    description: '新しく読んだ本の要約や感想を記録。特に新しい知識やインスピレーションを得た部分を強調。',
  ),
  Activity(
    title: '運動やフィットネスの挑戦',
    description: '新しい運動ルーチンやスポーツに挑戦した記録。達成感や体の変化を記録。',
  ),
  Activity(
    title: '言語学習',
    description: '新しい言語を学ぶ過程での進捗や発見を記録。例えば、新しく覚えた単語やフレーズ。',
  ),
  Activity(
    title: '旅行や散策',
    description: '新しい場所への訪問記録。訪れた場所の写真や感想、特に印象に残った点を記録。',
  ),
  Activity(
    title: '映画やドキュメンタリーの感想',
    description: '観た映画やドキュメンタリーから得たインスピレーションや考えを記録。',
  ),
  Activity(
    title: 'アートやクラフト',
    description: '新しいアート作品や手工芸品の作成プロセスと完成品の写真。',
  ),
];


// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nost/core/extension/async_value_ext.dart';
// import 'package:nost/features/activities/domain/activity.dart';
// import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
// import 'package:nost/main.dart';
// import 'package:nost/ui/home/home_notifier.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:uuid/uuid.dart';

// final class HomePage extends HookConsumerWidget {
//   const HomePage({super.key});

//   final uuid = const Uuid();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final titleController = useTextEditingController();
//     final descriptionController = useTextEditingController();

//     final user = ref.watch(userProvider);

//     ref.handleAsyncValue<void>(
//       homeNotifierProvider,
//       complete: (context, _) async {},
//       completeMessage: '完了しました！',
//     );

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {},
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const Text('↓毎日投稿の機能'),
//             const Text('タイトル'),
//             TextFormField(
//               controller: titleController,
//             ),
//             const Text('説明'),
//             TextFormField(
//               controller: descriptionController,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await ref.read(activityRepositoryProvider).insert(
//                       Activity(
//                         activityId: uuid.v4(),
//                         userId: Supabase.instance.client.auth.currentUser!.id,
//                         title: titleController.text,
//                         description: descriptionController.text,
//                       ),
//                     );
//               },
//               child: const Text('投稿'),
//             ),
//             ElevatedButton(
//               onPressed: () =>
//                   ref.read(homeNotifierProvider.notifier).signOut(),
//               child: const Text('ログアウト'),
//             ),
//             Text(user?.id ?? 'テスト'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final testProvider = FutureProvider<int>((ref) async {
//   await Future<void>.delayed(const Duration(seconds: 3));
//   return Future(() => 1);
// });
