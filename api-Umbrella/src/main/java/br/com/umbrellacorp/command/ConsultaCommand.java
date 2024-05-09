package br.com.umbrellacorp.command;

import br.com.umbrellacorp.entity.Paciente;

import java.time.LocalDate;

public record ConsultaCommand(String motivoConsulta, LocalDate dataConsulta, String horarioConsulta, Long codPaciente) {
}
