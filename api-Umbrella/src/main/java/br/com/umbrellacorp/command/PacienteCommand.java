package br.com.umbrellacorp.command;

import java.time.LocalDate;


public record PacienteCommand(String nome, LocalDate dataNascimento, String tipoSanguineo, String convenio) {
}
