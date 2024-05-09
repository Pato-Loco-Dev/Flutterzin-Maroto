package br.com.umbrellacorp.controller.response;

import br.com.umbrellacorp.entity.Consulta;
import br.com.umbrellacorp.entity.Paciente;

public record ConsultaResponse(Consulta consulta) {

    ConsultaResponse toResponse(Consulta consulta) {
        return new ConsultaResponse(consulta);
    }
}
