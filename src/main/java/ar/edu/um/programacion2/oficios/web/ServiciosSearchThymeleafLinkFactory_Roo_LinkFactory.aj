// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.web.ServiciosSearchThymeleafController;
import ar.edu.um.programacion2.oficios.web.ServiciosSearchThymeleafLinkFactory;
import io.springlets.web.mvc.util.MethodLinkFactory;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponents;

privileged aspect ServiciosSearchThymeleafLinkFactory_Roo_LinkFactory {
    
    declare parents: ServiciosSearchThymeleafLinkFactory implements MethodLinkFactory<ServiciosSearchThymeleafController>;
    
    declare @type: ServiciosSearchThymeleafLinkFactory: @Component;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<ServiciosSearchThymeleafController> ServiciosSearchThymeleafLinkFactory.getControllerClass() {
        return ServiciosSearchThymeleafController.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param methodName
     * @param parameters
     * @param pathVariables
     * @return UriComponents
     */
    public UriComponents ServiciosSearchThymeleafLinkFactory.toUri(String methodName, Object[] parameters, Map<String, Object> pathVariables) {
        throw new IllegalArgumentException("Invalid method name: " + methodName);
    }
    
}