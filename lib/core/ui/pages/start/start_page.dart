import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:nost/main.dart';

class StartPage extends HookConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('スタート画面'),
            ElevatedButton(
              onPressed: () => ref.read(authRepositoryProvider).signInWithEmail(
                    email: 'reeksge@gmail.com',
                    password: '123456',
                  ),
              child: const Text('メールアドレスで登録'),
            ),
            ElevatedButton(
              onPressed: () async {
                final response = await supabase.auth.signInWithPassword(
                  email: 'reeksge@gmail.com',
                  password: '123456',
                );
                if (response.user != null) {}
              },
              child: const Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
