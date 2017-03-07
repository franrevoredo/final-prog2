// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.reference.Disponibilidad;
import ar.edu.um.programacion2.oficios.service.api.DisponibilidadService;
import ar.edu.um.programacion2.oficios.web.DisponibilidadsItemThymeleafController;
import ar.edu.um.programacion2.oficios.web.DisponibilidadsItemThymeleafLinkFactory;
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

privileged aspect DisponibilidadsItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: DisponibilidadsItemThymeleafController: @Controller;
    
    declare @type: DisponibilidadsItemThymeleafController: @RequestMapping(value = "/disponibilidads/{disponibilidad}", name = "DisponibilidadsItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource DisponibilidadsItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<DisponibilidadsItemThymeleafController> DisponibilidadsItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param disponibilidadService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public DisponibilidadsItemThymeleafController.new(DisponibilidadService disponibilidadService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setDisponibilidadService(disponibilidadService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(DisponibilidadsItemThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource DisponibilidadsItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void DisponibilidadsItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<DisponibilidadsItemThymeleafController> DisponibilidadsItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void DisponibilidadsItemThymeleafController.setItemLink(MethodLinkBuilderFactory<DisponibilidadsItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Disponibilidad
     */
    @ModelAttribute
    public Disponibilidad DisponibilidadsItemThymeleafController.getDisponibilidad(@PathVariable("disponibilidad") Long id, Locale locale, HttpMethod method) {
        Disponibilidad disponibilidad = null;
        if (HttpMethod.PUT.equals(method)) {
            disponibilidad = disponibilidadService.findOneForUpdate(id);
        } else {
            disponibilidad = disponibilidadService.findOne(id);
        }
        
        if (disponibilidad == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Disponibilidad", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return disponibilidad;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param disponibilidad
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView DisponibilidadsItemThymeleafController.show(@ModelAttribute Disponibilidad disponibilidad, Model model) {
        model.addAttribute("disponibilidad", disponibilidad);
        return new ModelAndView("disponibilidads/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param disponibilidad
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView DisponibilidadsItemThymeleafController.showInline(@ModelAttribute Disponibilidad disponibilidad, Model model) {
        model.addAttribute("disponibilidad", disponibilidad);
        return new ModelAndView("disponibilidads/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("disponibilidad")
    public void DisponibilidadsItemThymeleafController.initDisponibilidadBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void DisponibilidadsItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void DisponibilidadsItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param disponibilidad
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView DisponibilidadsItemThymeleafController.editForm(@ModelAttribute Disponibilidad disponibilidad, Model model) {
        populateForm(model);
        
        model.addAttribute("disponibilidad", disponibilidad);
        return new ModelAndView("disponibilidads/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param disponibilidad
     * @param version
     * @param concurrencyControl
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView DisponibilidadsItemThymeleafController.update(@Valid @ModelAttribute Disponibilidad disponibilidad, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("disponibilidads/edit");
        }
        // Concurrency control
        Disponibilidad existingDisponibilidad = getDisponibilidadService().findOne(disponibilidad.getId());
        if(disponibilidad.getVersion() != existingDisponibilidad.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            populateForm(model);
            model.addAttribute("disponibilidad", disponibilidad);
            model.addAttribute("concurrency", true);
            return new ModelAndView("disponibilidads/edit");
        } else if(disponibilidad.getVersion() != existingDisponibilidad.getVersion() && "discard".equals(concurrencyControl)){
            populateForm(model);
            model.addAttribute("disponibilidad", existingDisponibilidad);
            model.addAttribute("concurrency", false);
            return new ModelAndView("disponibilidads/edit");
        } else if(disponibilidad.getVersion() != existingDisponibilidad.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            disponibilidad.setVersion(existingDisponibilidad.getVersion());
        }
        Disponibilidad savedDisponibilidad = getDisponibilidadService().save(disponibilidad);
        UriComponents showURI = getItemLink().to(DisponibilidadsItemThymeleafLinkFactory.SHOW).with("disponibilidad", savedDisponibilidad.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param disponibilidad
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> DisponibilidadsItemThymeleafController.delete(@ModelAttribute Disponibilidad disponibilidad) {
        getDisponibilidadService().delete(disponibilidad);
        return ResponseEntity.ok().build();
    }
    
}
