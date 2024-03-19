package com.arthenyo.Loja.controlleries;

import com.arthenyo.Loja.model.PessoaFisica;
import com.arthenyo.Loja.servicies.PessoaFisicaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/pessoa-fisica")
public class PessoaFisicaController {

    @Autowired
    private PessoaFisicaService service;
    @ResponseBody
    @PostMapping
    public ResponseEntity<PessoaFisica> salvarPessoaFisica(@RequestBody PessoaFisica pessoaFisica){
        PessoaFisica entity = service.salvarPessoaFisica(pessoaFisica);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequestUri().path("/{id}")
                .buildAndExpand(entity.getId()).toUri();
        return ResponseEntity.created(uri).body(entity);
    }
}
