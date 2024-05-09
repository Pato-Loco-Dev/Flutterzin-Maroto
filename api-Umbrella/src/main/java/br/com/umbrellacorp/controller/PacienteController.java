package br.com.umbrellacorp.controller;


import br.com.umbrellacorp.command.PacienteCommand;
import br.com.umbrellacorp.controller.request.PacienteRequest;
import br.com.umbrellacorp.controller.response.PacienteResponse;
import br.com.umbrellacorp.service.PacienteService;
import org.eclipse.microprofile.openapi.annotations.parameters.RequestBody;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/pacientes")
public class PacienteController {

    @Inject
    PacienteService pacienteService;

    @GET
    public Response retrievePaciente(){

        List<PacienteResponse> responses = pacienteService.findAll().stream().map(paciente -> new PacienteResponse(paciente)).toList();
        return Response.ok(responses).build();
    }

    @POST
    public void addPaciente(@RequestBody PacienteRequest request) {

        PacienteCommand pacienteCommand = PacienteRequest.toCommand(request);

        pacienteService.addPaciente(pacienteCommand);

    }


    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response listPacientePorCodigo(
            @PathParam("id") Long id) {
        PacienteResponse responses = new PacienteResponse(pacienteService.listPacientePorCodigo(id));

        return Response.ok(responses).build();
    }

    @PUT
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response atualizar(
            @PathParam("id") Long id,
            @RequestBody PacienteCommand pacienteCommand) {

        PacienteResponse responses = new PacienteResponse(pacienteService.atualizarPaciente(id, pacienteCommand));

        return Response.ok(responses).build();
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    @Produces(MediaType.APPLICATION_JSON)
    public Response delete(
            @PathParam("id") Long id) {

        PacienteResponse responses = new PacienteResponse(pacienteService.listPacientePorCodigo(id));
        pacienteService.deletarPaciente(id);

        return Response.ok(responses).build();
    }


}
