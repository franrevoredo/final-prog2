// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.service.api.ServicioService;
import ar.edu.um.programacion2.oficios.web.ServiciosItemThymeleafController;
import ar.edu.um.programacion2.oficios.web.ServiciosItemThymeleafLinkFactory;
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

privileged aspect ServiciosItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: ServiciosItemThymeleafController: @Controller;
    
    declare @type: ServiciosItemThymeleafController: @RequestMapping(value = "/servicios/{servicio}", name = "ServiciosItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource ServiciosItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<ServiciosItemThymeleafController> ServiciosItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param servicioService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public ServiciosItemThymeleafController.new(ServicioService servicioService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setServicioService(servicioService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(ServiciosItemThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource ServiciosItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void ServiciosItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<ServiciosItemThymeleafController> ServiciosItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void ServiciosItemThymeleafController.setItemLink(MethodLinkBuilderFactory<ServiciosItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Servicio
     */
    @ModelAttribute
    public Servicio ServiciosItemThymeleafController.getServicio(@PathVariable("servicio") Long id, Locale locale, HttpMethod method) {
        Servicio servicio = null;
        if (HttpMethod.PUT.equals(method)) {
            servicio = servicioService.findOneForUpdate(id);
        } else {
            servicio = servicioService.findOne(id);
        }
        
        if (servicio == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Servicio", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return servicio;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView ServiciosItemThymeleafController.show(@ModelAttribute Servicio servicio, Model model) {
        model.addAttribute("servicio", servicio);
        return new ModelAndView("servicios/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView ServiciosItemThymeleafController.showInline(@ModelAttribute Servicio servicio, Model model) {
        model.addAttribute("servicio", servicio);
        return new ModelAndView("servicios/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("servicio")
    public void ServiciosItemThymeleafController.initServicioBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void ServiciosItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void ServiciosItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView ServiciosItemThymeleafController.editForm(@ModelAttribute Servicio servicio, Model model) {
        populateForm(model);
        
        model.addAttribute("servicio", servicio);
        return new ModelAndView("servicios/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     * @param version
     * @param concurrencyControl
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView ServiciosItemThymeleafController.update(@Valid @ModelAttribute Servicio servicio, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("servicios/edit");
        }
        // Concurrency control
        Servicio existingServicio = getServicioService().findOne(servicio.getId());
        if(servicio.getVersion() != existingServicio.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            populateForm(model);
            model.addAttribute("servicio", servicio);
            model.addAttribute("concurrency", true);
            return new ModelAndView("servicios/edit");
        } else if(servicio.getVersion() != existingServicio.getVersion() && "discard".equals(concurrencyControl)){
            populateForm(model);
            model.addAttribute("servicio", existingServicio);
            model.addAttribute("concurrency", false);
            return new ModelAndView("servicios/edit");
        } else if(servicio.getVersion() != existingServicio.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            servicio.setVersion(existingServicio.getVersion());
        }
        Servicio savedServicio = getServicioService().save(servicio);
        UriComponents showURI = getItemLink().to(ServiciosItemThymeleafLinkFactory.SHOW).with("servicio", savedServicio.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> ServiciosItemThymeleafController.delete(@ModelAttribute Servicio servicio) {
        getServicioService().delete(servicio);
        return ResponseEntity.ok().build();
    }
    
}