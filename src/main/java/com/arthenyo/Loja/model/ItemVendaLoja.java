package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tb_item_venda_loja")
@SequenceGenerator(name = "seq_item_venda_loja", sequenceName = "seq_item_venda_loja",allocationSize = 1, initialValue = 1)
public class ItemVendaLoja {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seq_item_venda_loja")
    private Long id;
    private Double quantidade;
    @ManyToOne
    @JoinColumn(name = "produto_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "produto_fk"))
    private Produto produto;
    @ManyToOne
    @JoinColumn(name = "vd_cp_loja_virt_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "vd_cp_loja_virt_fk"))
    private VendaCompraLojaVirtual vendaCompraLojaVirtual;

    public ItemVendaLoja() {
    }

    public ItemVendaLoja(Long id, Double quantidade, Produto produto, VendaCompraLojaVirtual vendaCompraLojaVirtual) {
        this.id = id;
        this.quantidade = quantidade;
        this.produto = produto;
        this.vendaCompraLojaVirtual = vendaCompraLojaVirtual;
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

    public VendaCompraLojaVirtual getVendaCompraLojaVirtual() {
        return vendaCompraLojaVirtual;
    }

    public void setVendaCompraLojaVirtual(VendaCompraLojaVirtual vendaCompraLojaVirtual) {
        this.vendaCompraLojaVirtual = vendaCompraLojaVirtual;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItemVendaLoja that = (ItemVendaLoja) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
