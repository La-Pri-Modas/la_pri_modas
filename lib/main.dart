import 'dart:async';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:la_pri_modas/utils/analytics/app_analytics.dart';
import 'package:la_pri_modas/presentation/ui/pages/home/home_page.dart';
import 'package:la_pri_modas/presentation/ui/utils/keyboard_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    await _initializeFirebase();
    runApp(
      const App(),
    );
  }, (Object error, StackTrace stack) {
    //FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // ignore: empty_catches
  } catch (e) {}
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final INavigation navigation = GetIt.instance.get<INavigation>();
    //final KeyboardManager keyboardManager = GetIt.instance.get<KeyboardManager>();
    //final ThemeData appTheme = AppTheme.makeAppTheme();

    return GestureDetector(
      onTap: () => KeyboardManager().hideKeyboard(context),
      child: MaterialApp(
        title: 'La Pri Modas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
        //theme: appTheme.copyWith(colorScheme: appTheme.colorScheme.copyWith(secondary: AppThemeColors.yellow)),
        //navigatorKey: navigation.navigatorKey,
        //initialRoute: NavigationRoutes.root,
        //onGenerateRoute: navigation.pagesRouteFactory(),
        navigatorObservers: [FirebaseAnalyticsObserver(analytics: AppAnalytics.instance.firebaseAnalytics)],
      ),
    );
  }
}
