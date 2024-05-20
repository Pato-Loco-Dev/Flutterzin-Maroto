class Consulta {
  final int id;
  final String motivo;
  final String dataConsulta;
  final String horarioConsulta;
  final Paciente paciente;

  Consulta({
    required this.id,
    required this.motivo,
    required this.dataConsulta,
    required this.horarioConsulta,
    required this.paciente,
  });

  factory Consulta.fromJson(Map<String, dynamic> json) {
    final consultaData = json['consulta'];
    return Consulta(
      id: consultaData['id'],
      motivo: consultaData['motivoConsulta'],
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
