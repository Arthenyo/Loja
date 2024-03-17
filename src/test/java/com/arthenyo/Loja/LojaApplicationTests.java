package com.arthenyo.Loja;

import com.arthenyo.Loja.controlleries.AcessoController;
import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.repositories.AcessoRepository;
import com.arthenyo.Loja.servicies.AcessoService;
import junit.framework.TestCase;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest(classes = LojaApplication.class)
class LojaApplicationTests extends TestCase {
	@Autowired
	private AcessoController controller;

	@Test
	public void testeCadastraAcesso() {

		Acesso acesso = new Acesso();

		acesso.setDescricao("ROLE_ADMIN");

		assertEquals(true, acesso.getId() == null);

		/*Gravou no banco de dados*/
		acesso = controller.create(acesso).getBody();

		assertEquals(true, acesso.getId() > 0);

		/*Validar dados salvos da forma correta*/
		assertEquals("ROLE_ADMIN", acesso.getAuthority());

		/*Teste de carregamento*/

		Acesso acesso2 = controller.findById(acesso.getId()).getBody();

		assertEquals(acesso.getId(), acesso2.getId());


		/*Teste de delete*/

		controller.delete(acesso2.getId());

		Acesso acesso3 = controller.findById(acesso2.getId()).getBody();

		assertEquals(true, acesso3 == null);
	}

}
