import 'package:flutter/material.dart';
import 'package:gustavo/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _register(BuildContext context) {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String email = _emailController.text.trim();
    String fullName = _fullNameController.text.trim();
    String dob = _dobController.text.trim();
    String phone = _phoneController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        email.isEmpty ||
        fullName.isEmpty ||
        dob.isEmpty ||
        phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos!'),
        ),
      );
      return;
    }
   if (RegExp(r'^[0-9]+$').hasMatch(username)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O nome de usuário deve conter letras!'),
        ),
      );
      return;
    }
    if (username.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O nome de usuário deve conter no mínimo 4 caracteres!'),
        ),
      );
      return;
    }
    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A senha deve conter no mínimo 8 caracteres!'),
        ),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AppProj(),
      ),
    );
  }


  var maskFormatterDate = MaskTextInputFormatter(
    mask: "##/##/####", 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

    var maskFormatterCel = MaskTextInputFormatter(
    mask: "(##) # ########", 
    type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: cardContentPaddingInt,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _usernameController,
                    decoration: inputDecor.copyWith(
                      hintText: 'Nome de usuário',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: inputDecor.copyWith(
                      hintText: 'Senha',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: inputDecor.copyWith(
                      hintText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: _fullNameController,
                    decoration: inputDecor.copyWith(
                      hintText: 'Nome Completo',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextField(
                    inputFormatters: [maskFormatterDate],
                    controller: _dobController,
                    decoration: inputDecor.copyWith(
                      hintText: 'Data de Nascimento',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextField(
                    inputFormatters: [maskFormatterCel],
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: inputDecor.copyWith(
                      hintText: 'Telefone',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _register(context),
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const EdgeInsetsGeometry cardContentPaddingInt = EdgeInsets.all(20);
const InputDecoration inputDecor = InputDecoration(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.all(10.0),
);
