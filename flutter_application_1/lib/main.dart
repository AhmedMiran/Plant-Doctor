import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/prediction_provider.dart';
import 'screens/splash_screen.dart';




void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PredictionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cs = ColorScheme.fromSeed(seedColor: Colors.green);

    return MaterialApp(
      title: "Plant Disease Detection",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: cs,
        // use surface (recommended) for scaffold background so all screens get themed background
        scaffoldBackgroundColor: cs.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: cs.primary,
            foregroundColor: cs.onPrimary,
          ),
        ),
      ),
      // Start at the splash screen which will navigate to HomeScreen.
      home: const SplashScreen(),
    );
  }
}
