// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.service.api.ClienteService;
import ar.edu.um.programacion2.oficios.web.ClientesItemThymeleafController;
import ar.edu.um.programacion2.oficios.web.ClientesItemThymeleafLinkFactory;
import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.util.Locale;
import javax.validation.Valid;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect ClientesItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: ClientesItemThymeleafController: @Controller;
    
    declare @type: ClientesItemThymeleafController: @RequestMapping(value = "/clientes/{cliente}", name = "ClientesItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource ClientesItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<ClientesItemThymeleafController> ClientesItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param clienteService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public ClientesItemThymeleafController.new(ClienteService clienteService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setClienteService(clienteService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(ClientesItemThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource ClientesItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void ClientesItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<ClientesItemThymeleafController> ClientesItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void ClientesItemThymeleafController.setItemLink(MethodLinkBuilderFactory<ClientesItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Cliente
     */
    @ModelAttribute
    public Cliente ClientesItemThymeleafController.getCliente(@PathVariable("cliente") Long id, Locale locale, HttpMethod method) {
        Cliente cliente = null;
        if (HttpMethod.PUT.equals(method)) {
            cliente = clienteService.findOneForUpdate(id);
        } else {
            cliente = clienteService.findOne(id);
        }
        
        if (cliente == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Cliente", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return cliente;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param cliente
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView ClientesItemThymeleafController.show(@ModelAttribute Cliente cliente, Model model) {
        model.addAttribute("cliente", cliente);
        return new ModelAndView("clientes/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param cliente
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView ClientesItemThymeleafController.showInline(@ModelAttribute Cliente cliente, Model model) {
        model.addAttribute("cliente", cliente);
        return new ModelAndView("clientes/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("cliente")
    public void ClientesItemThymeleafController.initClienteBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void ClientesItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void ClientesItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param cliente
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView ClientesItemThymeleafController.editForm(@ModelAttribute Cliente cliente, Model model) {
        populateForm(model);
        
        model.addAttribute("cliente", cliente);
        return new ModelAndView("clientes/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param cliente
     * @param version
     * @param concurrencyControl
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView ClientesItemThymeleafController.update(@Valid @ModelAttribute Cliente cliente, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("clientes/edit");
        }
        // Concurrency control
        Cliente existingCliente = getClienteService().findOne(cliente.getId());
        if(cliente.getVersion() != existingCliente.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            populateForm(model);
            model.addAttribute("cliente", cliente);
            model.addAttribute("concurrency", true);
            return new ModelAndView("clientes/edit");
        } else if(cliente.getVersion() != existingCliente.getVersion() && "discard".equals(concurrencyControl)){
            populateForm(model);
            model.addAttribute("cliente", existingCliente);
            model.addAttribute("concurrency", false);
            return new ModelAndView("clientes/edit");
        } else if(cliente.getVersion() != existingCliente.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            cliente.setVersion(existingCliente.getVersion());
        }
        Cliente savedCliente = getClienteService().save(cliente);
        UriComponents showURI = getItemLink().to(ClientesItemThymeleafLinkFactory.SHOW).with("cliente", savedCliente.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param cliente
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> ClientesItemThymeleafController.delete(@ModelAttribute Cliente cliente) {
        getClienteService().delete(cliente);
        return ResponseEntity.ok().build();
    }
    
}