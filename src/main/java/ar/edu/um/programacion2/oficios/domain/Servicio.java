package ar.edu.um.programacion2.oficios.domain;
import org.springframework.roo.addon.javabean.annotations.RooEquals;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;

import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

import org.springframework.roo.classpath.operations.jsr303.RooUploadedFile;

import ar.edu.um.programacion2.oficios.reference.Categoria;
import ar.edu.um.programacion2.oficios.reference.Disponibilidad;
import ar.edu.um.programacion2.oficios.reference.Localidad;

import org.springframework.format.annotation.NumberFormat;

/**
 * = Servicio
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals(isJpaEntity = true)
public class Servicio {

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
    @NotNull
    private String nombre;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String descripcion;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @RooUploadedFile(contentType = "image/png")
    @Lob
    private byte[] logo;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @NotNull
    private String telefono;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @NumberFormat
    private float puntaje;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="localidad_id")
    private Localidad localidad;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="disponibilidad_id")
    private Disponibilidad disponibilidad;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="categoria_id")
    private Categoria categoria;
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="prestador_id")
    private Prestador prestador;
    

	/**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String toString() {
        return getNombre() + " (" + getPrestador() + ")";
    }
}
