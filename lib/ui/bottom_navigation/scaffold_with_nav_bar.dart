import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nost/core/extension/context_ext.dart';
import 'package:nost/core/i18n/strings.g.dart';

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

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
              icon: Icons.contrast,
            ),
            _DrawerListTile(
              title: str.contact,
              onTap: () {},
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

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          const Icon(Icons.account_balance),
          const SizedBox(
            width: 24,
          ),
          Switch.adaptive(
            value: false,
            onChanged: (value) {},
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
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: context.textTheme.labelLarge,
      ),
      onTap: onTap,
      leading: Icon(icon),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
