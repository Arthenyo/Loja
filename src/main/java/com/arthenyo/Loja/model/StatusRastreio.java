package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tb_status_rastreio")
@SequenceGenerator(name = "seq_status_rastreio",sequenceName = "seq_status_rastreio",allocationSize = 1,initialValue = 1)
public class StatusRastreio {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_status_rastreio")
    private Long id;
    private String centroDestribuicao;
    private String cidade;
    private String estado;
    private String status;
    @ManyToOne
    @JoinColumn(name = "venda_compra_loja_vir_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "venda_compra_loja_vir_fk"))
    private VendaCompraLojaVirtual vendaCompraLojaVirtual;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "empresa_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "empresa_fk"))
    private Pessoa empresa;

    public StatusRastreio() {
    }

    public StatusRastreio(Long id, String centroDestribuicao, String cidade, String estado, String status, VendaCompraLojaVirtual vendaCompraLojaVirtual, Pessoa empresa) {
        this.id = id;
        this.centroDestribuicao = centroDestribuicao;
        this.cidade = cidade;
        this.estado = estado;
        this.status = status;
        this.vendaCompraLojaVirtual = vendaCompraLojaVirtual;
        this.empresa = empresa;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCentroDestribuicao() {
        return centroDestribuicao;
    }

    public void setCentroDestribuicao(String centroDestribuicao) {
        this.centroDestribuicao = centroDestribuicao;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public VendaCompraLojaVirtual getVendaCompraLojaVirtual() {
        return vendaCompraLojaVirtual;
    }

    public void setVendaCompraLojaVirtual(VendaCompraLojaVirtual vendaCompraLojaVirtual) {
        this.vendaCompraLojaVirtual = vendaCompraLojaVirtual;
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
        StatusRastreio that = (StatusRastreio) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
