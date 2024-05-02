import 'home.dart';
import 'package:flutter/material.dart';






class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  LogInState createState() {
    return LogInState();
  }
}


class LogInState extends State<LogIn> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username = 'admin123';
  String password = 'patoloco2345678';

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
              label: Text('Usuário:')
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
              label: Text('Senha:')
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
                        Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Image.asset('assets/images/ubrela.png', width: 200, height: 200,),
                    ),
                    body: const Home(),
                  );
                },
              ));
                      } 
                    },
                    child: const Text('Entrar'),
                  ),
                ),
              )
      ],
      ),
      
    );
  }
}