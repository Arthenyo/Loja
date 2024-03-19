package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tb_forma_pagamento")
@SequenceGenerator(name = "seq_forma_pagamento", sequenceName = "seq_forma_pagamento",allocationSize = 1, initialValue = 1)
public class FormaPagamento {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_forma_pagamento")
    private Long id;
    @Column(nullable = false)
    private String descricao;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "empresa_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "empresa_fk"))
    private Pessoa empresa;

    public FormaPagamento() {
    }

    public FormaPagamento(Long id, String descricao, Pessoa empresa) {
        this.id = id;
        this.descricao = descricao;
        this.empresa = empresa;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Pessoa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Pessoa empresa) {
        this.empresa = empresa;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FormaPagamento that = (FormaPagamento) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
