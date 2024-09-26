import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/weather_page.dart';
import 'package:weather_app/theme/themeProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
