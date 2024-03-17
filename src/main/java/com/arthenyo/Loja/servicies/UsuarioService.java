package com.arthenyo.Loja.servicies;

import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.model.Usuario;
import com.arthenyo.Loja.projections.UserDetailsProjection;
import com.arthenyo.Loja.repositories.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioService implements UserDetailsService {
    @Autowired
    private UsuarioRepository repository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<UserDetailsProjection> result = repository.searchUserAndRolesByEmail(username);
        if(result.size() == 0){
            throw new UsernameNotFoundException("Usuario nao encontrado");
        }
        Usuario user = new Usuario();
        user.setLogin(username);
        user.setSenha(result.get(0).getPassword());
        for(UserDetailsProjection projection : result){
            user.addRole(new Acesso(projection.getRoleId(),projection.getAuthority()));
        }
        return user;
    }
}
