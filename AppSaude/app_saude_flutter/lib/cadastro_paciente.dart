import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';




final List<String> horarioManha = ['08:30', '09:00', '09:30', '10:00','10:30','11:00','11:30','','13:30','14:00','14:30','15:00','15:30', '16:00', '16:30','17:00'];



class CadastroPacientes extends StatefulWidget{
  @override
  CadastroPacientesState createState() {
    return CadastroPacientesState();
  }

  const CadastroPacientes ({super.key});
}

class CadastroPacientesState extends State<CadastroPacientes> {
  
  String nomePaciente = '';
  String tipoSanguineo = '';
  String convenio = 'NAO';
  String dataNascimento = '';
  bool conv = false;
  TextEditingController dataController = TextEditingController();
  TextEditingController tipoSanController = TextEditingController();
  TextEditingController nomePacienteController = TextEditingController();

  
  

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {

    tipoSanController.dispose();
    nomePacienteController.dispose();
    dataController.dispose();
    super.dispose();
  }


  Future<void> addPaciente() async {
                          var url = Uri.parse('http://localhost:8080/pacientes');
                          var response = await http.post(url,
                              headers: <String, String>{
                               'Content-Type': 'application/json; charset=UTF-8',
                                },
                              body: jsonEncode(<String, String>{
                              'nome': nomePaciente,
                              'tipoSanguineo': tipoSanguineo,
                              'dataNascimento': dataNascimento,
                              'convenio': convenio
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
            child: SizedBox(
              child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                return 'Digite o nome do paciente!';
                } else { nomePaciente = value;
                }
                return null;
              },
              controller: nomePacienteController,
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
                return 'Digite o tipo sanguineo!';
                } else { tipoSanguineo = value;
                }
                return null;
              },
              controller: tipoSanController,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite o tipo sanguineo:',
              label: Text('Tipo sanguineo:')
            ),
          ),
          ),
          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' Selecione a data de nascimento!';
                        } else { dataNascimento = value;
                        }
                        return null;
                      },
                    controller: dataController,
                    decoration: const InputDecoration(
                      labelText: 'Data de nascimento',
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

                    child: CheckboxListTile(
                      title: const Text("Possui convenio?"),
                      value: conv,
                      onChanged: (bool? value) {
                        setState(() {
                          conv = value!;
                          if (conv == true) {
                            convenio = 'SIM';
                          } else if (conv != true || conv == false) {
                            convenio = 'NAO';
                          }
                        });
                      },
  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
),
               ),

          Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addPaciente();
                        
                        
                      } 
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 0, 0)),
                    child: const Text('Cadastrar paciente', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)) ),
                  ),
                ),
              )
        ]
      ),
    );
  }
}


