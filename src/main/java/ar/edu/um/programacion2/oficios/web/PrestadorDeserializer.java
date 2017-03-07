package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Prestador;
import ar.edu.um.programacion2.oficios.service.api.PrestadorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = PrestadorDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Prestador.class)
public class PrestadorDeserializer extends JsonObjectDeserializer<Prestador> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private PrestadorService prestadorService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param prestadorService
     * @param conversionService
     */
    @Autowired
    public PrestadorDeserializer(@Lazy PrestadorService prestadorService, ConversionService conversionService) {
        this.prestadorService = prestadorService;
        this.conversionService = conversionService;
    }
}
