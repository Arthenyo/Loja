package com.arthenyo.Loja.controlleries;

import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.servicies.AcessoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/acesso")
public class AcessoController {
    @Autowired
    private AcessoService service;

    @PostMapping
    public ResponseEntity<Acesso> create(@RequestBody Acesso acesso){
        return ResponseEntity.ok().body(service.save(acesso));
    }
}
