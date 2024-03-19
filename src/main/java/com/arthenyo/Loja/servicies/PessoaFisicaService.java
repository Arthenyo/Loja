package com.arthenyo.Loja.servicies;

import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.model.PessoaFisica;
import com.arthenyo.Loja.model.Usuario;
import com.arthenyo.Loja.repositories.PessoaFisicaRepository;
import com.arthenyo.Loja.repositories.UsuarioRepository;
import com.arthenyo.Loja.servicies.excptions.LojaException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class PessoaFisicaService {
    @Autowired
    private PessoaFisicaRepository repository;
    @Autowired
    private UsuarioRepository usuarioRepository;

    public PessoaFisica salvarPessoaFisica(PessoaFisica pessoaFisica){
        if(pessoaFisica.getCpf() == null || repository.existeCpfCadastrado(pessoaFisica.getCpf()) != null){
            throw new LojaException("CPJ ja existe ou estar em branco");
        }
        pessoaFisica = repository.save(pessoaFisica);
        cadastrarUsuario(pessoaFisica);
        return pessoaFisica;
    }
    public void cadastrarUsuario(PessoaFisica pessoaFisica){
        Usuario usuario = usuarioRepository.findUsuarioByPessoa(pessoaFisica.getId(),pessoaFisica.getEmail());
        if(usuario == null){
            usuario = new Usuario();
            usuario.setDtAtualSenha(LocalDate.now());
            usuario.setPessoa(pessoaFisica);
            usuario.setLogin(pessoaFisica.getNome());
            String senha = "" + LocalDate.now();
            senha = new BCryptPasswordEncoder().encode(senha);
            usuario.setSenha(senha);
            usuarioRepository.save(usuario);
            usuarioRepository.insereAcessoUserPj(usuario.getId());
        }
    }
}
