// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'flutter_flow/flutter_flow_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("WidgetsFlutterBinding initialized");

  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  print("URL strategy set");

  // Start initial custom actions code
  print("Starting initial custom actions");
  await actions.connected();
  print("Completed actions.connected()");

  final appState = FFAppState(); // Initialize FFAppState
  print("FFAppState created");

  await appState.initializePersistedState();
  print("FFAppState initialized");

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
  print("App started");
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Karbudz',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
