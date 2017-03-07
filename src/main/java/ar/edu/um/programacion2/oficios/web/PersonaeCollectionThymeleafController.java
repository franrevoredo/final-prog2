package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.reference.Persona;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = PersonaeCollectionThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Persona.class, type = ControllerType.COLLECTION)
@RooThymeleaf
public class PersonaeCollectionThymeleafController {
}
