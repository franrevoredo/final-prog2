// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.repository;

import ar.edu.um.programacion2.oficios.domain.Administrador;
import ar.edu.um.programacion2.oficios.repository.AdministradorRepository;
import ar.edu.um.programacion2.oficios.repository.AdministradorRepositoryCustom;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AdministradorRepository_Roo_Jpa_Repository {
    
    declare parents: AdministradorRepository extends DetachableJpaRepository<Administrador, Long>;
    
    declare parents: AdministradorRepository extends AdministradorRepositoryCustom;
    
    declare @type: AdministradorRepository: @Transactional(readOnly = true);
    
}
