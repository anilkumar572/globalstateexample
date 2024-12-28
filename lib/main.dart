import 'package:flutter/material.dart';
import 'package:funfacts/provier/themeswicher.dart';
import 'package:funfacts/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return Themeswitch();
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<Themeswitch>(context, listen: false).loadData();
  }

  Widget build(BuildContext conext) {
    var isProvider = Provider.of<Themeswitch>(context);
    return MaterialApp(
      theme: isProvider.ischecked
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: "FunFacts",
      home: MainScreen(),
    );
  }
}
