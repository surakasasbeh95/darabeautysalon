import 'package:darabeautysalon/screens/dara_dashboard_screen.dart';
import 'package:darabeautysalon/screens/dara_register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:darabeautysalon/screens/dara_login_screen.dart';
import 'package:darabeautysalon/screens/dara_splash_screen.dart';
import 'package:darabeautysalon/store/app_store.dart';
import 'package:darabeautysalon/utils/app_theme.dart';
import 'package:darabeautysalon/utils/dara_constants.dart';
import 'package:darabeautysalon/utils/dara_data_generator.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

int currentIndex = 0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: null);

  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList());
  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Widget? navigateTo;
  const MyApp({super.key, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: '$appName${!isMobile ? ' ${platformName()}' : ''}',
      theme: !appStore.isDarkModeOn
          ? AppThemeData.lightTheme
          : AppThemeData.darkTheme,
      navigatorKey: navigatorKey,
      scrollBehavior: SBehavior(),
      supportedLocales: LanguageDataModel.languageLocales(),
      localeResolutionCallback: (locale, supportedLocales) => locale,
      routes: {
        '/': (context) => const DaraSplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: DaraLoginScreen(),
            ),
        '/login': (context) => const DaraLoginScreen(),
        '/signUp': (context) => const DaraRegisterScreen(),
        '/home': (context) => const DaraDashboardScreen(
              flag: false,
            ),
      },
    );
  }
}
