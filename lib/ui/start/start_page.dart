import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nost/core/extension/async_value_ext.dart';
import 'package:nost/ui/home/home_notifier.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue<void>(
      homeNotifierProvider,
      complete: (context, _) async {},
      completeMessage: '完了しました！',
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(homeNotifierProvider.notifier).signInWithEmail(
                        email: 'reeksge@gmail.com',
                        password: '123456',
                      );
                },
                child: const Text('ログイン'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(homeNotifierProvider.notifier).signOut();
                },
                child: const Text('ログアウト'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
