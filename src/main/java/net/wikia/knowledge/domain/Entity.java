package net.wikia.knowledge.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "entity")
public class Entity {

    @NotNull
    private float relevance;

    @NotNull
    @Size(max = 25)
    private String type;

    @NotNull
    @Size(max = 256)
    private String name;
}
