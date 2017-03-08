// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.oficios.web;

import ar.edu.um.programacion2.oficios.domain.Administrador;
import ar.edu.um.programacion2.oficios.service.api.AdministradorService;
import ar.edu.um.programacion2.oficios.web.AdministradorsCollectionJsonController;
import ar.edu.um.programacion2.oficios.web.AdministradorsItemJsonController;
import io.springlets.data.domain.GlobalSearch;
import java.util.Collection;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

privileged aspect AdministradorsCollectionJsonController_Roo_JSON {
    
    declare @type: AdministradorsCollectionJsonController: @RestController;
    
    declare @type: AdministradorsCollectionJsonController: @RequestMapping(value = "/administradors", name = "AdministradorsCollectionJsonController", produces = MediaType.APPLICATION_JSON_VALUE);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param administradorService
     */
    @Autowired
    public AdministradorsCollectionJsonController.new(AdministradorService administradorService) {
        this.administradorService = administradorService;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return ResponseEntity
     */
    @GetMapping(name = "list")
    public ResponseEntity<Page<Administrador>> AdministradorsCollectionJsonController.list(GlobalSearch globalSearch, Pageable pageable) {
        
        Page<Administrador> administradors = getAdministradorService().findAll(globalSearch, pageable);
        return ResponseEntity.ok(administradors);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return UriComponents
     */
    public static UriComponents AdministradorsCollectionJsonController.listURI() {
        return MvcUriComponentsBuilder
            .fromMethodCall(
                MvcUriComponentsBuilder.on(AdministradorsCollectionJsonController.class).list(null, null))
            .build().encode();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param administrador
     * @param result
     * @return ResponseEntity
     */
    @PostMapping(name = "create")
    public ResponseEntity<?> AdministradorsCollectionJsonController.create(@Valid @RequestBody Administrador administrador, BindingResult result) {
        
        if (administrador.getId() != null || administrador.getVersion() != null) {        
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        Administrador newAdministrador = getAdministradorService().save(administrador);
        UriComponents showURI = AdministradorsItemJsonController.showURI(newAdministrador);
        
        return ResponseEntity.created(showURI.toUri()).build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param administradors
     * @param result
     * @return ResponseEntity
     */
    @PostMapping(value = "/batch", name = "createBatch")
    public ResponseEntity<?> AdministradorsCollectionJsonController.createBatch(@Valid @RequestBody Collection<Administrador> administradors, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        getAdministradorService().save(administradors);
        
        return ResponseEntity.created(listURI().toUri()).build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param administradors
     * @param result
     * @return ResponseEntity
     */
    @PutMapping(value = "/batch", name = "updateBatch")
    public ResponseEntity<?> AdministradorsCollectionJsonController.updateBatch(@Valid @RequestBody Collection<Administrador> administradors, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        getAdministradorService().save(administradors);
        
        return ResponseEntity.ok().build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return ResponseEntity
     */
    @DeleteMapping(value = "/batch/{ids}", name = "deleteBatch")
    public ResponseEntity<?> AdministradorsCollectionJsonController.deleteBatch(@PathVariable("ids") Collection<Long> ids) {
        
        getAdministradorService().delete(ids);
        
        return ResponseEntity.ok().build();
    }
    
}
