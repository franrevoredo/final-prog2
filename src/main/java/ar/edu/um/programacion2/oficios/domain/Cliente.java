package ar.edu.um.programacion2.oficios.domain;
import ar.edu.um.programacion2.oficios.reference.Localidad;
import ar.edu.um.programacion2.oficios.reference.Persona;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;

import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
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
@DiscriminatorValue("ROLE_CLIENTE")
public class Cliente extends Persona {

    public Cliente(String nombre, String apellido, String domicilio, Localidad localidad) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.domicilio = domicilio;
		this.localidad = localidad;
	}

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
    
    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="localidad_id")
    private Localidad localidad;
    
    @ManyToMany
    @JoinTable(name = "cliente_servicio", joinColumns = @JoinColumn(name = "cliente_id"), inverseJoinColumns = @JoinColumn(name = "servicio_id"))
    private Set<Servicio> favoritos;

	/**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String toString() {
        return getNombre() + " - " + getUsername() + " - " + getFavoritos();
    }
}
