import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  HistoricoState createState() {
    return HistoricoState();
  }
}

class HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Histórico do paciente',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
