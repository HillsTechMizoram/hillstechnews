import 'package:hillstechnews/utils/theme/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home/view/home_screen.dart';
import 'utils/theme/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
          apiKey: "AIzaSyCCW8giNOcV3i1nnsyuKEukBAxRjhCMd08",
          authDomain: "hillstechnews.firebaseapp.com",
          projectId: "hillstechnews",
          storageBucket: "hillstechnews.appspot.com",
          messagingSenderId: "683934208703",
          appId: "1:683934208703:web:3b64ef2e4a5d864bf52c0a",
          measurementId: "G-VJYSC974KJ"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, ref, _) {
        ref.watch(themePreferences).getTheme();

        final themeMode = ref.watch(themeControllerProvider);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const HomeScreen(),
        );
      }),
    );
  }
}
