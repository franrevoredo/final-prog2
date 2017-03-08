package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Administrador;
import ar.edu.um.programacion2.oficios.service.api.AdministradorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = AdministradorDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Administrador.class)
public class AdministradorDeserializer extends JsonObjectDeserializer<Administrador> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private AdministradorService administradorService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param administradorService
     * @param conversionService
     */
    @Autowired
    public AdministradorDeserializer(@Lazy AdministradorService administradorService, ConversionService conversionService) {
        this.administradorService = administradorService;
        this.conversionService = conversionService;
    }
}
