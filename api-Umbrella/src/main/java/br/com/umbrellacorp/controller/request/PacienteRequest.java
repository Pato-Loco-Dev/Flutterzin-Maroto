package br.com.umbrellacorp.controller.request;

import br.com.umbrellacorp.command.PacienteCommand;

import java.time.LocalDate;


public record PacienteRequest(

        String nome,

        LocalDate dataNascimento,

        String tipoSanguineo,

        String convenio

) {

    public static PacienteCommand toCommand(PacienteRequest request) {
        return new PacienteCommand(request.nome, request.dataNascimento, request.convenio, request.tipoSanguineo);
    }



}
