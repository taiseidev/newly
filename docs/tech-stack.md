# 技術ドキュメント

## FVM
- [FVMでFlutter SDKのバージョンをプロジェクト毎に管理する](https://zenn.dev/altiveinc/articles/flutter-version-management)
- [Flutter SDKをバージョン管理できるfvmでFlutterを使う](https://zenn.dev/welchi/articles/d8f120adeebc7a85ed17)
→ デフォルトでFVMのFlutterのバージョンを参照するように設定しているため`fvm`をprefixにつける必要なし。

## GithubActions
- [Flutter開発で使っているGitHub Actionsのワークフロー](https://zenn.dev/yorifuji/articles/flutter-github-actions-template)

## dependabot
- [【Flutter】dependabotを導入したので手順と使い方を解説してみる](https://blog.dalt.me/3354)

## Supabase
- [Flutter × Supabase でチャットを作ろう](https://zenn.dev/dshukertjr/books/flutter-supabase-chat)

## Environment
- [Flutter の環境分けの新時代](https://zenn.dev/blendthink/articles/392607db0a65dd)

## Env
- [enved](https://pub.dev/packages/envied)
- [【Flutter】enviedパッケージを使う際にひっかかったこと](https://zenn.dev/8rine23/scraps/f097a9505cbe7b)

## Font
- [Flutter の Text Scale Factor に対応したデザインを実装する](https://zenn.dev/10q89s/articles/flutter-text-scale-factor)
→ 文字を囲む際は SizedBox ではなく BoxConstraints を使う
→ ErrorViewなど埋め込み画面はSingleChildeScrollViewでスクロール可能にしておく

```dart
// v3.15以前: textScaleFactor
MediaQuery(
  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
  child: child,
),

Text('テキスト', textScaleFactor: 1.0);

// v3.16以降: TextScaler
MediaQuery(
  data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
  child: child,
),

Text('テキスト', textScaler: TextScaler.linear(1.0));
```
