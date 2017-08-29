package ar.edu.um.programacion2.oficios.web;

import java.security.Principal;
import java.util.Set;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

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
		
		if (cliente == null) {
			model.addAttribute("error", "NO EXISTE");
			model.addAttribute("message",
					"El cliente al que quiere acceder no existe");
			model.addAttribute("status", "404");
			return new ModelAndView("error");
		}
		
		Cliente current = (Cliente) personaService
				.findByUsername(principal.getName(), pageable).getContent()
				.get(0);
		if (cliente.equals(current)) {
			model.addAttribute("cliente", cliente);
		} else {
			model.addAttribute("error", "NO HAY PERMISOS");
			model.addAttribute("message",
					"El cliente al que quiere editar no está dentro de sus permisos");
			model.addAttribute("status", "403");
			return new ModelAndView("error");
		}

        return new ModelAndView("clientes/editgui");
	}

    @PutMapping("/editar-cliente/")
    public ModelAndView clienteUpdateGui(@Valid @ModelAttribute Cliente cliente, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
    	
    	System.out.println("ZAPATO: " + cliente.getId());
    	
        if (result.hasErrors()) {
            model.addAttribute("cliente", cliente);
            
            return new ModelAndView("clientes/edit");
        }
        // Concurrency control
        Cliente existingCliente = clienteService.findOne(cliente.getId());
        if(cliente.getVersion() != existingCliente.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            model.addAttribute("cliente", cliente);
            model.addAttribute("concurrency", true);
            return new ModelAndView("clientes/edit");
        } else if(cliente.getVersion() != existingCliente.getVersion() && "discard".equals(concurrencyControl)){
            model.addAttribute("cliente", existingCliente);
            model.addAttribute("concurrency", false);
            return new ModelAndView("clientes/edit");
        } else if(cliente.getVersion() != existingCliente.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            cliente.setVersion(existingCliente.getVersion());
        }
        
        
        Cliente savedCliente = clienteService.save(cliente);
        return new ModelAndView("redirect:" + "/ver-cliente/" + cliente.getId());
    }
	
}
