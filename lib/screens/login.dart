import 'package:flutter/material.dart';
import 'package:gustavo/main.dart';
import 'package:gustavo/screens/register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      return;
    }

    if (RegExp(r'^[0-9]+$').hasMatch(username)) {
      return;
    }

    if (username.length < 4) {
      return;
    }

    if (password.length < 8) {
      return;
    }
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AppProj(),
      ),
    );
  }

  void _goToRegister(BuildContext context) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: cardContentPaddingInt, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _usernameController,
                  decoration: inputDecor.copyWith(
                    hintText: 'Nome de usuário',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: inputDecor.copyWith(
                    hintText: 'Senha',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => _goToRegister(context),
                child: const Text('Não possui uma conta? Registre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const EdgeInsetsGeometry cardMarginVer = EdgeInsets.symmetric(vertical: 2);
const EdgeInsetsGeometry cardContentPaddingInt = EdgeInsets.all(20);
const InputDecoration inputDecor = InputDecoration(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.all(10.0),
);
