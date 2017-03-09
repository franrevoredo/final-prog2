package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.reference.Localidad;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

/**
 * = LocalidadsItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Localidad.class, type = ControllerType.ITEM)
@RooThymeleaf
public class LocalidadsItemThymeleafController {
	
    /**
     * TODO Auto-generated method documentation
     * 
     * @param localidad
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView show(@ModelAttribute Localidad localidad, Model model) {
        model.addAttribute("localidad", localidad);
        model.addAttribute("mapstring", localidad.getMapString());
        return new ModelAndView("localidads/show");
    }
	
}
