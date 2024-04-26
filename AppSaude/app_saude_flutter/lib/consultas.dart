


import 'package:flutter/material.dart';

const List<String> horarioManha = <String>['08:30', '09:00', '09:30', '10:00', '10:30', '11:00', '11:30'];


class Consultas extends StatefulWidget{
  const Consultas ({super.key});

  @override
  ConsultasState createState() {
    return ConsultasState();
  }
}

class ConsultasState extends State<Consultas> {

  String motivoConsulta = '';
  String nmPaciente = '';

  TextEditingController motivoConsController = TextEditingController();
  TextEditingController nmPacienteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    motivoConsController.dispose();
    nmPacienteController.dispose();
    
    super.dispose();
  }
  String dropdownValue = horarioManha.first;

  @override
  Widget build(BuildContext context){
    
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                return 'Digite o motivo da consulta!';
                } else { motivoConsulta = value;
                }
                return null;
              },
              controller: motivoConsController,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite o motivo da consulta:',
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6.0),
            child: SizedBox(
              
              child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                return 'Digite o nome do paciente!';
                } else { nmPaciente = value;
                }
                return null;
              },
              controller: nmPacienteController,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite o nome do paciente:',
            ),
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
                        
                      } 
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
                    child: const Text('Agendar consulta', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)) ),
                  ),
                ),
              )
        ]
      ),
    );
  }

  


}