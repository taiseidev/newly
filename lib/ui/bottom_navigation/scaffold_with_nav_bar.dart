import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nost/core/navigation/routes/main/main_route.dart';
import 'package:nost/ui/bottom_navigation/scaffold_with_nav_bar_notifier.dart';

final class ScaffoldWithNavBar extends ConsumerWidget {
  ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.ease,
      animationDuration: const Duration(milliseconds: 300),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'ロゴを挿入する',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: _advancedDrawerController.toggleDrawer,
                    icon: const FaIcon(
                      FontAwesomeIcons.xmark,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SettingItem(title: '通知設定'),
              const SettingItem(title: '通知設定'),
              const SettingItem(title: '通知設定'),
              const SettingItem(title: '通知設定'),
              const SettingItem(title: '通知設定'),
              const SettingItem(title: '通知設定'),
              const SettingItem(title: '通知設定'),
              const SettingItem(title: '通知設定'),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: IconButton(
              onPressed: () {
                HapticFeedback.heavyImpact();
                _advancedDrawerController.toggleDrawer();
              },
              icon: const FaIcon(FontAwesomeIcons.barsStaggered),
            ),
          ),
          title: const Text(
            'Newly',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                HapticFeedback.heavyImpact();
                const CalendarRoute().push<void>(context);
              },
              icon: const FaIcon(FontAwesomeIcons.calendar),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 24),
              child: IconButton(
                onPressed: HapticFeedback.heavyImpact,
                icon: Badge(
                  child: FaIcon(FontAwesomeIcons.solidBell),
                ),
              ),
            ),
          ],
        ),
        body: navigationShell,
        floatingActionButton: FloatingActionButton(
          // Activityを作成
          onPressed: () async {
            await ref
                .read(scaffoldWithNavBarNotifierProvider.notifier)
                .createActivity(
                  title: '一人映画',
                  description: '今日は一人で映画を見にいく',
                );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xffee8c00),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              ),
              label: '探す',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.timeline,
                size: 20,
              ),
              label: 'タイムライン',
            ),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.solidBell,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 40),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const FaIcon(
              FontAwesomeIcons.angleRight,
              size: 16,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
