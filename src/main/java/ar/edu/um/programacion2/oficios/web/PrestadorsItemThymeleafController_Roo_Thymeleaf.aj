// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.domain.Prestador;
import ar.edu.um.programacion2.oficios.service.api.PrestadorService;
import ar.edu.um.programacion2.oficios.web.PrestadorsItemThymeleafController;
import ar.edu.um.programacion2.oficios.web.PrestadorsItemThymeleafLinkFactory;
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

privileged aspect PrestadorsItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: PrestadorsItemThymeleafController: @Controller;
    
    declare @type: PrestadorsItemThymeleafController: @RequestMapping(value = "/prestadors/{prestador}", name = "PrestadorsItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource PrestadorsItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<PrestadorsItemThymeleafController> PrestadorsItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param prestadorService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public PrestadorsItemThymeleafController.new(PrestadorService prestadorService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setPrestadorService(prestadorService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(PrestadorsItemThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource PrestadorsItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void PrestadorsItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<PrestadorsItemThymeleafController> PrestadorsItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void PrestadorsItemThymeleafController.setItemLink(MethodLinkBuilderFactory<PrestadorsItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Prestador
     */
    @ModelAttribute
    public Prestador PrestadorsItemThymeleafController.getPrestador(@PathVariable("prestador") Long id, Locale locale, HttpMethod method) {
        Prestador prestador = null;
        if (HttpMethod.PUT.equals(method)) {
            prestador = prestadorService.findOneForUpdate(id);
        } else {
            prestador = prestadorService.findOne(id);
        }
        
        if (prestador == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Prestador", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return prestador;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestador
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView PrestadorsItemThymeleafController.show(@ModelAttribute Prestador prestador, Model model) {
        model.addAttribute("prestador", prestador);
        return new ModelAndView("prestadors/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestador
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView PrestadorsItemThymeleafController.showInline(@ModelAttribute Prestador prestador, Model model) {
        model.addAttribute("prestador", prestador);
        return new ModelAndView("prestadors/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("prestador")
    public void PrestadorsItemThymeleafController.initPrestadorBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void PrestadorsItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void PrestadorsItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestador
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView PrestadorsItemThymeleafController.editForm(@ModelAttribute Prestador prestador, Model model) {
        populateForm(model);
        
        model.addAttribute("prestador", prestador);
        return new ModelAndView("prestadors/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestador
     * @param version
     * @param concurrencyControl
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView PrestadorsItemThymeleafController.update(@Valid @ModelAttribute Prestador prestador, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("prestadors/edit");
        }
        // Concurrency control
        Prestador existingPrestador = getPrestadorService().findOne(prestador.getId());
        if(prestador.getVersion() != existingPrestador.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            populateForm(model);
            model.addAttribute("prestador", prestador);
            model.addAttribute("concurrency", true);
            return new ModelAndView("prestadors/edit");
        } else if(prestador.getVersion() != existingPrestador.getVersion() && "discard".equals(concurrencyControl)){
            populateForm(model);
            model.addAttribute("prestador", existingPrestador);
            model.addAttribute("concurrency", false);
            return new ModelAndView("prestadors/edit");
        } else if(prestador.getVersion() != existingPrestador.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            prestador.setVersion(existingPrestador.getVersion());
        }
        Prestador savedPrestador = getPrestadorService().save(prestador);
        UriComponents showURI = getItemLink().to(PrestadorsItemThymeleafLinkFactory.SHOW).with("prestador", savedPrestador.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param prestador
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> PrestadorsItemThymeleafController.delete(@ModelAttribute Prestador prestador) {
        getPrestadorService().delete(prestador);
        return ResponseEntity.ok().build();
    }
    
}
