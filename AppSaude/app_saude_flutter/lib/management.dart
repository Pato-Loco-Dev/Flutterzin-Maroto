
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:app_saude_flutter/consultas.dart';

Future<void> listarConsultas() async {
  final response = await http.get(Uri.parse('http://localhost:8080/consultas'));
  
  if (response.statusCode == 200) {
    // Se a solicitação for bem-sucedida, analise os dados da resposta JSON.
    print('Response: ${response.body}');
  } else {
    // Se a solicitação não for bem-sucedida, lide com o erro.
    print('Failed to load data: ${response.statusCode}');
  }
}

Future<void> listarPacientes() async {

  final response = await http.get(Uri.parse('http://localhost:8080/pacientes'));
  
  if (response.statusCode == 200) {
    // Se a solicitação for bem-sucedida, analise os dados da resposta JSON.
    print('Response: ${response.body}');
  } else {
    // Se a solicitação não for bem-sucedida, lide com o erro.
    print('Failed to load data: ${response.statusCode}');
  }
}

Future<void> addConsulta(String motivoConsulta, String codPaciente, String dataConsulta, String dropdownValue) async {

  ConsultasState consulta =  ConsultasState();


  String motivoConsultaRequest = motivoConsulta;
  String codPacienteRequest = codPaciente;
  String dataConsultaRequest = dataConsulta;
  String horarioRequest = dropdownValue;

  var url = Uri.parse('http://localhost:8080/consultas');
  var response = await http.post(url,  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode( <String, String>{
    'motivoConsulta': motivoConsultaRequest,
    'dataConsulta': dataConsultaRequest,
    'horarioConsulta': horarioRequest,
    'codPaciente': codPacienteRequest
    }));
  
  if (response.statusCode == 200) {
    // Se a requisição for bem-sucedida, você pode processar a resposta aqui.
    print('Response: ${response.body}');
  } else {
    // Se a requisição não for bem-sucedida, lide com o erro aqui.
    print(dataConsultaRequest
    );
  }
}
