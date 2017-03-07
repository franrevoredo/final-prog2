package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.CalificacionCliente;
import ar.edu.um.programacion2.oficios.service.api.CalificacionClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = CalificacionClienteDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = CalificacionCliente.class)
public class CalificacionClienteDeserializer extends JsonObjectDeserializer<CalificacionCliente> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private CalificacionClienteService calificacionClienteService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param calificacionClienteService
     * @param conversionService
     */
    @Autowired
    public CalificacionClienteDeserializer(@Lazy CalificacionClienteService calificacionClienteService, ConversionService conversionService) {
        this.calificacionClienteService = calificacionClienteService;
        this.conversionService = conversionService;
    }
}
