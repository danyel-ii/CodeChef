import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'router.dart';

class MobileRecipeLabApp extends ConsumerWidget {
  const MobileRecipeLabApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final textTheme = GoogleFonts.spaceGroteskTextTheme();
    return MaterialApp.router(
      title: 'Mobile Recipe Lab',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090807),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF4E06D),
          secondary: Color(0xFFF3B690),
          tertiary: Color(0xFF8B63A9),
          surface: Color(0xFF14110F),
          error: Color(0xFFFF9B94),
        ),
        textTheme: textTheme.copyWith(
          headlineMedium: GoogleFonts.spaceGrotesk(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.1,
            color: const Color(0xFFF7F3E9),
          ),
          titleLarge: GoogleFonts.spaceGrotesk(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          titleMedium: GoogleFonts.spaceGrotesk(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: GoogleFonts.spaceGrotesk(
            fontSize: 15,
            height: 1.4,
            color: const Color(0xFFD7D0C2),
          ),
          bodyLarge: GoogleFonts.ibmPlexMono(
            fontSize: 15,
            height: 1.45,
            color: const Color(0xFFF7F3E9),
          ),
          labelLarge: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xFF12100F),
          indicatorColor: const Color(0x26F4E06D),
          height: 72,
          labelTextStyle: WidgetStatePropertyAll<TextStyle>(
            GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0x14FFFFFF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0x33F7F3E9)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0x33F7F3E9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFFF4E06D), width: 1.5),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
