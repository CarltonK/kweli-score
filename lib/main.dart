import 'dart:async';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'provider/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => ApiProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => IndexNotifier(),
    ),
  ];

  runZonedGuarded(() {
    runApp(
      MultiProvider(
        child: MyApp(),
        providers: providers,
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  // Initialize firebase outside build to avoid future builder triggers
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K-Smart',
      debugShowCheckedModeBanner: false,
      theme: Constants.appTheme,
      navigatorObservers: <NavigatorObserver>[observer],
      home: FutureBuilder<FirebaseApp>(
        future: _initialization,
        builder: (context, snapshot) {
          DeviceConfig().init(context);
          if (snapshot.hasError) {
            return GlobalErrorContained(
              errorMessage: '${snapshot.error.toString()}',
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            // Pass all uncaught errors to Crashlytics.
            FirebaseCrashlytics instance = FirebaseCrashlytics.instance;
            FlutterError.onError = instance.recordFlutterError;

            return Consumer<ApiProvider>(
              builder: (context, value, child) {
                if (value.status == Status.Authenticated) {
                  return HomePage();
                }
                if (value.status == Status.Authenticating) {
                  return GlobalLoader();
                }
                return child!;
              },
              child: SignInScreen(),
            );
          }
          return GlobalLoader();
        },
      ),
    );
  }
}
