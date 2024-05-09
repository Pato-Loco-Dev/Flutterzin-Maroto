package br.com.umbrellacorp.controller;

import br.com.umbrellacorp.command.ConsultaCommand;
import br.com.umbrellacorp.command.PacienteCommand;
import br.com.umbrellacorp.controller.request.ConsultaRequest;
import br.com.umbrellacorp.controller.request.PacienteRequest;
import br.com.umbrellacorp.controller.response.ConsultaResponse;
import br.com.umbrellacorp.controller.response.PacienteResponse;
import br.com.umbrellacorp.service.ConsultaService;
import br.com.umbrellacorp.service.PacienteService;
import org.eclipse.microprofile.openapi.annotations.parameters.RequestBody;

import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/consultas")
public class ConsultaController {


    @Inject
    ConsultaService consultaService;

    @GET
    public Response retrieveConsulta(){

        List<ConsultaResponse> responses = consultaService.findAll().stream().map(consulta -> new ConsultaResponse(consulta)).toList();
        return Response.ok(responses).build();
    }

    @POST
    public void addConsulta(@RequestBody ConsultaRequest request) {


        ConsultaCommand consultaCommand = ConsultaRequest.toCommand(request);

        consultaService.addConsulta(consultaCommand);

    }


    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response listPacientePorCodigo(
            @PathParam("id") Long id) {
        ConsultaResponse responses = new ConsultaResponse(consultaService.listConsultaPorCodigo(id));

        return Response.ok(responses).build();
    }

    @PUT
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response atualizar(
            @PathParam("id") Long id,
            @RequestBody ConsultaCommand consultaCommand) {

        ConsultaResponse responses = new ConsultaResponse(consultaService.atualizarConsulta(id, consultaCommand));

        return Response.ok(responses).build();
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    @Produces(MediaType.APPLICATION_JSON)
    public Response delete(
            @PathParam("id") Long id) {

        ConsultaResponse responses = new ConsultaResponse(consultaService.listConsultaPorCodigo(id));
        consultaService.deletarConsulta(id);

        return Response.ok(responses).build();
    }


}
