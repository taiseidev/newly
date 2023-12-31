// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:nost/main.dart';

class SupabaseAuthRepository extends AuthRepository {
  SupabaseAuthRepository();

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'user_name': 'テストさん'},
    );
  }

  @override
  Future<void> signInWithGoogle() async {
    const webClientId =
        '685439481632-l6shkkhellg5pt588ij8slp2qf3c9g07.apps.googleusercontent.com';

    const iosClientId =
        '685439481632-g6g21klnah879srvftca7hs2npn50tev.apps.googleusercontent.com';

    final googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    debugPrint(accessToken);
    debugPrint(idToken);

    // await supabase.auth.signInWithIdToken(
    //   provider: Provider.google,
    //   idToken: idToken,
    //   accessToken: accessToken,
    // );
  }

  @override
  Future<void> signInWithApple() async {
    // await supabase.auth.signInWithApple();
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
