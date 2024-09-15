import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_management/providers/main_riverpod_provider.dart';
import 'package:hotel_management/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeNotifier = ref.watch(mainNotifierProvider);
    final local = localeNotifier['locale'] as Locale;
    return Scaffold(
        backgroundColor: appTheme().scaffoldBackgroundColor,
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appLanguage().helloWorld,
                style: appTheme().textTheme.displayLarge,
              ),
              TextButton(
                  onPressed: () {
                    final newLocal = local.languageCode == 'en' ? 'bn' : 'en';
                    ref.read(mainNotifierProvider.notifier).updateLocale(newLocal);
                  },
                  child: const Text('Change Language')),
            ],
          ),
        ));
  }
}
