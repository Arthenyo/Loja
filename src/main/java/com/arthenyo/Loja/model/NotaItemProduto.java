package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tb_nota_item_produto")
@SequenceGenerator(name = "seq_nota_item_produto",sequenceName = "seq_nota_item_produto",allocationSize = 1,initialValue = 1)
public class NotaItemProduto {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_nota_item_produto")
    private Long id;
    @Column(nullable = false)
    private Double quantidade;
    @ManyToOne
    @JoinColumn(name = "produto_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "produto_fk"))
    private Produto produto;
    @ManyToOne
    @JoinColumn(name = "nota_fiscal_compra_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "nota_fiscal_compra_fk"))
    private NotaFicalCompra notaFicalCompra;
    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(name = "empresa_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "empresa_fk"))
    private Pessoa empresa;

    public NotaItemProduto() {
    }

    public NotaItemProduto(Long id, Double quantidade, Produto produto, NotaFicalCompra notaFicalCompra, Pessoa empresa) {
        this.id = id;
        this.quantidade = quantidade;
        this.produto = produto;
        this.notaFicalCompra = notaFicalCompra;
        this.empresa = empresa;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Double quantidade) {
        this.quantidade = quantidade;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public NotaFicalCompra getNotaFicalCompra() {
        return notaFicalCompra;
    }

    public void setNotaFicalCompra(NotaFicalCompra notaFicalCompra) {
        this.notaFicalCompra = notaFicalCompra;
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
        NotaItemProduto that = (NotaItemProduto) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
