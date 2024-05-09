package br.com.umbrellacorp.service;

import br.com.umbrellacorp.command.PacienteCommand;
import br.com.umbrellacorp.entity.Paciente;
import br.com.umbrellacorp.repository.PacienteRepository;

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
public class PacienteService {

    @Inject
    PacienteRepository pacienteRepository;

    /*LISTAR TODOS*/
    public List<Paciente> findAll() {
        return pacienteRepository.findAll().list();
    }


    /*LISTAR POR ID*/
    public Paciente listPacientePorCodigo(Long id) {

        String jpql = """
                    SELECT c FROM Paciente c WHERE c.id = :id
                """;

        return getEntityManager()
                .createQuery(jpql, Paciente.class)
                .setParameter("id", id)
                .getResultStream()
                .findAny()
                .orElseThrow();
    }


    /*ADICIONAR PACIENTE*/

    @Transactional
    public void addPaciente(PacienteCommand pacienteCommand) {

        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Paciente paciente = new Paciente();
        Set<ConstraintViolation<Paciente>> violations = validator.validate(paciente);

        paciente = new Paciente();
        paciente.setNome(pacienteCommand.nome());
        paciente.setDataNascimento(pacienteCommand.dataNascimento());
        paciente.setTipoSanguineo(pacienteCommand.tipoSanguineo());
        paciente.setConvenio(pacienteCommand.convenio());


        persist(paciente);

    }

    /*ATUALIZAR PACIENTE*/

    @Transactional
    public Paciente atualizarPaciente(Long id, PacienteCommand pacienteCommand) {

        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Paciente paciente = new Paciente();
        Set<ConstraintViolation<Paciente>> violations = validator.validate(paciente);

        Paciente pacienteEncontrado = listPacientePorCodigo(id);
        pacienteEncontrado.setNome(pacienteCommand.nome());
        pacienteEncontrado.setDataNascimento(pacienteCommand.dataNascimento());
        pacienteEncontrado.setTipoSanguineo(pacienteCommand.tipoSanguineo());
        pacienteEncontrado.setConvenio(pacienteCommand.convenio());
        return pacienteEncontrado;

    }

    /*DELETAR PACIENTE*/

    @Transactional
    public Response deletarPaciente(@PathParam("id") Long id) {
        Paciente paciente = listPacientePorCodigo(id);
        if (paciente == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        pacienteRepository.delete(paciente);
        return Response.status(Response.Status.NO_CONTENT).build();
    }

}
