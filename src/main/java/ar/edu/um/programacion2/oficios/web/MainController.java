package ar.edu.um.programacion2.oficios.web;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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
import ar.edu.um.programacion2.oficios.domain.CalificacionPrestador;
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
	CalificacionPrestadorsCollectionThymeleafController califpresCollection;
	
	@Autowired
	CalificacionClienteServiceImpl califcliService;
	
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     * @return String
     */
    @GetMapping("/")
    public String index(Model model, Principal principal, Pageable pageable, HttpServletRequest request) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());

        if(request.isUserInRole("ROLE_PRESTADOR")) { //Si el usuario que entra al index es prestador, busco si tiene calificaciones sin calificar entre sus servicios.

        	Prestador user = (Prestador) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);

        	if(user != null) {
        		List<Historial> pendientes = new ArrayList<Historial>();

        		List<Servicio> servicios = servicioService.findByPrestador(user, pageable).getContent();

        		for(Servicio servicio : servicios) {
        			List<Historial> historial = historialService.findByServicio(servicio, pageable).getContent();
        			for(Historial item : historial) {
        				if(item.getCalificacion_cliente() != null || item.getCalificacion_prestador() == null) {
        					pendientes.add(item);
        				}
        			}
        		}
        		model.addAttribute("pendientes", pendientes);
        	}

        }
        return "index";
    }

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
	public ModelAndView newCalificacionCliente(Model model, Principal principal, Pageable pageable,
			@PathVariable(value = "id") long hist_id) {
		Cliente current = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);

		Historial historial = historialService.findOne(hist_id);

		if(historial == null) {
			model.addAttribute("error", "NOT FOUND");
			model.addAttribute("message", "Esa transacción no existe.");
			model.addAttribute("status", "404");
			return new ModelAndView("error");
			
		} else if(historial.getCliente().getId() != current.getId()) {
			model.addAttribute("error", "FORBIDDEN");
			model.addAttribute("message", "Usted no contrato ese servicio. No lo puede puntuar.");
			model.addAttribute("status", "403");
			return new ModelAndView("error");
			
		}


		Servicio servicio = historial.getServicio();
		model.addAttribute("calificacionCliente", new CalificacionCliente(current, servicio));
		califcliCollection.populateForm(model);
		model.addAttribute("hist_id", hist_id);
        return new ModelAndView("calificacionclientes/create");

	}
	
	@GetMapping("/responder-calificacion/{id}")
	public ModelAndView newCalificacionPrestador(Model model, Principal principal, Pageable pageable, HttpServletRequest request,
			@PathVariable(value = "id") Long hist_id) {
		
		if(hist_id == null ) {
			model.addAttribute("error", "NULL HISTORY");
			model.addAttribute("message", "No se puede buscar un historial con id nulo.");
			model.addAttribute("status", "500");
			return new ModelAndView("error");
		}
		 
		if(request.isUserInRole("ROLE_PRESTADOR")) {

			Prestador user = (Prestador) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);

			if(user != null) {
				
				Historial historial = historialService.findOne(hist_id);
				
				CalificacionCliente calif = historial.getCalificacion_cliente();

				System.out.println(calif);
				
				if(calif == null) {
					model.addAttribute("error", "NOT FOUND");
					model.addAttribute("message", "Esa calificación no existe, no puede cambiarla.");
					model.addAttribute("status", "404");
					return new ModelAndView("error");
				} else if(calif.getServicio().getPrestador().getId() != user.getId()) {
					model.addAttribute("error", "FORBIDDEN");
					model.addAttribute("message", "Usted no es el prestador de ese servicio. No puede responder sus calificaciones.");
					model.addAttribute("status", "403");
					return new ModelAndView("error");
				}

				model.addAttribute("calificacionCliente", new CalificacionPrestador(calif, user));
				califpresCollection.populateForm(model);
				return new ModelAndView("calificacionprestador/create");

			} else {
				model.addAttribute("error", "INTERNAL SERVER ERROR");
				model.addAttribute("message", "No pudo encontrarse su usuario, intente nuevamente o contacte un administrador.");
				model.addAttribute("status", "500");
				return new ModelAndView("error");
			}
		} else {
			model.addAttribute("error", "FORBIDDEN");
			model.addAttribute("message", "Su usuario no es un prestador, no puede responder otras calificaciones.");
			model.addAttribute("status", "403");
			return new ModelAndView("error");
		}

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
	public ModelAndView pedirServicio(@PathVariable(value = "id") long id, Model model, Principal principal, Pageable pageable, HttpServletRequest request) {
		Servicio servicio = servicioService.findOne(id);
		Prestador prestador = servicio.getPrestador();
		Cliente current = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		
		//Email al prestador
		
		String body = "<h2>El cliente <i>" + current.getUsername() + "</i> solicitó uno de tus servicios.</h2><br> Se le proporcionó el número de teléfono del servicio" + servicio.getNombre() + ".<br><br> Si el cliente no concreta su pedido en 24h, te recomendamos recordarselo coordialmente. Su número es <b>" + current.getTelefono() + "</b> <br>Gracias.";
		
		mailClient.prepareAndSend(prestador.getEmail(), "Solicitud de Servicio " + servicio.getNombre(), body);
	
		//Creamos el historial de la operación
		
		Historial historial = new Historial();
		
		historial.setCliente(current);
		historial.setServicio(servicio);
		
		Historial newHistorial = historialService.save(historial);
		
		//Email al cliente
		
		String reviewLink = "http://" + request.getServerName().toString() + ":" + request.getLocalPort() + "/nueva-calificacion/" +  newHistorial.getId();

		body = "<h2>Solicitaste el servicio <i>" + servicio.getNombre() + "</i> del prestador <i>" + prestador.getUsername() + "</i>.</h2><p>Su numero de telefono es <b>" + servicio.getTelefono() + "</b> <br><br> No olvides de puntar el servicio luego de concretado:  <a href='" + reviewLink +"'>Puntuar Ahora</a></p> <br>Gracias.";
		
		mailClient.prepareAndSend(current.getEmail(), "Solicitaste un Servicio", body);
		
		model.addAttribute("historialid", newHistorial.getId());
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
