package net.wikia.knowledge.repository;

import net.wikia.knowledge.domain.EntityCollection;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = EntityCollection.class)
public interface EntityCollectionRepository {
}
