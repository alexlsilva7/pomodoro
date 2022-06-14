import 'package:flutter/material.dart';
import 'package:pomodoro/pages/pomodoro.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(create: (ctx) => PomodoroStore()),
      ],
      child: MaterialApp(
        title: 'Pomodo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepPurple,
        ),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black, useMaterial3: true),
        home: const Pomodoro(),
      ),
    );
  }
}
