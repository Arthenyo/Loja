package com.arthenyo.Loja.repositories;

import com.arthenyo.Loja.model.Usuario;
import com.arthenyo.Loja.projections.UserDetailsProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface UsuarioRepository extends JpaRepository<Usuario,Long> {

	@Query(nativeQuery = true, value = """
			SELECT tb_usuario.login AS username, tb_usuario.senha AS password, tb_acesso.id AS roleId, tb_acesso.descricao AS authority
			FROM tb_usuario
			INNER JOIN tb_usuario_acesso ON tb_usuario.id = tb_usuario_acesso.usuario_id
			INNER JOIN tb_acesso ON tb_acesso.id = tb_usuario_acesso.acesso_id
			WHERE tb_usuario.login = :login
		""")
	List<UserDetailsProjection> searchUserAndRolesByEmail(String login);

}
