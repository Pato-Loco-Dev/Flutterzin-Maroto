import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

String username = 'admin123';
String password = 'patoloco2345678';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
  
}


class _LogInState extends State<LogIn> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      
      children: <Widget> [

        Center(
           child:
           Image.asset(
            'assets/images/logo-corp.png',
             height: 300, width: 300),  
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                return 'Insira o usuário!';
                } else if (value != username) {
                  return 'Usuário incorreto!';
                }
                return null;
              },
              controller: userController,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite seu usuario:',
            ),
          ),
        ),
         Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Digite sua senha!';
              } else if (value != password) {
                return 'Senha incorreta!';
              }
              return null;
            },
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite sua Senha:',
            ),
          ),
        ),
        Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate the user to the Home page
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              )
      ],
      ),
      
    );
  }
}