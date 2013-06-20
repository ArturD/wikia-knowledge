package net.wikia.knowledge.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "entity_set")
@RooJson(deepSerialize = true)
public class EntityCollection {

    @NotNull
    @Column(name = "wiki_id")
    @Min(0L)
    @Digits(integer = 10, fraction = 0)
    private int wikiId;

    @NotNull
    @Column(name = "page_id")
    @Min(0L)
    @Digits(integer = 10, fraction = 0)
    private int pageId;

    @Column(name = "editor_id")
    @Min(0L)
    @Digits(integer = 10, fraction = 0)
    private Integer editorId;

    @NotNull
    @Column(name = "page_title")
    @Size(max = 255)
    private String pageTitle;

    @NotNull
    @Column(name = "classifier_name")
    @Size(max = 60)
    private String classifierName;

    @Column(name = "date_created")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dateCreated;

    private float quality;

    @NotNull
    @Column(name = "human_verified")
    private boolean humanVerified;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Entity> entities = new HashSet<Entity>();
}
