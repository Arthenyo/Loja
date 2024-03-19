package com.arthenyo.Loja.repositories;

import com.arthenyo.Loja.model.Pessoa;
import com.arthenyo.Loja.model.PessoaFisica;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PessoaFisicaRepository extends JpaRepository<Pessoa,Long> {

    @Query(value = "select pf from PessoaFisica pf where pf.cpf = ?1")
    PessoaFisica existeCpfCadastrado(String cpf);
}
