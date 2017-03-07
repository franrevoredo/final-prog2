package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Servicio;
import ar.edu.um.programacion2.oficios.service.api.ServicioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = ServicioDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Servicio.class)
public class ServicioDeserializer extends JsonObjectDeserializer<Servicio> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ServicioService servicioService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param servicioService
     * @param conversionService
     */
    @Autowired
    public ServicioDeserializer(@Lazy ServicioService servicioService, ConversionService conversionService) {
        this.servicioService = servicioService;
        this.conversionService = conversionService;
    }
}
