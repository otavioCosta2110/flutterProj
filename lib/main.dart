import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'fodase page',
          theme: ThemeData(
            brightness: Brightness.dark,
            ),
          home: const MyHomePage(title: 'foda games'),
          );
    }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String text = 'nada foda';

  changeText(){
    setState(() {
      text = 'foda';
    });
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(text),
            ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              const Text( 'muito epico esse numero'),

              Text(
                'foda',
                style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
              ),
            ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'game',
            child: const Icon(Icons.add),
            ), 
          );
    }
}
