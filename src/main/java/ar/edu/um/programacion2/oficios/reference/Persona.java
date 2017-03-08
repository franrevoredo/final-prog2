package ar.edu.um.programacion2.oficios.reference;
import org.springframework.roo.addon.javabean.annotations.RooEquals;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.persistence.Lob;
import org.springframework.roo.classpath.operations.jsr303.RooUploadedFile;

/**
 * = Persona
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals(isJpaEntity = true)
public class Persona {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Version
    private Integer version;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Column(unique = true)
    private String username;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @NotNull
    private String password;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Column(unique = true)
    private String email;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String telefono;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @RooUploadedFile(contentType = "image/png")
    @Lob
    private byte[] avatar;
    
    private int enabled = 1;
    
}
