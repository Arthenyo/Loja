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
    private Double quantidade;
    @ManyToOne
    @JoinColumn(name = "produto_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "produto_fk"))
    private Produto produto;
    @ManyToOne
    @JoinColumn(name = "nota_fiscal_compra_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "nota_fiscal_compra_fk"))
    private NotaFicalCompra notaFicalCompra;

    public NotaItemProduto() {
    }

    public NotaItemProduto(Long id, Double quantidade, Produto produto, NotaFicalCompra notaFicalCompra) {
        this.id = id;
        this.quantidade = quantidade;
        this.produto = produto;
        this.notaFicalCompra = notaFicalCompra;
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
