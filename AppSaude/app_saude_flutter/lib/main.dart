import 'package:flutter/material.dart';


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
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      
      children:  [
        Center(
           child:Image.asset('assets/images/logo-corp.png', height: 128, width: 128),
        ) ,
      ],
    );
  }
}


