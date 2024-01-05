import 'package:fluom/utils/themes/themes.dart';
import 'package:flutter/material.dart';


/// -- Uses this Class for setup themes, initial Bindings , any animations and much
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.dartTheme,
    );
  }
}