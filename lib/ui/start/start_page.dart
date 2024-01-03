import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nost/core/navigation/routes/branches/home_branch.dart';
import 'package:nost/core/navigation/routes/main/main_route.dart';
import 'package:nost/core/utils/logger.dart';
import 'package:nost/main.dart';
import 'package:nost/ui/start/start_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StartPage extends HookConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      supabase.auth.onAuthStateChange.listen((data) {
        final event = data.event;
        if (event == AuthChangeEvent.signedIn) {
          logger.i('ログインしました');
          const HomeRoute().go(context);
        }
      });
      return null;
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(startNotifierProvider.notifier).signInWithEmail(
                        email: 'reeksge@gmail.com',
                        password: '123456',
                      );
                },
                child: const Text('ログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
