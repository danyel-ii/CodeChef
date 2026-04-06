import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_recipe_lab_mobile/src/features/documents/pdf_deck_catalog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.5,
            colors: <Color>[
              Color(0xFF17322B),
              Color(0xFF0F1514),
              Color(0xFF090807),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(
                'Local-first defaults, toolchain status, and product rules.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 18),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFF11100E),
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(color: const Color(0x22FFFFFF)),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color(0x80000000),
                          blurRadius: 30,
                          offset: Offset(0, 18),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(34),
                      child: Column(
                        children: <Widget>[
                          const _SettingsBand(
                            background: Color(0xFFF4F0E8),
                            textColor: Color(0xFF171311),
                            title: 'LOCAL-FIRST',
                            body:
                                'Recipes and payload transforms stay on device. No remote execution is wired into this build.',
                          ),
                          const _SettingsBand(
                            background: Color(0xFFF1DE6C),
                            textColor: Color(0xFF171311),
                            title: 'ENGINE',
                            body:
                                'Operations run through the registry and executor stack, with isolate routing preserved for heavier work.',
                          ),
                          const _SettingsBand(
                            background: Color(0xFF9366AE),
                            textColor: Color(0xFFF7F3E9),
                            title: 'STATUS',
                            body:
                                'Android is the primary release target here, with the GitHub APK pipeline and mobile workflow actively maintained.',
                          ),
                          _SettingsBand(
                            background: const Color(0xFFE37BA3),
                            textColor: const Color(0xFF171311),
                            title: 'ABOUT',
                            body:
                                'Open the bundled Code Chef blueprint slide deck from inside the app.',
                            actionLabel: 'Open Blueprint PDF',
                            onAction: () async {
                              if (!context.mounted) {
                                return;
                              }
                              context.push('/documents/pdf', extra: aboutBlueprintDeck);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsBand extends StatelessWidget {
  const _SettingsBand({
    required this.background,
    required this.textColor,
    required this.title,
    required this.body,
    this.actionLabel,
    this.onAction,
  });

  final Color background;
  final Color textColor;
  final String title;
  final String body;
  final String? actionLabel;
  final Future<void> Function()? onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textColor,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: GoogleFonts.ibmPlexMono(
              fontSize: 14,
              height: 1.4,
              color: textColor,
            ),
          ),
          if (actionLabel != null && onAction != null) ...<Widget>[
            const SizedBox(height: 14),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: textColor,
                foregroundColor: background,
              ),
              onPressed: onAction,
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
