import 'package:flutter/material.dart';
import 'package:flutter_movies_test/presentator/views/main_page.dart';
import 'package:flutter_movies_test/presentator/views/movie/movie_page.dart';
import 'package:flutter_movies_test/presentator/views/splash_page/splash_page.dart';
import 'package:flutter_movies_test/presentator/utils/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'domain/movies/entities/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => GoogleSignInProvider()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
          routes: {
            AppRoutes.SCREEN_PAGE: (context) => const SplashPage(),
            AppRoutes.LOGIN_PAGE: (context) => const MainPage(),
            AppRoutes.MOVIE_PAGE: (context) => const MoviePage(),
          }),
    );
  }
}
