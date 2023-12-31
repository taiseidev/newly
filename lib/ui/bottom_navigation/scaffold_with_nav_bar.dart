// ignore: depend_on_referenced_packages
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
        color: const Color(0xff10425f).withOpacity(0.9),
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
        extendBody: true,
        backgroundColor: const Color(0xff10425f),
        appBar: AppBar(
          elevation: 0,
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
          actions: const [
            Padding(
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
        bottomNavigationBar: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 135, 174),
              Color.fromARGB(255, 65, 195, 231),
              Color.fromARGB(255, 145, 254, 245),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: DotNavigationBar(
            backgroundColor: const Color(0xff0d3153),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.6),
            currentIndex: navigationShell.currentIndex,
            curve: Curves.fastEaseInToSlowEaseOut,
            enablePaddingAnimation: false,
            onTap: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            dotIndicatorColor: Colors.white,
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.favorite_border),
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.search),
              ),
            ],
          ),
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
