import 'package:flutter/material.dart';
import 'perfil.dart';
import 'consultas.dart';
import 'historico.dart';

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
            Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Image.asset('assets/images/ubrela.png', width: 200, height: 200,),
                    ),
                    body: const Consultas(),
                  );
                },
              ));
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('CONSULTA'),
          ),
        ),
        ),
        
      ),
       Center(
        child: Card(
          clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
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
          },
          child: const  SizedBox(
            width: 300,
            height: 100,
            child: Text('HISTORICO'),
          ),
        ),
        ),
        
      ),
      Center(
        child: Card(
          clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
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
          },
          child: const  SizedBox(
            width: 300,
            height: 100,
            child: Text('PERFIL'),
          ),
        ),
        ),
      )
     ],       
    );
      
  }
  
}

