package com.arthenyo.Loja.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "tb_usuario")
@SequenceGenerator(name = "seq_usuario",sequenceName = "seq_usuario",allocationSize = 1, initialValue = 1)
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_usuario")
    private Long id;
    private String login;
    private String senha;
    private LocalDate dtAtualSenha;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tb_usuario_acesso",uniqueConstraints = @UniqueConstraint(columnNames = {"usuario_id","acesso_id"},
    name = "unique_acesso_user"),
    joinColumns = @JoinColumn(name = "usuario_id",referencedColumnName = "id",table = "tb_usuario",unique = false,
    foreignKey = @ForeignKey(name = "usuario_fk",value = ConstraintMode.CONSTRAINT)),
    inverseJoinColumns = @JoinColumn(name = "acesso_id", unique = false,referencedColumnName = "id",table = "tb_acesso",
    foreignKey = @ForeignKey(name = "acesso_fk",value = ConstraintMode.CONSTRAINT)))
    private List<Acesso> acessos= new ArrayList<>();

    public Usuario(Long id, String login, String senha, LocalDate dtAtualSenha) {
        this.id = id;
        this.login = login;
        this.senha = senha;
        this.dtAtualSenha = dtAtualSenha;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public LocalDate getDtAtualSenha() {
        return dtAtualSenha;
    }

    public void setDtAtualSenha(LocalDate dtAtualSenha) {
        this.dtAtualSenha = dtAtualSenha;
    }

    public List<Acesso> getAcessos() {
        return acessos;
    }

    public void setAcessos(List<Acesso> acessos) {
        this.acessos = acessos;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Usuario usuario = (Usuario) o;
        return Objects.equals(id, usuario.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
