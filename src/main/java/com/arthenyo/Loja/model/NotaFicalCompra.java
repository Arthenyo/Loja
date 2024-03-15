package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "tb_nota_fiscal_compra")
@SequenceGenerator(name = "seq_nota_fiscal_compra",sequenceName = "seq_nota_fiscal_compra",allocationSize = 1, initialValue = 1)
public class NotaFicalCompra {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_nota_fiscal_compra")
    private Long id;
    @Column(nullable = false)
    private String numeroNota;
    @Column(nullable = false)
    private String serieNota;
    private String descricaoObs;
    @Column(nullable = false)
    private BigDecimal valorTotal;
    private BigDecimal valorDesconto;
    @Column(nullable = false)
    private BigDecimal valorIcms;
    @Column(nullable = false)
    private LocalDate dtCompra;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "pessoa_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "pessoa_fk"))
    private Pessoa pessoa;
    @ManyToOne
    @JoinColumn(name = "conta_pagar_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "conta_pagar_fk"))
    private ContaPagar contaPagar;

    public NotaFicalCompra() {
    }

    public NotaFicalCompra(Long id, String numeroNota, String serieNota, String descricaoObs, BigDecimal valorTotal, BigDecimal valorDesconto, BigDecimal valorIcms, LocalDate dtCompra, Pessoa pessoa, ContaPagar contaPagar) {
        this.id = id;
        this.numeroNota = numeroNota;
        this.serieNota = serieNota;
        this.descricaoObs = descricaoObs;
        this.valorTotal = valorTotal;
        this.valorDesconto = valorDesconto;
        this.valorIcms = valorIcms;
        this.dtCompra = dtCompra;
        this.pessoa = pessoa;
        this.contaPagar = contaPagar;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumeroNota() {
        return numeroNota;
    }

    public void setNumeroNota(String numeroNota) {
        this.numeroNota = numeroNota;
    }

    public String getSerieNota() {
        return serieNota;
    }

    public void setSerieNota(String serieNota) {
        this.serieNota = serieNota;
    }

    public String getDescricaoObs() {
        return descricaoObs;
    }

    public void setDescricaoObs(String descricaoObs) {
        this.descricaoObs = descricaoObs;
    }

    public BigDecimal getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(BigDecimal valorTotal) {
        this.valorTotal = valorTotal;
    }

    public BigDecimal getValorDesconto() {
        return valorDesconto;
    }

    public void setValorDesconto(BigDecimal valorDesconto) {
        this.valorDesconto = valorDesconto;
    }

    public BigDecimal getValorIcms() {
        return valorIcms;
    }

    public void setValorIcms(BigDecimal valorIcms) {
        this.valorIcms = valorIcms;
    }

    public LocalDate getDtCompra() {
        return dtCompra;
    }

    public void setDtCompra(LocalDate dtCompra) {
        this.dtCompra = dtCompra;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public ContaPagar getContaPagar() {
        return contaPagar;
    }

    public void setContaPagar(ContaPagar contaPagar) {
        this.contaPagar = contaPagar;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NotaFicalCompra that = (NotaFicalCompra) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
