// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.wikia.knowledge.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.wikia.knowledge.domain.EntityCollection;

privileged aspect EntityCollection_Roo_Json {
    
    public String EntityCollection.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public static EntityCollection EntityCollection.fromJsonToEntityCollection(String json) {
        return new JSONDeserializer<EntityCollection>().use(null, EntityCollection.class).deserialize(json);
    }
    
    public static String EntityCollection.toJsonArray(Collection<EntityCollection> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<EntityCollection> EntityCollection.fromJsonArrayToEntityCollections(String json) {
        return new JSONDeserializer<List<EntityCollection>>().use(null, ArrayList.class).use("values", EntityCollection.class).deserialize(json);
    }
    
}
