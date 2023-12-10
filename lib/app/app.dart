import 'package:flutter/material.dart';
import 'package:fuck/views/calculator_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter CalC",
        theme: ThemeData(
          primarySwatch: Colors
              .yellow, //Effect: when i select the ip box , border n dash line get this color
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.deepOrangeAccent,
            body: SafeArea(bottom: false, child: CalculatorView())));
  }
}
