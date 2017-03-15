package ar.edu.um.programacion2.oficios.web;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.helper.StringHelper;
import ar.edu.um.programacion2.oficios.service.impl.CategoriaServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.ClienteServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.LocalidadServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.PersonaServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.ServicioServiceImpl;

@Controller
@RequestMapping(value = "/buscar", name = "SearchByController")
public class SearchByController {

	@Autowired
	ServicioServiceImpl servicioService;

	@Autowired
	CategoriaServiceImpl catService;
	
	@Autowired
	PersonaServiceImpl personaService;

	@Autowired
	ClienteServiceImpl clienteService;


	@GetMapping("/buscar-cat")
	public String buscarCat(Model model) {
		model.addAttribute("categorias", catService.findAll());
		return "search/bycategoria";
	}
	
	@GetMapping("/buscar-nom")
	public String buscarNom(Model model) {
		return "search/bynombre";
	}
	
	@GetMapping("/buscar-fav")
	public String buscarFav(Model model, Principal principal, Pageable pageable) {
		Cliente user = (Cliente) personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
		Set<Servicio> favoritos = user.getFavoritos();
		model.addAttribute("searchby", "Favoritos");
		model.addAttribute("serviciolist", favoritos);
		return "search-result";
	}

	@GetMapping("/buscar-cat/term")
	public String buscarCat(Model model, @RequestParam("categoria") long idcat, Pageable pageable) {
		List<Servicio> listaDeServicio = servicioService
				.findByCategoria(catService.findOne(idcat), pageable)
				.getContent();
		model.addAttribute("searchby", "Categoría");
		model.addAttribute("serviciolist", listaDeServicio);

		return "search-result";
	}
	
	@GetMapping("/buscar-nom/term")
	public String buscarNom(Model model, @RequestParam("nombre") String nombre, Pageable pageable) {
		List<Servicio> servicios = servicioService.findAll();
		List<Servicio> listaDeServicio = new ArrayList<Servicio>();
		
		String nombre_curated = StringHelper.rmEspeciales(nombre.toLowerCase());
		for(Servicio servicio : servicios) {
			String nombre_servicio = StringHelper.rmEspeciales(servicio.getNombre().toLowerCase());
			System.out.println("\n " + nombre_curated + " " + nombre_servicio);
			if(nombre_servicio.contains(nombre_curated)) {
				listaDeServicio.add(servicio);
			}
		}
		
		model.addAttribute("searchby", "Nombre");
		model.addAttribute("serviciolist", listaDeServicio);
		return "search-result";
	}
	
}
