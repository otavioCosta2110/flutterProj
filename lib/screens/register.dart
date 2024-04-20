import 'package:flutter/material.dart';
import 'package:gustavo/main.dart';
import 'package:gustavo/screens/login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register(BuildContext context) {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Verifica se os campos são vazios
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos!'),
        ),
      );
      return;
    }

    // Verifica se o nome de usuário contém apenas números
    if (RegExp(r'^[0-9]+$').hasMatch(username)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O nome de usuário deve conter letras!'),
        ),
      );
      return;
    }

    // Verifica se o nome de usuário tem menos de 4 caract
    if (username.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O nome de usuário deve conter no mínimo 4 caracteres!'),
        ),
      );
      return;
    }

    // Verifica se a senha tem menos de 8 caract
    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A senha deve conter no mínimo 8 caracteres!'),
        ),
      );
      return;
    }
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
                  // Campo para senha
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
                  // Botão de registro
                  ElevatedButton(
                    onPressed: () => _register(context),
                    child: const Text('Registrar'),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

//estilos
const EdgeInsetsGeometry cardContentPaddingInt = EdgeInsets.all(20);
const InputDecoration inputDecor = InputDecoration(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.all(10.0),
);
