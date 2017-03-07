package ar.edu.um.programacion2.oficios.domain;
import ar.edu.um.programacion2.oficios.reference.Persona;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;
import javax.validation.constraints.NotNull;

/**
 * = Cliente
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
public class Cliente extends Persona {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @NotNull
    private String nombre;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @NotNull
    private String apellido;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String domicilio;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String domicilio2;
}
