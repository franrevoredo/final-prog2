package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Administrador;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = AdministradorsItemJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Administrador.class, type = ControllerType.ITEM)
@RooJSON
public class AdministradorsItemJsonController {
}
