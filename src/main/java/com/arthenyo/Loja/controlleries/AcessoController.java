package com.arthenyo.Loja.controlleries;

import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.servicies.AcessoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/acesso")
public class AcessoController {
    @Autowired
    private AcessoService service;

    @GetMapping("/{id}")
    public ResponseEntity<Acesso> findById(@PathVariable Long id){
        Acesso acesso = service.findById(id);
        return ResponseEntity.ok().body(acesso);
    }
    @GetMapping
    public ResponseEntity<List<Acesso>> findAll(){
        List<Acesso> acesso = service.findAll();
        return ResponseEntity.ok().body(acesso);
    }

    @ResponseBody
    @PostMapping
    public ResponseEntity<Acesso> create(@RequestBody Acesso acesso){
        Acesso entity = service.save(acesso);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequestUri().path("/{id}")
                .buildAndExpand(entity.getId()).toUri();
        return ResponseEntity.created(uri).body(entity);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id){
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
