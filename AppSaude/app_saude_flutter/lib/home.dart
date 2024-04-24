import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
   Widget build(BuildContext context) {
    return Column(
     children: <Widget> [
      Center(
        child: Card(
          clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
        ),
        
      ),
       Center(
        child: Card(
          clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const  SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
        ),
        
      )
     ], 

      


    );
      
  }
  
}

