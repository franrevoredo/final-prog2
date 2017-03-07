package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.CalificacionPrestador;
import ar.edu.um.programacion2.oficios.service.api.CalificacionPrestadorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = CalificacionPrestadorDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = CalificacionPrestador.class)
public class CalificacionPrestadorDeserializer extends JsonObjectDeserializer<CalificacionPrestador> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private CalificacionPrestadorService calificacionPrestadorService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param calificacionPrestadorService
     * @param conversionService
     */
    @Autowired
    public CalificacionPrestadorDeserializer(@Lazy CalificacionPrestadorService calificacionPrestadorService, ConversionService conversionService) {
        this.calificacionPrestadorService = calificacionPrestadorService;
        this.conversionService = conversionService;
    }
}
