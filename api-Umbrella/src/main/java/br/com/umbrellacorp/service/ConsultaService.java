package br.com.umbrellacorp.service;

import br.com.umbrellacorp.command.ConsultaCommand;
import br.com.umbrellacorp.command.PacienteCommand;
import br.com.umbrellacorp.controller.request.ConsultaRequest;
import br.com.umbrellacorp.entity.Consulta;
import br.com.umbrellacorp.entity.Paciente;
import br.com.umbrellacorp.repository.ConsultaRepository;
import br.com.umbrellacorp.repository.PacienteRepository;
import javax.persistence.EntityManager;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.Set;

import static io.quarkus.hibernate.orm.panache.Panache.getEntityManager;
import static io.quarkus.hibernate.orm.panache.PanacheEntityBase.persist;

@ApplicationScoped
public class ConsultaService {

    @Inject
    ConsultaRepository consultaRepository;
    PacienteRepository pacienteRepository;
    ConsultaRequest consultaRequest;


    /*LISTAR TODOS*/
    public List<Consulta> findAll() {
        return consultaRepository.findAll().list();
    }


    /*LISTAR POR ID*/
    public Consulta listConsultaPorCodigo(Long id) {

        String jpql = """
                    SELECT c FROM Consulta c WHERE c.id = :id
                """;

        return getEntityManager()
                .createQuery(jpql, Consulta.class)
                .setParameter("id", id)
                .getResultStream()
                .findAny()
                .orElseThrow();
    }

    /*ADICIONAR CONSULTA*/

    @Transactional
    public void addConsulta(ConsultaCommand consultaCommand) {



        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Consulta consulta = new Consulta();
        Set<ConstraintViolation<Consulta>> violations = validator.validate(consulta);

        PacienteRepository pacienteRepository1 = new PacienteRepository();

        consulta = new Consulta();
        Paciente paciente = pacienteRepository1.findById(consultaCommand.codPaciente());
        consulta.setMotivoConsulta(consultaCommand.motivoConsulta());
        consulta.setDataConsulta(consultaCommand.dataConsulta());
        consulta.setHorarioConsulta(consultaCommand.horarioConsulta());
        consulta.setPaciente(paciente);


        persist(consulta);

    }

    /*ATUALIZAR CONSULTA*/

    @Transactional
    public Consulta atualizarConsulta(Long id, ConsultaCommand consultaCommand) {

        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Consulta consulta = new Consulta();
        Set<ConstraintViolation<Consulta>> violations = validator.validate(consulta);

        PacienteRepository pacienteRepository2 = new PacienteRepository();

        Consulta consultaEncontrada = listConsultaPorCodigo(id);
        Paciente paciente = pacienteRepository2.findById(consultaCommand.codPaciente());
        consultaEncontrada.setMotivoConsulta(consultaCommand.motivoConsulta());
        consultaEncontrada.setDataConsulta(consultaCommand.dataConsulta());
        consultaEncontrada.setHorarioConsulta(consultaCommand.horarioConsulta());
        consultaEncontrada.setPaciente(paciente);
        return consultaEncontrada;

    }

    /*DELETAR PACIENTE*/

    @Transactional
    public Response deletarConsulta(@PathParam("id") Long id) {
        Consulta consulta = listConsultaPorCodigo(id);
        if (consulta == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        consultaRepository.delete(consulta);
        return Response.status(Response.Status.NO_CONTENT).build();
    }


}
