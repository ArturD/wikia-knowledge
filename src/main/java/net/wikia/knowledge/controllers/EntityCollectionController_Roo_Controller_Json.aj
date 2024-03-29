// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.wikia.knowledge.controllers;

import java.util.List;
import net.wikia.knowledge.controllers.EntityCollectionController;
import net.wikia.knowledge.domain.EntityCollection;
import net.wikia.knowledge.repository.EntityCollectionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect EntityCollectionController_Roo_Controller_Json {
    
    @Autowired
    EntityCollectionRepository EntityCollectionController.entityCollectionRepository;
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> EntityCollectionController.showJson(@PathVariable("id") Long id) {
        EntityCollection entityCollection = entityCollectionRepository.findOne(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (entityCollection == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(entityCollection.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> EntityCollectionController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<EntityCollection> result = entityCollectionRepository.findAll();
        return new ResponseEntity<String>(EntityCollection.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EntityCollectionController.createFromJson(@RequestBody String json) {
        EntityCollection entityCollection = EntityCollection.fromJsonToEntityCollection(json);
        entityCollectionRepository.save(entityCollection);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EntityCollectionController.createFromJsonArray(@RequestBody String json) {
        for (EntityCollection entityCollection: EntityCollection.fromJsonArrayToEntityCollections(json)) {
            entityCollectionRepository.save(entityCollection);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> EntityCollectionController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        EntityCollection entityCollection = EntityCollection.fromJsonToEntityCollection(json);
        if (entityCollectionRepository.save(entityCollection) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> EntityCollectionController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (EntityCollection entityCollection: EntityCollection.fromJsonArrayToEntityCollections(json)) {
            if (entityCollectionRepository.save(entityCollection) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> EntityCollectionController.deleteFromJson(@PathVariable("id") Long id) {
        EntityCollection entityCollection = entityCollectionRepository.findOne(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (entityCollection == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        entityCollectionRepository.delete(entityCollection);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
