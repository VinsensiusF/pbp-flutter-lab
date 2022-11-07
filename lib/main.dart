import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Counter_7'),
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
  int _counter = 0;
  String state = "GENAP";

  void _incrementCounter() {
    setState(() {
      _counter++;
      if(_counter % 2 == 0){
        state = "GENAP";
      }
      else{
        state = "GANJIL";
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if(_counter % 2 == 0){
        state = "GENAP";
      }
      else{
        state = "GANJIL";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(state,
            style: (state == "GENAP") ? 
            const TextStyle(color: Color.fromARGB(255, 243, 30, 15)):
            const TextStyle(color: Color.fromARGB(255, 2, 78, 139))
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ]
        ),
      ),
      floatingActionButton: Visibility(
        child: Container(
          width: 762,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: _counter==0?
                const Text(""):
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                  ),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              )
            ],
          )
        )
      )
    );
  }
}
