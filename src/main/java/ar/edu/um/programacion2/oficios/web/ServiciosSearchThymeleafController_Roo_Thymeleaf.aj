// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.service.api.ServicioService;
import ar.edu.um.programacion2.oficios.web.ServiciosSearchThymeleafController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

privileged aspect ServiciosSearchThymeleafController_Roo_Thymeleaf {
    
    declare @type: ServiciosSearchThymeleafController: @Controller;
    
    declare @type: ServiciosSearchThymeleafController: @RequestMapping(value = "/servicios/search", name = "ServiciosSearchThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource ServiciosSearchThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param servicioService
     * @param messageSource
     */
    @Autowired
    public ServiciosSearchThymeleafController.new(ServicioService servicioService, MessageSource messageSource) {
        setServicioService(servicioService);
        setMessageSource(messageSource);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource ServiciosSearchThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void ServiciosSearchThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
}