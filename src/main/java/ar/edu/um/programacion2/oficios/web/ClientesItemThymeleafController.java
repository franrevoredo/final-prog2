package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.domain.Prestador;
import ar.edu.um.programacion2.oficios.reference.Persona;
import ar.edu.um.programacion2.oficios.service.impl.PersonaServiceImpl;
import ar.edu.um.programacion2.oficios.web.reports.ExportingErrorException;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

/**
 * = ClientesItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Cliente.class, type = ControllerType.ITEM)
@RooThymeleaf
public class ClientesItemThymeleafController {

	@Autowired
	PersonaServiceImpl personaService;
	
	/**
     * TODO Auto-generated method documentation
     * 
     * @param cliente
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView editForm(@ModelAttribute Cliente cliente, Model model, Principal principal, Pageable pageable, HttpServletRequest request) {
    	Persona user = personaService.findByUsername(principal.getName(), pageable).getContent().get(0);
    	if(cliente.getId() == user.getId() || request.isUserInRole("ROLE_ADMINISTRADOR")) {
	    	populateForm(model);
	        model.addAttribute("cliente", cliente);
	        return new ModelAndView("clientes/edit");
    	}
    	throw new SecurityException("No tiene permiso para editar ese usuario");
    }
    
}
