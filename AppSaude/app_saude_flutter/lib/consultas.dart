import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'models.dart';
import 'management.dart';



final List<String> horarioManha = ['08:30', '09:00', '09:30', '10:00','10:30','11:00','11:30','','13:30','14:00','14:30','15:00','15:30', '16:00', '16:30','17:00'];



class Consultas extends StatefulWidget{
  @override
  ConsultasState createState() {
    return ConsultasState();
  }

  const Consultas ({super.key});
}

class ConsultasState extends State<Consultas> {
  late Future<List<Paciente>> futurePacientes ;
  Paciente? selectedPaciente;
  String dataConsulta = '';
  TextEditingController dataController = TextEditingController();
  String dropdownValue = horarioManha.first;
  TextEditingController motivoConsController = TextEditingController();
  String motivoConsulta = '';
  String nmPaciente = '';
  TextEditingController nmPacienteController = TextEditingController();
  int codPaciente = 0;
  

   @override
  void initState() {
    super.initState();
    futurePacientes = listarPacientes();
  }

  

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {

    motivoConsController.dispose();
    nmPacienteController.dispose();
    dataController.dispose();
    super.dispose();
  }


  Future<void> addConsulta() async {
                          var url = Uri.parse('http://localhost:8080/consultas');
                          var response = await http.post(url,
                              headers: <String, String>{
                               'Content-Type': 'application/json; charset=UTF-8',
                                },
                              body: jsonEncode(<String, String>{
                              'motivoConsulta': motivoConsulta,
                              'dataConsulta': dataConsulta,
                              'horarioConsulta': dropdownValue,
                              'codPaciente': selectedPaciente!.id.toString()
                             }));
                        }

  Future<void> _selecionaData() async {

    DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100)
      );

    if (dataSelecionada != null) {
      setState(() {
        dataController.text = dataSelecionada.toString().split(" ")[0];
      });
    }

  }

  @override
  Widget build(BuildContext context){
    
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
              child:  FutureBuilder<List<Paciente>>(
          future: futurePacientes,
          builder: (context, AsyncSnapshot<List<Paciente>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('Nenhum paciente encontrado');
            } else {
              List<Paciente> pacientes = snapshot.data!;
              return DropdownButton<Paciente>(
                value: selectedPaciente,
                hint: const Text('Selecione um Paciente'),
                items: pacientes.map((Paciente paciente) {
                  return DropdownMenuItem<Paciente>(
                    value: paciente,
                    child: Text(paciente.nome),
                  );
                }).toList(),
                onChanged: (Paciente? newValue) {
                  setState(() {
                    selectedPaciente = newValue;
                    
                  });
                },
              );
            }
          },
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
                        borderSide: BorderSide(color: Colors.blue)
                      )
                    ),
                    readOnly: true,
                    onTap: (){
                      _selecionaData();
                    },
                    
                  ),
                ),
                ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),

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
                        addConsulta();
                        
                      } 
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
                    child: const Text('Agendar consulta', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)) ),
                  ),
                ),
              ),
              
        ]
      ),
    );
  }
}


