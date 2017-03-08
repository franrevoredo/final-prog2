package ar.edu.um.programacion2.oficios.domain;
import ar.edu.um.programacion2.oficios.reference.Persona;

import javax.persistence.DiscriminatorValue;

import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;

/**
 * = Administrador
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
@DiscriminatorValue("ROLE_ADMINISTRADOR")
public class Administrador extends Persona {
}
