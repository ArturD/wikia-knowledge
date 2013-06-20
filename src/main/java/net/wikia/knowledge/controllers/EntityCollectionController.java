package net.wikia.knowledge.controllers;

import net.wikia.knowledge.domain.EntityCollection;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = EntityCollection.class)
@Controller
@RequestMapping("/entitycollections")
public class EntityCollectionController {
}
