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
  bool senhaVisivel = true; 
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username = 'admin';
  String password = 'admin';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    senhaVisivel = true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset('assets/images/logo-corp.png',
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
                  label: Text('Usuário:')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: TextFormField(
              obscureText: senhaVisivel,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite sua senha!';
                } else if (value != password) {
                  return 'Senha incorreta!';
                }
                return null;
              },
              controller: passwordController,
              decoration:  InputDecoration(
                  suffixIcon: IconButton(onPressed: () {
                    setState(() {
                      senhaVisivel =!senhaVisivel;
                    });
                  } , icon: Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off)),
                  border: const OutlineInputBorder(),
                  hintText: 'Digite sua Senha:',
                  label: const Text('Senha:')),
                  
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: Image.asset(
                              'assets/images/ubrela.png',
                              width: 200,
                              height: 200,
                            ),
                          ),
                          body: const Home(),
                        );
                      },
                    ));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const
                      Color.fromRGBO(255, 0, 0, 1)),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white, // Definindo a cor do texto como branco
                    backgroundColor: Colors
                        .transparent, // Definindo o fundo do texto como transparente
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
