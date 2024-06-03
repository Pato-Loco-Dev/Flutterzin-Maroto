import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'models.dart'; 

abstract class ApiService {
  static Future<List<Consulta>> listarConsultasAndPaciente() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/consultas'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((consulta) => Consulta.fromJson(consulta))
          .toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

}


  Future<List<Paciente>> listarPacientes() async {
  final response = await http.get(Uri.parse('http://localhost:8080/pacientes'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((paciente) => Paciente.fromJson(paciente)).toList();
  } else {
    throw Exception('Failed to load pacientes');
  }
}

Future<void> atualizarConsulta(String motivoConsulta, String codPaciente,
    String dataConsulta, String dropdownValue) async {
  String motivoConsultaRequest = motivoConsulta;
  String codPacienteRequest = codPaciente;
  String dataConsultaRequest = dataConsulta;
  String horarioRequest = dropdownValue;

  var url = Uri.parse('http://localhost:8080/consultas');
  var response = await http.put(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'motivoConsulta': motivoConsultaRequest,
        'dataConsulta': dataConsultaRequest,
        'horarioConsulta': horarioRequest,
        'codPaciente': codPacienteRequest
      }));

  if (response.statusCode >= 200 && response.statusCode <= 299) {
    
    print('Response: ${response.body}');
  } else {
    
    print(dataConsultaRequest);
  }
}
