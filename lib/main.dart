import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/screens/splash_screen.dart';

import 'providers/resume_provider.dart';
import 'screens/personal_info_form.dart';
import 'screens/resume_preview.dart';
import 'screens/work_experience_form.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResumeProvider()),
      ],
      child: const ResumeBuilderApp(),
    ),
  );
}

class ResumeBuilderApp extends StatelessWidget {
  const ResumeBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/splash_screen',
      routes: {
        '/': (context) => PersonalInfoForm(),
        '/splash_screen': (context) => const SplashScreen(),
        '/work_experience': (context) => const WorkExperienceForm(),
        '/resume_preview': (context) => const ResumePreview(),
      },
    );
  }
}
