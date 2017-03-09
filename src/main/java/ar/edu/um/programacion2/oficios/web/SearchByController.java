package ar.edu.um.programacion2.oficios.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.service.impl.CategoriaServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.LocalidadServiceImpl;
import ar.edu.um.programacion2.oficios.service.impl.ServicioServiceImpl;

@Controller
@RequestMapping(value = "/buscar", name = "SearchByController")
public class SearchByController {

	@Autowired
	ServicioServiceImpl servicioService;

	@Autowired
	CategoriaServiceImpl catService;

	@GetMapping("/buscar-cat")
	public String buscarCat(Model model) {
		model.addAttribute("categorias", catService.findAll());
		return "search/bycategoria";
	}

	@GetMapping("/buscar-cat/term")
	public String buscarCat(Model model, @RequestParam("categoria-name") String categoria, Pageable pageable) {
		List<Servicio> listaDeServicio = servicioService
				.findByCategoria(catService.findByNombre(categoria, pageable).getContent().get(0), pageable)
				.getContent();
		System.out.println("Los Servicios son: ");
		for (Servicio servicio : listaDeServicio) {
			System.out.println("\n Nombre: " + servicio.getNombre());
		}
		model.addAttribute("searchby", categoria);
		model.addAttribute("serviciolist", listaDeServicio);

		return "search-result";
	}
}
