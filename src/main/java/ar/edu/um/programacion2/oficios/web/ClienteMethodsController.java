package ar.edu.um.programacion2.oficios.web;

import java.security.Principal;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.service.impl.ClienteServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.PersonaServiceImpl;

@Controller
public class ClienteMethodsController {

	@Autowired
	PersonaServiceImpl personaService;

	@Autowired
	ClienteServiceImpl clienteService;

	@GetMapping("/ver-cliente/{id}")
	public ModelAndView verCliente(@PathVariable(value = "id") long id,
			Model model, Principal principal, Pageable pageable) {
		Boolean authorizedview = false;
		Cliente cliente = clienteService.findOne(id);
		Cliente current = (Cliente) personaService
				.findByUsername(principal.getName(), pageable).getContent()
				.get(0);
		if (cliente == null) {
			model.addAttribute("error", "NO EXISTE");
			model.addAttribute("message",
					"El cliente al que quiere acceder no existe");
			model.addAttribute("status", "404");
			return new ModelAndView("error");
		}

		if (cliente.equals(current)) {
			authorizedview = true;
			Set<Servicio> favoritos = cliente.getFavoritos();
			model.addAttribute("favoritos", favoritos);
		}
		model.addAttribute("cliente", cliente);
		model.addAttribute("authorizedview", authorizedview);
		return new ModelAndView("clientes/show");
	}

	@GetMapping("/editar-cliente/{id}")
	public ModelAndView editarCliente(@PathVariable(value = "id") long id,
			Model model, Principal principal, Pageable pageable) {
		Cliente cliente = clienteService.findOne(id);
		Cliente current = (Cliente) personaService
				.findByUsername(principal.getName(), pageable).getContent()
				.get(0);
		if (cliente.equals(current)) {
			Set<Servicio> favoritos = cliente.getFavoritos();
			model.addAttribute("favoritos", favoritos);
		}
		model.addAttribute("cliente", cliente);
		return new ModelAndView("clientes/show");
	}

}
