import 'package:app_saude_flutter/management.dart';
import 'package:flutter/material.dart';

const List<String> horarioManha = <String>[
  '08:30',
  '09:00',
  '09:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30'
];

class Consultas extends StatefulWidget {
  @override
  ConsultasState createState() {
    return ConsultasState();
  }

  const Consultas({super.key});
}

class ConsultasState extends State<Consultas> {
  TextEditingController dataController = TextEditingController();
  String dropdownValue = horarioManha.first;
  TextEditingController motivoConsController = TextEditingController();
  String motivoConsulta = '';
  String nmPaciente = '';
  TextEditingController nmPacienteController = TextEditingController();
  String dataConsulta = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    motivoConsController.dispose();
    nmPacienteController.dispose();
    dataController.dispose();

    super.dispose();
  }

  Future<void> _selecionaData() async {
    DateTime? dataSelecionada = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (dataSelecionada != null) {
      setState(() {
        dataController.text = dataSelecionada.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
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
                label: Text('Nome do paciente:')
            ),
          ),
        ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
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
              label: Text('Motivo da consulta:')
            ),
          ),
          ),
          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' Selecione a data da consulta!';
                        } else { dataConsulta = value;
                        }
                        return null;
                      },
                    controller: dataController,
                    decoration: const InputDecoration(
                      labelText: 'Data da consulta',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  readOnly: true,
                  onTap: () {
                    _selecionaData();
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
              child: DropdownMenu<String>(
                width: 400,
                hintText: horarioManha.first,
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
                        addConsulta(motivoConsulta, nmPaciente, dataConsulta, dropdownValue
                        );
                        
                        
                      } 
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
                    child: const Text('Agendar consulta', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)) ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                     
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
                    child: const Text('Ver consultas ', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)) ),
                  ),
                ),
              ),
          
        ]
      ),
    );
  }
}
