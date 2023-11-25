import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                    email: 'onishi.taisei1997@gmail.com',
                    password: '123456',
                  ),
              child: const Text('メールアドレスで登録'),
            ),
            ElevatedButton(
              onPressed: () async {
                final response =
                    await Supabase.instance.client.auth.signInWithPassword(
                  email: 'onishi.taisei1997@gmail.com',
                  password: '123456',
                );
                if (response.user != null) {}
              },
              child: const Text('ログイン'),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(authRepositoryProvider).signInWithGoogle(),
              child: const Text('Google Sign In'),
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(authRepositoryProvider).signInWithApple(),
              child: const Text('Apple'),
            ),
            ElevatedButton(
              onPressed: () {
                final user = Supabase.instance.client.auth.currentUser;

                if (user != null) {
                  print(user.id);
                }
              },
              child: const Text('Apple'),
            ),
          ],
        ),
      ),
    );
  }
}
