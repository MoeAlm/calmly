import 'package:calmly/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/main/main_screen.dart';

void main() {
  runApp(const CalmlyApp());
}

class CalmlyApp extends StatelessWidget {
  const CalmlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calmly',
      theme: CustomTheme.lightTheme(context),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MainScreen(),
    );
  }
}
