package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Calificacion;
import ar.edu.um.programacion2.oficios.service.api.CalificacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = CalificacionDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Calificacion.class)
public class CalificacionDeserializer extends JsonObjectDeserializer<Calificacion> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private CalificacionService calificacionService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param calificacionService
     * @param conversionService
     */
    @Autowired
    public CalificacionDeserializer(@Lazy CalificacionService calificacionService, ConversionService conversionService) {
        this.calificacionService = calificacionService;
        this.conversionService = conversionService;
    }
}
