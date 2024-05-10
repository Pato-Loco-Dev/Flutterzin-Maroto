import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Consulta {
  final int id;
  final String motivoConsulta;
  final String dataConsulta;
  final String horarioConsulta;
  final Paciente paciente;

  Consulta({
    required this.id,
    required this.motivoConsulta,
    required this.dataConsulta,
    required this.horarioConsulta,
    required this.paciente,
  });

  factory Consulta.fromJson(Map<String, dynamic> json) {
    final consultaData = json['consulta'];
    return Consulta(
      id: consultaData['id'],
      motivoConsulta: consultaData['motivoConsulta'],
      dataConsulta: consultaData['dataConsulta'],
      horarioConsulta: consultaData['horarioConsulta'],
      paciente: Paciente.fromJson(consultaData['paciente']),
    );
  }
}

class Paciente {
  final int id;
  final String nome;
  final String tipoSanguineo;
  final String dataNascimento;
  final String convenio;

  Paciente({
    required this.id,
    required this.nome,
    required this.tipoSanguineo,
    required this.dataNascimento,
    required this.convenio,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
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
          title: Text('Detalhes da Consulta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Motivo da Consulta: ${consulta.motivoConsulta}'),
                Text('Data da Consulta: ${consulta.dataConsulta}'),
                Text('Horário da Consulta: ${consulta.horarioConsulta}'),
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

  void verDetalhesPaciente(Consulta consulta) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações do Paciente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Data de nascimento: ${consulta.paciente.dataNascimento}'),
                Text('Convênio: ${consulta.paciente.convenio}'),
                Text('Tipo Sanguineo: ${consulta.paciente.tipoSanguineo}'),
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
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(
                      20.0), // Aqui está o padding apenas para o título
                  child: Text(
                    'Histórico do Paciente',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text('Nome Paciente')),
                  DataColumn(label: Text('Informações')),
                  DataColumn(label: Text('Consultas')),
                ],
                rows: consultas
                    .map(
                      (consulta) => DataRow(cells: [
                        DataCell(Text(consulta.paciente.nome)),
                        DataCell(IconButton(
                            icon: Icon(Icons.info),
                            onPressed: () {
                              verDetalhesPaciente(consulta);
                            })),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.info),
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
      ),
    );
  }

  void main() {
    runApp(MaterialApp(
      home: Historico(),
    ));
  }
}
