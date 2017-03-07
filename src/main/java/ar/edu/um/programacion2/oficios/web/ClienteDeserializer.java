package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.domain.Cliente;
import ar.edu.um.programacion2.oficios.service.api.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = ClienteDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Cliente.class)
public class ClienteDeserializer extends JsonObjectDeserializer<Cliente> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ClienteService clienteService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param clienteService
     * @param conversionService
     */
    @Autowired
    public ClienteDeserializer(@Lazy ClienteService clienteService, ConversionService conversionService) {
        this.clienteService = clienteService;
        this.conversionService = conversionService;
    }
}
