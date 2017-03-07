package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.reference.Disponibilidad;
import ar.edu.um.programacion2.oficios.service.api.DisponibilidadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = DisponibilidadDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Disponibilidad.class)
public class DisponibilidadDeserializer extends JsonObjectDeserializer<Disponibilidad> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private DisponibilidadService disponibilidadService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param disponibilidadService
     * @param conversionService
     */
    @Autowired
    public DisponibilidadDeserializer(@Lazy DisponibilidadService disponibilidadService, ConversionService conversionService) {
        this.disponibilidadService = disponibilidadService;
        this.conversionService = conversionService;
    }
}
