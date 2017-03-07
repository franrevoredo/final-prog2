package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = ClientesCollectionThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Cliente.class, type = ControllerType.COLLECTION)
@RooThymeleaf
public class ClientesCollectionThymeleafController {
}
