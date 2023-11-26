import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nost/app.dart';
import 'package:nost/core/i18n/strings.g.dart';
import 'package:nost/core/utils/flavor.dart';
import 'package:nost/core/utils/logger.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:nost/features/activities/infrastructure/repositories/supabase_activity_repository.dart';
import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:nost/features/auth/infrastructure/repositories/supagase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'main.g.dart';

@riverpod
User? user(UserRef ref) => throw UnimplementedError();

final supabase = Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 多言語対応の設定
  LocaleSettings.useDeviceLocale();

  // ログの設定
  NewlyLogger.config();

  logger.i('env: ${Flavor.environment}');

  await Supabase.initialize(
    url: Flavor.projectUrl,
    anonKey: Flavor.apiKey,
  );

  runApp(
    DevicePreview(
      builder: (context) => TranslationProvider(
        child: ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWith(
              (_) => SupabaseAuthRepository(),
            ),
            activityRepositoryProvider.overrideWith(
              (_) => SupabaseActivityRepository(),
            ),
            userProvider.overrideWith((ref) => supabase.auth.currentUser),
          ],
          child: const App(),
        ),
      ),
    ),
  );
}
