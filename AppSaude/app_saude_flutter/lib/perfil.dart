import 'package:flutter/material.dart';


class Perfil extends StatefulWidget{
  const Perfil ({super.key});

  @override
  PerfilState createState() {
    return PerfilState();
  }
}

class PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context){
    return const Form(
      child: Text('TA NA TELA DE PERFIL '),
    );
  }


}