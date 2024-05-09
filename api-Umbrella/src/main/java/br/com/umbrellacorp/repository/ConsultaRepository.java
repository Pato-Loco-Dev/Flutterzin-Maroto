package br.com.umbrellacorp.repository;

import br.com.umbrellacorp.entity.Consulta;
import io.quarkus.hibernate.orm.panache.PanacheRepository;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class ConsultaRepository implements PanacheRepository<Consulta> {
}
