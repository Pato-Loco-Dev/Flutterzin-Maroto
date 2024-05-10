import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Consulta {
  final int id;
  final String dataConsulta;
  final String horarioConsulta;
  final Paciente paciente;

  Consulta({
    required this.id,
    required this.dataConsulta,
    required this.horarioConsulta,
    required this.paciente,
  });

  factory Consulta.fromJson(Map<String, dynamic> json) {
    final consultaData = json['consulta'];
    return Consulta(
      id: consultaData['id'],
      dataConsulta: consultaData['dataConsulta'],
      horarioConsulta: consultaData['horarioConsulta'],
      paciente: Paciente.fromJson(consultaData['paciente']),
    );
  }
}

class Paciente {
  final String nome;
  final String tipoSanguineo;
  final String dataNascimento;
  final String convenio;

  Paciente({
    required this.nome,
    required this.tipoSanguineo,
    required this.dataNascimento,
    required this.convenio,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      nome: json['nome'],
      tipoSanguineo: json['tipoSanguineo'],
      dataNascimento: json['dataNascimento'],
      convenio: json['convenio'],
    );
  }
}

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  List<Consulta> consultas = [];

  @override
  void initState() {
    super.initState();
    listarConsultas();
  }

  Future<void> listarConsultas() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/consultas'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        consultas = jsonResponse
            .map((consulta) => Consulta.fromJson(consulta))
            .toList();
      });
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  void verDetalhesConsulta(Consulta consulta) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações do Paciente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nome do Paciente: ${consulta.paciente.nome}'),
                Text('Tipo Sanguíneo: ${consulta.paciente.tipoSanguineo}'),
                Text('Data de Nascimento: ${consulta.paciente.dataNascimento}'),
                Text('Convênio: ${consulta.paciente.convenio}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Histórico de Consultas',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Data')),
                DataColumn(label: Text('Horário')),
                DataColumn(label: Text('Paciente')),
              ],
              rows: consultas
                  .map(
                    (consulta) => DataRow(cells: [
                      DataCell(Text(consulta.id.toString())),
                      DataCell(Text(consulta.dataConsulta)),
                      DataCell(Text(consulta.horarioConsulta)),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.person),
                          onPressed: () {
                            verDetalhesConsulta(consulta);
                          },
                        ),
                      ),
                    ]),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Historico(),
  ));
}
