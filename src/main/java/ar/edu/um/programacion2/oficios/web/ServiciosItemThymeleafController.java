package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

/**
 * = ServiciosItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Servicio.class, type = ControllerType.ITEM)
@RooThymeleaf
public class ServiciosItemThymeleafController {
    /**
     * TODO Auto-generated method documentation
     * 
     * @param servicio
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView show(@ModelAttribute Servicio servicio, Model model) {
        model.addAttribute("servicio", servicio);
        model.addAttribute("mapstring", servicio.getLocalidad().getMapString());
        return new ModelAndView("servicios/show");
    }
}
