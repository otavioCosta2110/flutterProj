import 'package:flutter/material.dart';
import 'package:gustavo/screens/login.dart';
import 'package:gustavo/screens/register.dart';

void main() {
  runApp(const AppProj());
}

class AppProj extends StatelessWidget {
  const AppProj({Key? key});

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
  const HomePage({Key? key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = 'nada legal';

  changeText() {
    setState(() {
      text = 'legal';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(text),
        toolbarHeight: 40,
        actions: [
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 7.0),
              decoration: BoxDecoration(    
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: null,
                            shape: null,
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: LoginPage(),
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor: Colors.black,
                    tooltip: 'Login',
                    child: const Text('Login'),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: null,
                            shape: null,
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: RegisterPage(),
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor: Colors.black,
                    tooltip: 'Registro',
                    child: const Text('Registro'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('muito epico esse numero'),
            Text(
              text,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
