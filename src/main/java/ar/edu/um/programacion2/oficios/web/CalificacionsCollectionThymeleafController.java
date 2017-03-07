package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Calificacion;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = CalificacionsCollectionThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Calificacion.class, type = ControllerType.COLLECTION)
@RooThymeleaf
public class CalificacionsCollectionThymeleafController {
}
