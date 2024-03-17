package com.arthenyo.Loja.servicies;

import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.repositories.AcessoRepository;
import com.arthenyo.Loja.servicies.excptions.DateBaseException;
import com.arthenyo.Loja.servicies.excptions.ObjectNotFound;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AcessoService {
    @Autowired
    private AcessoRepository repository;
    @Transactional(readOnly = true)
    public List<Acesso> findAll(){
        List<Acesso> acessos = repository.findAll();
        return acessos;
    }
    @Transactional(readOnly = true)
    public Acesso findById(Long id){
        Acesso acesso = repository.findById(id)
                .orElseThrow(() -> new ObjectNotFound("Acesso nao encontrado"));
        return acesso;
    }
    @Transactional(readOnly = true)
    public List<Acesso> findByDesc(String desc){
        List<Acesso> acesso = repository.buscarAcessoDesc(desc);
        if(!acesso.isEmpty()){
            throw new ObjectNotFound("Acesso nao encontrado");
        }
        return acesso;
    }
    @Transactional
    public Acesso save(Acesso acesso){
        return repository.save(acesso);
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public void delete(Long id){
        if(repository.existsById(id)){
            throw new ObjectNotFound("Acesso não encontrado");
        }
        try{
            repository.deleteById(id);
        }catch (DataIntegrityViolationException e){
            throw new DateBaseException("Obejto nao pode ser apagado, pois existe outro objeto vinculado a ele");
        }

    }
}
