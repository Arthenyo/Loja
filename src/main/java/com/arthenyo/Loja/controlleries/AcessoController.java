package com.arthenyo.Loja.controlleries;

import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.servicies.AcessoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/acesso")
public class AcessoController {
    @Autowired
    private AcessoService service;

    @ResponseBody
    @PostMapping
    public ResponseEntity<Acesso> create(@RequestBody Acesso acesso){
        Acesso entity = service.save(acesso);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequestUri().path("/{id}")
                .buildAndExpand(entity.getId()).toUri();
        return ResponseEntity.created(uri).body(entity);
    }
}
