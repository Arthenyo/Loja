package com.arthenyo.Loja;

import com.arthenyo.Loja.controlleries.AcessoController;
import com.arthenyo.Loja.model.Acesso;
import com.arthenyo.Loja.repositories.AcessoRepository;
import com.arthenyo.Loja.servicies.AcessoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = LojaApplication.class)
class LojaApplicationTests {
	@Autowired
	private AcessoController controller;

	@Test
	public void testeCadastraAcesso() {

		Acesso acesso = new Acesso();
		acesso.setDescricao("ROLE_ADMIN");
		controller.create(acesso);
	}

}
