package com.arthenyo.Loja.model;

import com.arthenyo.Loja.enums.StatusContaPagar;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "tb_conta_pagar")
@SequenceGenerator(name = "seq_conta_pagar", sequenceName = "seq_conta_pagar", allocationSize = 1, initialValue = 1)
public class ContaPagar {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_conta_pagar")
    private Long id;
    @Column(nullable = false)
    private String descricao;
    @Column(nullable = false)
    private BigDecimal valorTotal;
    private BigDecimal valorDesconto;
    @Column(nullable = false)
    private LocalDate dtVencimento;
    private LocalDate dtPagemnto;
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private StatusContaPagar status;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "pessoa_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "pessoa_fk"))
    private Pessoa pessoa;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "pessoa_forn_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "pessoa_forn_id"))
    private Pessoa pessoaFornecedor;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "empresa_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "empresa_fk"))
    private Pessoa empresa;

    public ContaPagar() {
    }

    public ContaPagar(Long id, String descricao, BigDecimal valorTotal, BigDecimal valorDesconto, LocalDate dtVencimento, LocalDate dtPagemnto, StatusContaPagar status, Pessoa pessoa, Pessoa pessoaFornecedor, Pessoa empresa) {
        this.id = id;
        this.descricao = descricao;
        this.valorTotal = valorTotal;
        this.valorDesconto = valorDesconto;
        this.dtVencimento = dtVencimento;
        this.dtPagemnto = dtPagemnto;
        this.status = status;
        this.pessoa = pessoa;
        this.pessoaFornecedor = pessoaFornecedor;
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

    public LocalDate getDtVencimento() {
        return dtVencimento;
    }

    public void setDtVencimento(LocalDate dtVencimento) {
        this.dtVencimento = dtVencimento;
    }

    public LocalDate getDtPagemnto() {
        return dtPagemnto;
    }

    public void setDtPagemnto(LocalDate dtPagemnto) {
        this.dtPagemnto = dtPagemnto;
    }

    public StatusContaPagar getStatus() {
        return status;
    }

    public void setStatus(StatusContaPagar status) {
        this.status = status;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public Pessoa getPessoaFornecedor() {
        return pessoaFornecedor;
    }

    public void setPessoaFornecedor(Pessoa pessoaFornecedor) {
        this.pessoaFornecedor = pessoaFornecedor;
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
        ContaPagar that = (ContaPagar) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
