package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tb_imagem_produto")
@SequenceGenerator(name = "seq_imagem_produto",sequenceName = "seq_imagem_produto",allocationSize = 1,initialValue = 1)
public class ImagemProduto {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seq_imagem_produto")
    private Long id;
    @Column(columnDefinition = "text",nullable = false)
    private String imagemOriginal;
    @Column(columnDefinition = "text",nullable = false)
    private String imagemMiniatura;
    @ManyToOne
    @JoinColumn(name = "produto_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "produto_fk"))
    private Produto produto;

    public ImagemProduto() {
    }

    public ImagemProduto(Long id, String imagemOriginal, String imagemMiniatura, Produto produto) {
        this.id = id;
        this.imagemOriginal = imagemOriginal;
        this.imagemMiniatura = imagemMiniatura;
        this.produto = produto;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImagemOriginal() {
        return imagemOriginal;
    }

    public void setImagemOriginal(String imagemOriginal) {
        this.imagemOriginal = imagemOriginal;
    }

    public String getImagemMiniatura() {
        return imagemMiniatura;
    }

    public void setImagemMiniatura(String imagemMiniatura) {
        this.imagemMiniatura = imagemMiniatura;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ImagemProduto that = (ImagemProduto) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
