package com.arthenyo.Loja.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;

import java.time.LocalDate;

@Entity
@Table(name = "tb_pessoa_fisica")
@PrimaryKeyJoinColumn(name = "id")
public class PessoaFisica extends Pessoa{
    @Column(nullable = false)
    private String cpf;
    @Column(nullable = false)
    private LocalDate dtNacimento;

    public PessoaFisica(Long id, String nome, String email, String telefone, String tipoPessoa, String cpf, LocalDate dtNacimento) {
        super(id, nome, email, telefone, tipoPessoa);
        this.cpf = cpf;
        this.dtNacimento = dtNacimento;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public LocalDate getDtNacimento() {
        return dtNacimento;
    }

    public void setDtNacimento(LocalDate dtNacimento) {
        this.dtNacimento = dtNacimento;
    }
}
