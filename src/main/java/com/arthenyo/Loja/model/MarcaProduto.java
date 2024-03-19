package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tb_marca_produto")
@SequenceGenerator(name = "seq_marca_produto", sequenceName = "seq_marca_produto",allocationSize = 1, initialValue = 1)
public class MarcaProduto {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_marca_produto")
    private Long id;
    @Column(nullable = false)
    private String nomeDesc;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "empresa_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "empresa_fk"))
    private Pessoa empresa;

    public MarcaProduto() {
    }

    public MarcaProduto(Long id, String nomeDesc, Pessoa empresa) {
        this.id = id;
        this.nomeDesc = nomeDesc;
        this.empresa = empresa;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNomeDesc() {
        return nomeDesc;
    }

    public void setNomeDesc(String nomeDesc) {
        this.nomeDesc = nomeDesc;
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
        MarcaProduto that = (MarcaProduto) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
