package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.reference.Persona;
import ar.edu.um.programacion2.oficios.service.api.PersonaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = PersonaDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Persona.class)
public class PersonaDeserializer extends JsonObjectDeserializer<Persona> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private PersonaService personaService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param personaService
     * @param conversionService
     */
    @Autowired
    public PersonaDeserializer(@Lazy PersonaService personaService, ConversionService conversionService) {
        this.personaService = personaService;
        this.conversionService = conversionService;
    }
}
