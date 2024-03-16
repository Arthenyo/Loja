package com.arthenyo.Loja.servicies;

import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.repositories.AcessoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AcessoService {
    @Autowired
    private AcessoRepository repository;

    public Acesso save(Acesso acesso){
        return repository.save(acesso);
    }
}
