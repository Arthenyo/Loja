package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "tb_nota_fiscal_venda")
@SequenceGenerator(name = "seq_nota_fiscal_venda",sequenceName = "seq_nota_fiscal_venda",allocationSize = 1,initialValue = 1)
public class NotaFiscalVenda {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_nota_fiscal_venda")
    private Long id;
    @Column(nullable = false)
    private String numero;
    @Column(nullable = false)
    private String serie;
    @Column(nullable = false)
    private String tipo;
    @Column(columnDefinition = "text",nullable = false)
    private String xml;
    @Column(columnDefinition = "text",nullable = false)
    private String pdf;
    @OneToOne
    @JoinColumn(name = "venda_compra_loja_vir_id",nullable = false,foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "venda_compra_loja_vir_fk"))
    private VendaCompraLojaVirtual vendaCompraLojaVirtual;

    public NotaFiscalVenda() {
    }

    public NotaFiscalVenda(Long id, String numero, String serie, String tipo, String xml, String pdf) {
        this.id = id;
        this.numero = numero;
        this.serie = serie;
        this.tipo = tipo;
        this.xml = xml;
        this.pdf = pdf;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getXml() {
        return xml;
    }

    public void setXml(String xml) {
        this.xml = xml;
    }

    public String getPdf() {
        return pdf;
    }

    public void setPdf(String pdf) {
        this.pdf = pdf;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NotaFiscalVenda that = (NotaFiscalVenda) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
