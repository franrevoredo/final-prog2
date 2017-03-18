package ar.edu.um.programacion2.oficios.web;

import java.security.Principal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.MailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleafMainController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.um.programacion2.oficios.domain.CalificacionCliente;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Prestador;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.helper.MailClient;
import ar.edu.um.programacion2.oficios.reference.Categoria;
import ar.edu.um.programacion2.oficios.reference.Historial;
import ar.edu.um.programacion2.oficios.reference.Localidad;
import ar.edu.um.programacion2.oficios.reference.Persona;
import ar.edu.um.programacion2.oficios.service.impl.CalificacionClienteServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.CategoriaServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.ClienteServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.HistorialServiceImpl;
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
	
	@Autowired
    private MailClient mailClient;

	@Autowired
	HistorialServiceImpl historialService;
	
	@Autowired
	CalificacionClientesCollectionThymeleafController califcliCollection;

	@Autowired
	CalificacionClienteServiceImpl califcliService;

	@GetMapping("/testuser")
	public String testUser(Pageable pageable, Principal principal) {

		mailClient.prepareAndSend("francisco.r.89@gmail.com", "Niggas", "Sos un zapato");
		
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
	
	@GetMapping("/nueva-calificacion/{id}")
	public ModelAndView newCalificacionCliente(@PathVariable(value = "id") long id, Model model, Principal principal, Pageable pageable) {
		Cliente current = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		Servicio servicio = servicioService.findOne(id);
		
        model.addAttribute("calificacionCliente", new CalificacionCliente(current, servicio));
		califcliCollection.populateForm(model);
        return new ModelAndView("calificacionclientes/create");

	}
	
	@GetMapping("/nuevo-servicio")
	public String newServicio(Model model) {
        model.addAttribute("servicio", new Servicio());
		return "servicios/create";
	}

	@GetMapping("/ver-servicio/{id}")
	public ModelAndView verServicio(@PathVariable(value = "id") long id, Model model) {
		Servicio servicio = servicioService.findOne(id);
		model.addAttribute("servicio", servicio);
		model.addAttribute("mapstring", servicio.getLocalidad().getMapString());
		return new ModelAndView("servicios/show");
	}
	
	@GetMapping("/mis-servicios")
	public String misServicios(Model model, Pageable pageable, Principal principal) {
		Prestador current = (Prestador) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		List<Servicio> listaDeServicio = servicioService.findByPrestador(current, pageable).getContent();
		model.addAttribute("searchby", "Mis Servicios");
		model.addAttribute("serviciolist", listaDeServicio);
		return "search-result";
	}
	
	@GetMapping("/pedir-servicio/{id}")
	public ModelAndView pedirServicio(@PathVariable(value = "id") long id, Model model, Principal principal, Pageable pageable) {
		Servicio servicio = servicioService.findOne(id);
		Prestador prestador = servicio.getPrestador();
		Cliente current = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		
		String body = "El cliente " + current.getUsername() + " pidió contactarte. Su número de telefono es " + current.getTelefono() + ". \nGracias.";
		
		mailClient.prepareAndSend(prestador.getEmail(), "Solicitud de Servicio", body);
		
		body = "Solicitaste el servicio " + servicio.getNombre() + " del prestador " + prestador.getUsername() + ". Su numero de telefono es " + servicio.getTelefono() + ". \nGracias.";
		
		mailClient.prepareAndSend(current.getEmail(), "Solicitud de Servicio", body);
		
		Historial historial = new Historial();
		
		historial.setCliente(current);
		historial.setServicio(servicio);
		
		historialService.save(historial);

		model.addAttribute("servicio", servicio.getNombre());
		model.addAttribute("tumail", current.getEmail());
		
		return new ModelAndView("pedirservicio");
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
