package br.com.umbrellacorp.controller.response;

import br.com.umbrellacorp.entity.Paciente;

public record PacienteResponse(Paciente paciente) {
    PacienteResponse toResponse(Paciente paciente) {
        return new PacienteResponse(paciente);
    }
}
