import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation/app_router.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: KinVerseApp()));
}

class KinVerseApp extends StatelessWidget {
  const KinVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KinVerse',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
