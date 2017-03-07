package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.reference.Localidad;
import ar.edu.um.programacion2.oficios.service.api.LocalidadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = LocalidadDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Localidad.class)
public class LocalidadDeserializer extends JsonObjectDeserializer<Localidad> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private LocalidadService localidadService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param localidadService
     * @param conversionService
     */
    @Autowired
    public LocalidadDeserializer(@Lazy LocalidadService localidadService, ConversionService conversionService) {
        this.localidadService = localidadService;
        this.conversionService = conversionService;
    }
}
