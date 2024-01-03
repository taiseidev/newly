import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nost/core/extension/context_ext.dart';
import 'package:nost/core/i18n/strings.g.dart';
import 'package:nost/ui/common_widget/padded_icon_button.dart';

final class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: PaddedIconButton(
          padding: const EdgeInsets.only(left: 24),
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.barsStaggered),
        ),
        title: Text(i18n.appTitle),
        actions: [
          PaddedIconButton(
            padding: const EdgeInsets.only(right: 24),
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
