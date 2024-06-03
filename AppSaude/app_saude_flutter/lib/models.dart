class Consulta {
  final int id;
  final String motivo;
  final String dataConsulta;
  final String horarioConsulta;
  final PacienteConsulta paciente;

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
      paciente: PacienteConsulta.fromJson(consultaData['paciente']),
    );
  }
}

class Paciente {
  final String nome;
  final int id;
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
    final pacienteData = json['paciente'];
    return Paciente(
      id: pacienteData['id'],
      nome: pacienteData['nome'],
      tipoSanguineo: pacienteData['tipoSanguineo'],
      dataNascimento: pacienteData['dataNascimento'],
      convenio: pacienteData['convenio'],
    );
  }
}

class PacienteConsulta {
  final String nome;
  final int id;
  final String tipoSanguineo;
  final String dataNascimento;
  final String convenio;

  PacienteConsulta({
    required this.id,
    required this.nome,
    required this.tipoSanguineo,
    required this.dataNascimento,
    required this.convenio,
  });

  factory PacienteConsulta.fromJson(Map<String, dynamic> json) {
    return PacienteConsulta(
      id: json['id'],
      nome: json['nome'],
      tipoSanguineo: json['tipoSanguineo'],
      dataNascimento: json['dataNascimento'],
      convenio: json['convenio'],
    );
  }
}
