import 'package:flutter/material.dart';
import 'screens/catalog.dart';

void main() {
  runApp(const AppProj());
}

class AppProj extends StatelessWidget {
  const AppProj({super.key});

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'legal page',
          theme: ThemeData(
            brightness: Brightness.dark,
            ),
          home: const HomePage(title: 'legal games'),
          );
    }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String text = 'nada legal';

  changeText(){
    setState(() {
        text = 'legal';
        });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(text),
            ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              const Text( 'muito epico esse numero'),

              Text(
                text,
                style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
              ),
            ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => const CatalogPage()),
                );
              },
            tooltip: 'game',
            child: const Icon(Icons.add),
            ), 
          );
    }
}
