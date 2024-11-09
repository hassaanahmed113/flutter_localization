import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('ur', 'PK')
      ],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/language',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter sLocalization',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "APP NAME",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "app_name",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ).tr(),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
            ),
            const Text(
              "CHANNEL NAME",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "channel_name",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ).tr(),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('en', 'US'));
                },
                child: const Text("English")),
            ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('es', 'ES'));
                },
                child: const Text("Spanish")),
            ElevatedButton(
                onPressed: () {
                  context.setLocale(const Locale('ur', 'PK'));
                },
                child: const Text("Urdu"))
          ],
        ),
      ),
    );
  }
}
