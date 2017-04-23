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
	public static var NAME = new FrameworkObjName<Builder>("builder");
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		setName(NAME);
	}
	
	/* INTERFACE sorcery.framework.bundles.entityBuilder.interfaces.IEntityBuilder */
	
	public function build(entityType:String, entity:IEntity, ?param:Map<String, Any>):IEntity
	{
		var e = BuilderEvent.getBuildEvent(entityType, entity, param);
		sendEvent(e);
		var entity = e.entity;
		e.reset();
		return entity;
	}
	
	public function allocateEntity(?p_name:String):BuildedEntity
	{
		var ent = new BuildedEntity(core);
		ent.setName(p_name);
		return ent;
	}
}