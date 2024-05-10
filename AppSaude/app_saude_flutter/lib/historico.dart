import 'package:app_saude_flutter/management.dart';
import 'package:flutter/material.dart';
import 'models.dart';

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
    try {
      List<Consulta> consultas = await ApiService.listarConsultasAndPaciente();
      setState(() {
        this.consultas = consultas;
      });
    } catch (e) {
      print('Error: $e');
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
              child: Text(
                'Fechar',
                style: TextStyle(
                  color: Colors.black, // Definindo a cor do texto como branco
                  backgroundColor: Colors
                      .transparent, // Definindo o fundo do texto como transparente
                ),
              ),
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
