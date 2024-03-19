package com.arthenyo.Loja.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "tb_acesso")
@SequenceGenerator(name = "seq_acesso",sequenceName = "seq_acesso",allocationSize = 1, initialValue = 1)
public class Acesso implements GrantedAuthority {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_acesso")
    private Long id;
    @Column(nullable = false,unique = true)
    private String descricao;

    public Acesso() {
    }
    public Acesso(Long id, String descricao) {
        this.id = id;
        this.descricao = descricao;
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
    @JsonIgnore
    @Override
    public String getAuthority() {
        return this.descricao;
    }
}
