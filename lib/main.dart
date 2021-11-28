import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/enums.dart';
import 'package:wolfpack_assessment/pages/overview_page.dart';
import 'package:wolfpack_assessment/pages/schedule_page.dart';
import 'package:wolfpack_assessment/services/moment_service.dart';

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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Wolfpack Assessment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MomentService momentService = MomentService();
  late List<Widget> pages;

  Enum selectedPage = PagesEnum.SCHEDULE;

  @override
  void initState() {
    super.initState();
    pages = [
      SchedulePage(momentService: momentService,),
      OverviewPage(momentService: momentService,),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _renderPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_outlined),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_outlined),
            label: 'Overview',
          ),
        ],
        currentIndex: selectedPage.index,
        selectedItemColor: Colors.teal,
        onTap: (i) => _changePage(i)
      ),
    );
  }

  void _changePage(int index)
  {
    Enum newPage;
    switch (index) {
      case 1:
        newPage = PagesEnum.OVERVIEW;
        break;
      default:
        newPage = PagesEnum.SCHEDULE;
    }
    setState(() { selectedPage = newPage; });
  }

  Widget _renderPage()
  {
    return pages[selectedPage.index];
  }
}
