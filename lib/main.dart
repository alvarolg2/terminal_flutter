import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:terminal_flutter/app/app.locator.dart';
import 'package:terminal_flutter/ui/setup/setup_bottom_sheet_ui.dart';
import 'package:terminal_flutter/ui/setup/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.router.dart';
import 'themes.dart';
import 'ui/widgets/custom_window.dart';

Future<void> main() async {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(780, 400);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "Terminal Flutter";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme : ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const Scaffold(
        body: CustomWindow(
          child: Center(
            child: Text('Hello, World!'),
          ),
        ),
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}