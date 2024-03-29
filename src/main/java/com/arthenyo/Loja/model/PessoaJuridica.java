package com.arthenyo.Loja.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_pessoa_juridica")
@PrimaryKeyJoinColumn(name = "id")
public class PessoaJuridica extends Pessoa{
    @Column(nullable = false)
    private String cnpj;
    @Column(nullable = false)
    private String inscEstadual;
    private String inscMunicipal;
    @Column(nullable = false)
    private String nomeFantasia;
    @Column(nullable = false)
    private String razaoSocial;
    private String categoria;

    public PessoaJuridica(Long id, String nome, String email, String telefone, String tipoPessoa, Pessoa empresa, String cnpj, String inscEstadual, String inscMunicipal, String nomeFantasia, String razaoSocial, String categoria) {
        super(id, nome, email, telefone, tipoPessoa, empresa);
        this.cnpj = cnpj;
        this.inscEstadual = inscEstadual;
        this.inscMunicipal = inscMunicipal;
        this.nomeFantasia = nomeFantasia;
        this.razaoSocial = razaoSocial;
        this.categoria = categoria;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getInscEstadual() {
        return inscEstadual;
    }

    public void setInscEstadual(String inscEstadual) {
        this.inscEstadual = inscEstadual;
    }

    public String getInscMunicipal() {
        return inscMunicipal;
    }

    public void setInscMunicipal(String inscMunicipal) {
        this.inscMunicipal = inscMunicipal;
    }

    public String getNomeFantasia() {
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia) {
        this.nomeFantasia = nomeFantasia;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}
