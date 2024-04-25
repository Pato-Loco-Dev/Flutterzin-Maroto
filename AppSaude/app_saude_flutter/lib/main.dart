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
        appBar: AppBar(),
        body: const LogIn(),
      ),
    );
  }
}




