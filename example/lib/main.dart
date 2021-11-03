import 'package:flutter/material.dart';
import 'package:imagetag/imagetag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TagController tagController = TagController();

  String a = '';

  @override
  void initState() {
    tagController.addListener(() {
      setState(() {
        a = tagController.a;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
              child: ImageTagContainer(
            controller: tagController,
            isEdit: true,
          )),
          SizedBox(
            height: 20,
            child: Text(a),
          ),
          ElevatedButton(
              onPressed: () {
                tagController.ganti();
              },
              child: const Text('data')),
          SizedBox(
              height: 150,
              child: ImageTagContainer(
                controller: tagController,
                isEdit: false,
              )),
        ],
      ),
    );
  }
}
