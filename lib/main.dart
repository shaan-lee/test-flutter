import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  static List bodyList = [
    Center(
      child: Container(
        color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
        child: const Text("index0",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    ),
    Center(
      child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: const Text("index1",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.home),
          )
        ]),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("app bar text",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: const Color.fromRGBO(255, 64, 129, 1),
        ),
        body: Center(
          child: bodyList[_index],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int i) {
              setState(() {
                _index = i;
              });
            },
            currentIndex: _index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), label: "user")
            ]),
      ),
    );
  }
}
