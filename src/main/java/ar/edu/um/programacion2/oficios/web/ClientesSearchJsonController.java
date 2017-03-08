package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.finder.RooSearch;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = ClientesSearchJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Cliente.class, type = ControllerType.SEARCH)
@RooSearch(finders = {  })
@RooJSON
public class ClientesSearchJsonController {
}
