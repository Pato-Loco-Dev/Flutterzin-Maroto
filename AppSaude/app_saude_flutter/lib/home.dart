import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  
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
        body: Image.asset('assets/images/ubrela.png', width: 200, height: 200,)
      ),
    );
  }
  
}

