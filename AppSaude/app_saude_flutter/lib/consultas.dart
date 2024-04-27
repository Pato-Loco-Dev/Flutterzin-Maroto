


import 'package:flutter/material.dart';

const List<String> horarioManha = <String>['08:30', '09:00', '09:30', '10:00', '10:30', '11:00', '11:30'];


class Consultas extends StatefulWidget{
  @override
  ConsultasState createState() {
    return ConsultasState();
  }

  const Consultas ({super.key});
}

class ConsultasState extends State<Consultas> {
  String dropdownValue = horarioManha.first;
  TextEditingController motivoConsController = TextEditingController();
  String motivoConsulta = '';
  String nmPaciente = '';
  TextEditingController nmPacienteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    motivoConsController.dispose();
    nmPacienteController.dispose();
    
    super.dispose();
  }

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
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
          child: DropdownMenu<String>(
                  label: const Text('Horário da consulta:'),
                  menuHeight: 300,
                  initialSelection: horarioManha.first,
                  onSelected: (String? value) {
        
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: horarioManha.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
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