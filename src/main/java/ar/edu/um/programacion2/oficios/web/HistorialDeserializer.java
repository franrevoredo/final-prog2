package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.reference.Historial;
import ar.edu.um.programacion2.oficios.service.api.HistorialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = HistorialDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Historial.class)
public class HistorialDeserializer extends JsonObjectDeserializer<Historial> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private HistorialService historialService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param historialService
     * @param conversionService
     */
    @Autowired
    public HistorialDeserializer(@Lazy HistorialService historialService, ConversionService conversionService) {
        this.historialService = historialService;
        this.conversionService = conversionService;
    }
}
