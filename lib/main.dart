import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nost/app.dart';
import 'package:nost/core/i18n/strings.g.dart';
import 'package:nost/core/shared_preference/shared_preference_instance.dart';
import 'package:nost/core/utils/flavor.dart';
import 'package:nost/core/utils/logger.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:nost/features/activities/infrastructure/repositories/supabase_activity_repository.dart';
import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:nost/features/auth/infrastructure/repositories/supagase_auth_repository.dart';
import 'package:nost/features/tags/domain/repository/tag_repository.dart';
import 'package:nost/features/tags/infrastructure/supabase_tag_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 多言語対応の設定
  LocaleSettings.useDeviceLocale();

  await SharedPreferenceInstance.init();

  // ログの設定
  NewlyLogger.config();
  logger.i('env: ${Flavor.environment.name}');

  // Supabaseの設定
  await Supabase.initialize(
    url: Flavor.projectUrl,
    anonKey: Flavor.apiKey,
  );

  runApp(
    TranslationProvider(
      child: ProviderScope(
        overrides: _getOverrides(),
        child: const App(),
      ),
    ),
  );
}

List<Override> _getOverrides() {
  if (Flavor.environment == FlavorType.dev) {
    return [
      authRepositoryProvider.overrideWith(
        (_) => SupabaseAuthRepository(),
      ),
      activityRepositoryProvider.overrideWith(
        (_) => SupabaseActivityRepository(),
      ),
      tagRepositoryProvider.overrideWith(
        (_) => SupabaseTagRepository(),
      ),
    ];
  }
  return [];
}
