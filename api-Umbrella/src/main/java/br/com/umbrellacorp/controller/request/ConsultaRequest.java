package br.com.umbrellacorp.controller.request;

import br.com.umbrellacorp.command.ConsultaCommand;
import br.com.umbrellacorp.command.PacienteCommand;
import br.com.umbrellacorp.entity.Paciente;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.Date;

public record ConsultaRequest(

        String motivoConsulta,

        LocalDate dataConsulta,

        String horarioConsulta,

        Long codPaciente

) {
    public static ConsultaCommand toCommand(ConsultaRequest request) {
        return new ConsultaCommand(request.motivoConsulta, request.dataConsulta, request.horarioConsulta, request.codPaciente);
    }
}
