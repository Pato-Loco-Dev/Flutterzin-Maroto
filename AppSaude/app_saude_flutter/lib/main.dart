import 'package:flutter/material.dart';
import 'login_page.dart';


void main() {
  runApp(const AppSaude());
}

class AppSaude extends StatelessWidget {
  const AppSaude({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Umbrella Corp';
    return MaterialApp(
      
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: 
          
          Image.asset('assets/images/ubrela.png', width: 200, height: 200,),
          
        ),
        body: const LogIn(),
      ),
    );
  }
}




