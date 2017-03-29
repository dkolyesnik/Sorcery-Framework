package sorcery.framework.bundles.builder;

import sorcery.core.Event;
import sorcery.core.abstracts.EventType;
import sorcery.core.interfaces.IEntity;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
typedef BuilderEventPool = Array<BuilderEvent>;

//@:allow(sorcery.framework.bundles.entityBuilder.EntityBuilder)
class BuilderEvent extends Event
{
	public static var BUILD = new EventType<BuilderEvent>("build");
	//static var CREATE_INT = new EventType
	/*
	we can create entity, give it a name and agendas and even add to it to parent and then pass it to builder
	*/
	
	public var entityId(default, null):String;
	public var entity:IEntity;
	public var params:Dynamic;
	var _poolArray:BuilderEventPool;
	public function new(p_type:String, p_entityId:String, p_entity:IEntity, ?p_params:Dynamic) 
	{
		super(p_type);
		entityId = p_entityId;
		entity = p_entity;
		params = p_params;
	}
	
	override public function reset():Void 
	{
		super.reset();
		entity = null;
		params = null;
		_poolArray.push(this);
	}
	
	static var _buildPool:BuilderEventPool = [];
	public static function getBuildEvent(p_entityId:String, p_entity:IEntity, ?p_params:Dynamic):BuilderEvent
	{
		var e;
		if (_buildPool.length > 0)
		{
			e = _buildPool.pop();
			e.entityId = p_entityId;
			e.entity = p_entity;
			e.params = p_params;
		}
		else
		{
			e = new BuilderEvent(BUILD, p_entityId, p_entity, p_params);
			e._poolArray = _buildPool;
		}
		return e;
	}
}