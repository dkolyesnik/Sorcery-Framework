package sorcery.framework.bundles.builder;

import sorcery.core.Entity;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntity;
import sorcery.framework.bundles.builder.interfaces.IBuilder;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
@:keep
class Builder extends Entity implements IBuilder
{
	public static var NAME = new FrameworkObjName<IBuilder>("builder");
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		setName(NAME);
	}
	
	/* INTERFACE sorcery.framework.bundles.entityBuilder.interfaces.IEntityBuilder */
	
	public function build(entityType:String, ?name:String, ?entity:IEntity, ?param:Dynamic, isGroup:Bool = false):IEntity
	{
		if (entity == null)
			entity = core.allocateEntity(name);
		else if(name != null)
			entity.setName(name);
		if (isGroup)
			core.wrapInGroup(entity);
		
		var e = BuilderEvent.getBuildEvent(entityType, entity, param);
		sendEvent(e);
		var entity = e.entity;
		e.reset();
		return entity;
	}
	
}