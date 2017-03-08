package ar.edu.um.programacion2.oficios.domain;
import ar.edu.um.programacion2.oficios.reference.Persona;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;
import javax.validation.constraints.NotNull;

/**
 * = Prestador
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
public class Prestador extends Persona {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @NotNull
    private String razonsocial;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @NotNull
    private String oficio;

	/**∫
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String toString() {
        return getUsername() + " - " + getRazonsocial();
    }
}
