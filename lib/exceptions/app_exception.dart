import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class AppException implements Exception {
  AppException({
    this.title,
    this.detail,
  });

  factory AppException.general(Exception exception) =>
      _handleException(exception);
  factory AppException.error(String title) => AppException(title: title);
  factory AppException.unknown() => AppException(title: '不明なエラーです');
  factory AppException.irregular() => AppException(title: 'イレギュラーエラーです');
  factory AppException.network() => AppException(title: 'イレギュラーエラーです');

  final String? title;
  final String? detail;

  @override
  String toString() => '${title ?? ''}${detail != null ? ', $detail' : ''}';

  // ignore: prefer_constructors_over_static_methods
  static AppException _handleException(Exception exception) {
    if (exception is PostgrestException) {
      switch (exception.code) {
        case '42P01': // 未定義テーブル
          return AppException(title: 'テーブルが存在しません', detail: exception.message);
        case '23502': // 非NULL違反
          return AppException(
            title: '必須フィールドが欠けています',
            detail: exception.message,
          );
        case '23503': // 外部キー違反
          return AppException(title: '外部キー制約違反', detail: exception.message);
        case '23505': // 一意性違反
          return AppException(title: 'データが既に存在します', detail: exception.message);
        case '22012': // ゼロ割り
          return AppException(
            title: 'ゼロで割ることはできません',
            detail: exception.message,
          );
        case '28000': // 無効な認証指定
          return AppException(title: '認証エラー', detail: exception.message);
        default:
          return AppException.unknown();
      }
    } else if (exception is SocketException) {
      return AppException(
        title: 'ネットワークエラー',
        detail: 'サーバーとの通信に失敗しました。デバイスのネットワーク設定と環境を確認して再度お試してください。',
      );
    }
    return AppException();
  }
}
