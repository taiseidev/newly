import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nost/core/navigation/routes/main/main_route.dart';

final class ScaffoldWithNavBar extends StatelessWidget {
  ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(137, 227, 227, 227),
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
          child: const Column(
            children: [
              Row(
                children: [
                  Text(
                    'Newly',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
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
