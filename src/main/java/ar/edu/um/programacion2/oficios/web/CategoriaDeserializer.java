package ar.edu.um.programacion2.oficios.web;
import ar.edu.um.programacion2.oficios.reference.Categoria;
import ar.edu.um.programacion2.oficios.service.api.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = CategoriaDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Categoria.class)
public class CategoriaDeserializer extends JsonObjectDeserializer<Categoria> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private CategoriaService categoriaService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param categoriaService
     * @param conversionService
     */
    @Autowired
    public CategoriaDeserializer(@Lazy CategoriaService categoriaService, ConversionService conversionService) {
        this.categoriaService = categoriaService;
        this.conversionService = conversionService;
    }
}
