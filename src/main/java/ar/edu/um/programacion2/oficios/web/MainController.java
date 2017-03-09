package ar.edu.um.programacion2.oficios.web;

import java.security.Principal;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleafMainController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.reference.Categoria;
import ar.edu.um.programacion2.oficios.reference.Localidad;
import ar.edu.um.programacion2.oficios.reference.Persona;
import ar.edu.um.programacion2.oficios.service.impl.CategoriaServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.ClienteServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.LocalidadServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.PersonaServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.ServicioServiceImpl;

/**
 * = MainController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooThymeleafMainController
public class MainController {

	@Autowired
	LocalidadServiceImpl localidadService;

	@Autowired
	ServicioServiceImpl servicioService;

	@Autowired
	CategoriaServiceImpl catService;

	@Autowired
	PersonaServiceImpl personaService;

	@Autowired
	ClienteServiceImpl clienteService;

	@GetMapping("/testuser")
	public String testUser(Pageable pageable) {

		Cliente c1 = new Cliente("Juan", "Perez", "Niggas 123", localidadService.findOne((long) 2));

		Set<Servicio> favoritos = new HashSet<Servicio>(servicioService.findAll());

		c1.setFavoritos(favoritos);

		System.out.println(servicioService
				.findByCategoria(catService.findByNombre("Fontanería", pageable).getContent().get(0), pageable)
				.getContent());

		// System.out.println(c1.toString());

		return "index";
	}

	@GetMapping("/myprofile")
	public ModelAndView myProfile(Model model, Principal principal, Pageable pageable) {
		Persona user = personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		return new ModelAndView("redirect:/ver-cliente/" + user.getId());
	}

	@GetMapping("/add-fav/{id}")
	public ModelAndView addFavorite(Model model, Principal principal, Pageable pageable,
			@PathVariable(value = "id") long id) {
		Cliente user = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		Servicio servicio = servicioService.findOne(id);
		Set<Servicio> favoritos = user.getFavoritos();
		favoritos.add(servicio);

		user.setFavoritos(favoritos);

		clienteService.save(user);

		return new ModelAndView("redirect:/ver-cliente/" + user.getId());
	}
	
	@GetMapping("/del-fav/{id}")
	public ModelAndView delFavorite(Model model, Principal principal, Pageable pageable,
			@PathVariable(value = "id") long id) {
		Cliente user = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		Servicio servicio = servicioService.findOne(id);
		Set<Servicio> favoritos = user.getFavoritos();
		favoritos.remove(servicio);

		user.setFavoritos(favoritos);

		clienteService.save(user);

		return new ModelAndView("redirect:/ver-cliente/" + user.getId());
	}

	@GetMapping("/register")
	public String register(Model model) {
		return "register";
	}

	@GetMapping("/ver-servicio/{id}")
	public ModelAndView verServicio(@PathVariable(value = "id") long id, Model model) {
		Servicio servicio = servicioService.findOne(id);
		model.addAttribute("servicio", servicio);
		model.addAttribute("mapstring", servicio.getLocalidad().getMapString());
		return new ModelAndView("servicios/show");
	}

	@GetMapping("/ver-cliente/{id}")
	public ModelAndView verCliente(@PathVariable(value = "id") long id, Model model, Principal principal,
			Pageable pageable) {
		Cliente cliente = clienteService.findOne(id);
		Cliente current = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		if (cliente.equals(current)) {
			Set<Servicio> favoritos = cliente.getFavoritos();
			model.addAttribute("favoritos", favoritos);
		}
		model.addAttribute("cliente", cliente);
		return new ModelAndView("clientes/show");
	}
}
