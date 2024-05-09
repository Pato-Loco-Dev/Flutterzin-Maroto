package br.com.umbrellacorp.entity;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import io.smallrye.common.constraint.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

import javax.json.bind.annotation.JsonbDateFormat;
import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "CONSULTAS")
public class Consulta extends PanacheEntityBase implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "COD_CONSULTA")
    private Long id;


    @Column(name = "MOTIVO_CONSULTA", length =200)
    private String motivoConsulta;

    @NotNull
    @JsonbDateFormat("yyyy/MM/dd")
    @Column(name = "DATA_CONSULTA")
    private LocalDate dataConsulta;

    @NotNull
    @Column(name = "HORARIO_CONSULTA", length =5)
    private String horarioConsulta;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "PACIENTE")
    private Paciente paciente;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMotivoConsulta() {
        return motivoConsulta;
    }

    public void setMotivoConsulta(String motivoConsulta) {
        this.motivoConsulta = motivoConsulta;
    }

    public LocalDate getDataConsulta() {
        return dataConsulta;
    }

    public void setDataConsulta(LocalDate dataConsulta) {
        this.dataConsulta = dataConsulta;
    }

    public String getHorarioConsulta() {
        return horarioConsulta;
    }

    public void setHorarioConsulta(String horarioConsulta) {
        this.horarioConsulta = horarioConsulta;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
}
