import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LogIn extends StatelessWidget {
  const LogIn({super.key});



  @override
  Widget build(BuildContext context) {
    return  Column(
      key: _formKey,

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
          child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite seu usuario:',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextField(
            decoration: InputDecoration(
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
    );
  }
}