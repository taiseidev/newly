import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository extends AuthRepository {
  SupabaseAuthRepository({
    required this.supabase,
  });

  final SupabaseClient supabase;

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
      // data: {'user_name': userName}, // メタデータを登録する場合、dataフィールドに渡す
    );
  }

  @override
  Future<void> signInWithGoogle() async {
    await supabase.auth.signInWithOAuth(
      Provider.google,
      redirectTo: 'https://yvvozlgluavcsjzptfop.supabase.co/auth/v1/callback',
    );

    // /// TODO: update the Web client ID with your own.
    // ///
    // /// Web Client ID that you registered with Google Cloud.
    // // const webClientId =
    // //     '685439481632-l6shkkhellg5pt588ij8slp2qf3c9g07.apps.googleusercontent.com';

    // /// TODO: update the iOS client ID with your own.
    // ///
    // /// iOS Client ID that you registered with Google Cloud.
    // const iosClientId =
    //     '685439481632-g6g21klnah879srvftca7hs2npn50tev.apps.googleusercontent.com';

    // // Google sign in on Android will work without providing the Android
    // // Client ID registered on Google Cloud.

    // final googleSignIn = GoogleSignIn(
    //   clientId: iosClientId,
    //   // serverClientId: webClientId,
    //   scopes: [
    //     'email',
    //     'https://www.googleapis.com/auth/contacts.readonly',
    //   ],
    // );
    // final googleUser = await googleSignIn.signIn();
    // final googleAuth = await googleUser!.authentication;
    // final accessToken = googleAuth.accessToken;
    // final idToken = googleAuth.idToken;

    // if (accessToken == null) {
    //   throw 'No Access Token found.';
    // }
    // if (idToken == null) {
    //   throw 'No ID Token found.';
    // }

    // await supabase.auth.signInWithIdToken(
    //   provider: Provider.google,
    //   idToken: idToken,
    //   accessToken: accessToken,
    // );
  }

  @override
  Future<void> signInWithApple() async {
    await supabase.auth.signInWithApple();
  }
}
