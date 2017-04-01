package sorcery.framework.bundles.builder;

import sorcery.core.Event;
import sorcery.core.abstracts.EventType;
import sorcery.core.interfaces.IEntity;
import sorcery.core.macros.interfaces.IInjectArguments;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
typedef BuilderEventPool = Array<BuilderEvent>;

//@:allow(sorcery.framework.bundles.entityBuilder.EntityBuilder)
class BuilderEvent extends Event implements IInjectArguments
{ 
	public static var BUILD = new EventType<BuilderEvent>("build");
	//static var CREATE_INT = new EventType
	/*
	we can create entity, give it a name and agendas and even add to it to parent and then pass it to builder
	*/
	
	public var entityType(default, null):String;
	public var entity:IEntity;
	public var params:Dynamic;
	var _poolArray:BuilderEventPool;
	
	@:injectArguments
	public function new(type:String, entityType:String, entity:IEntity, ?params:Dynamic) 
	{
		super(type);
	}
	
	override public function reset():Void 
	{
		super.reset();
		entity = null;
		params = null;
		_poolArray.push(this);
	}
	
	static var _buildPool:BuilderEventPool = [];
	public static function getBuildEvent(entityType:String, entity:IEntity, ?params:Dynamic):BuilderEvent
	{
		var e;
		if (_buildPool.length > 0)
		{
			e = _buildPool.pop();
			e.entityType = entityType;
			e.entity = entity;
			e.params = params;
		}
		else
		{
			e = new BuilderEvent(BUILD, entityType, entity, params);
			e._poolArray = _buildPool;
		}
		return e;
	}
}