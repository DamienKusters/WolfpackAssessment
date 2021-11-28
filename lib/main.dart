import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/enums.dart';
import 'package:wolfpack_assessment/pages/schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wolfpack Assessment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Wolfpack Assessment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final List<Widget> pages = [
    const SchedulePage(),
  ];

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Enum selectedPage = PagesEnum.SCHEDULE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _renderPage()
    );
  }

  Widget _renderPage()
  {
    return widget.pages[selectedPage.index];
  }
}
