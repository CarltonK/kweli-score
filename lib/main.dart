// import 'dart:async';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'provider/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => AuthProvider.instance(),
    ),
    Provider(
      create: (context) => DatabaseProvider(),
    ),
    Provider(
      create: (context) => StorageProvider(),
    ),
  ];

  // runZonedGuarded(() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
  // }, (error, stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });
}

class MyApp extends StatelessWidget {
  // Initialize firebase outside build to avoid future builder triggers
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
  //   analytics: analytics,
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kweli Score',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // navigatorObservers: <NavigatorObserver>[observer],
      home: BaseApp(),
    );
  }
}

class BaseApp extends StatefulWidget {
  @override
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return GlobalErrorContained(
        errorMessage: 'App could not be initialized',
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return GlobalLoader();
    }

    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        if (value.status == Status.Authenticated) return HomePage();
        if (value.status == Status.Authenticating) return GlobalLoader();
        return child;
      },
      child: MainAuthentication(),
    );
  }
}
