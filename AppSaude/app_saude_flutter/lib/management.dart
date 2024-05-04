import 'package:mysql_client/mysql_client.dart';
import 'dart:io';
import 'dart:async';
import 'package:app_saude_flutter/consultas.dart';

Future<void> cadastrarPaciente() async {
  ConsultasState consultas =  ConsultasState();

  final conn = await MySQLConnection.createConnection(
      host: "localhost", 
      port: 3306, 
      userName: "root", 
      password: "va34q4tk", 
      databaseName: "BancoSQL", 
    );
await conn.connect();

if(conn.connected){
  var result = await conn.execute("INSERT INTO CONSULTAS (MOTIVO_CONSULTA, DATA_CONSULTA, HORARIO, PACIENTE) VALUES (:motivoConsulta, :dataConsulta, :horario, :paciente)",
    {
      "motivoConsulta": consultas.motivoConsulta,
      "dataConsulta": consultas.dataConsulta,
      "horario": consultas.dropdownValue,
      "paciente": consultas.nmPaciente
    },);
  
  }
}