package br.com.umbrellacorp.repository;


import br.com.umbrellacorp.entity.Paciente;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class PacienteRepository implements PanacheRepository<Paciente> {
}
