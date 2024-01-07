import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:nost/core/extension/context_ext.dart';
import 'package:nost/core/i18n/strings.g.dart';
import 'package:nost/core/theme/app_theme.dart';
import 'package:nost/core/theme/theme_mode.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    const scaffoldKey = GlobalObjectKey<ScaffoldState>('');

    return Scaffold(
      key: scaffoldKey,
      drawer: const _Drawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: const FaIcon(FontAwesomeIcons.barsStaggered),
        ),
        title: Text(i18n.appTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              child: FaIcon(
                FontAwesomeIcons.solidBell,
                color: context.colorScheme.inverseSurface,
              ),
            ),
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // Themeが適切に適用されないためここで設定
        selectedItemColor: context.colorScheme.onSurface,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _Drawer extends HookConsumerWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDisplayColorTheme = useState(false);
    final str = i18n.drawer;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(150),
        bottomRight: Radius.circular(150),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const _DrawerHeader(),
            _DrawerListTile(
              title: str.theme,
              onTap: () =>
                  isDisplayColorTheme.value = !isDisplayColorTheme.value,
              icon: Icons.contrast,
              trailingIcon: isDisplayColorTheme.value
                  ? Icons.expand_more
                  : Icons.chevron_right,
            ),
            Visibility(
              visible: isDisplayColorTheme.value,
              maintainAnimation: true,
              maintainState: true,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                opacity: isDisplayColorTheme.value ? 1 : 0,
                child: _ThemeSetting(),
              ),
            ),
            _DrawerListTile(
              title: str.contact,
              onTap: () {
                ref.read(appThemeNotifierProvider.notifier).update('fancy');
              },
              icon: Icons.contact_mail,
            ),
            _DrawerListTile(
              title: str.termOfService,
              onTap: () {},
              icon: Icons.rule,
            ),
            _DrawerListTile(
              title: str.privacyPolicy,
              onTap: () {},
              icon: Icons.policy,
            ),
            _DrawerListTile(
              title: str.feedback,
              onTap: () {},
              icon: Icons.feedback,
            ),
            _DrawerListTile(
              title: str.logout,
              onTap: () {},
              icon: Icons.logout,
            ),
            const SizedBox(height: 24),
            Align(
              child: Text(
                str.version(version: '1.0.1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends ConsumerWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);

    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          const Text('ロゴを挿入'),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            height: 40,
            child: LiteRollingSwitch(
              width: 75,
              value: themeMode == ThemeMode.light,
              textOn: '',
              textOff: '',
              colorOn: context.colorScheme.tertiary,
              colorOff: context.colorScheme.background,
              iconOn: Icons.sunny,
              iconOff: Icons.night_shelter,
              onChanged: (state) {
                HapticFeedback.heavyImpact();
                if (state) {
                  ref
                      .read(themeModeNotifierProvider.notifier)
                      .update(ThemeMode.light);
                } else {
                  ref
                      .read(themeModeNotifierProvider.notifier)
                      .update(ThemeMode.dark);
                }
              },
              // 下記は必須プロパティだけど使用しない
              onTap: () {},
              onDoubleTap: () {},
              onSwipe: () {},
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    required this.title,
    required this.onTap,
    required this.icon,
    // ignore: unused_element
    this.trailingIcon = Icons.chevron_right,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      onTap: onTap,
      leading: Icon(icon),
      trailing: Icon(trailingIcon),
    );
  }
}

class _ThemeSetting extends ConsumerWidget {
  _ThemeSetting();

  final List<Color> colors = [
    const Color(0xFF5555A9),
    const Color(0xFF006C4F),
    const Color(0xFF006A68),
    const Color(0xFF355CA8),
    const Color(0xFFB32824),
    const Color(0xFF705D00),
  ];
  final List<String> colorNames = [
    '日食',
    '調和',
    'オアシス',
    '静寂',
    '日没',
    '禅',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onTapCallbacks = <VoidCallback>[
      () => ref.read(appThemeNotifierProvider.notifier).update('eclipse'),
      () => ref.read(appThemeNotifierProvider.notifier).update('harmony'),
      () => ref.read(appThemeNotifierProvider.notifier).update('oasis'),
      () => ref.read(appThemeNotifierProvider.notifier).update('serenity'),
      () => ref.read(appThemeNotifierProvider.notifier).update('sunset'),
      () => ref.read(appThemeNotifierProvider.notifier).update('zen'),
    ];

    return SizedBox(
      height: 250,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: onTapCallbacks[index],
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: colors[index],
                ),
              ),
              // SizedBoxを小さくするか、必要ない場合は削除
              const SizedBox(height: 4),
              Text(
                colorNames[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: colors[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
