package sorcery.framework.bundles.blueprintBuilder;

import sorcery.core.Event;
import sorcery.core.abstracts.EventType;
import sorcery.core.interfaces.IEntity;
import sorcery.framework.bundles.builder.BuilderEvent;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BlueprintBuilderEvent extends Event
{
	public static var BUILD_FROM_BLUEPRINT = new EventType<BlueprintBuilderEvent>("buildFromBlueprint");
	
	public var blueprint(default, null):Dynamic;
	public var entity:IEntity;
	var _poolArray:Array<BlueprintBuilderEvent>;
	public function new(p_type:String, p_blueprint:Dynamic) 
	{
		super(p_type);
		blueprint = p_blueprint;
	}
	
	override public function reset():Void 
	{
		super.reset();
		if (_poolArray != null)
			_poolArray.push(this);
	}
	
	static var _pool:Array<BlueprintBuilderEvent> = [];
	public static function getBuildBlueprintEvent(blueprint:Dynamic):BlueprintBuilderEvent
	{
		var e;
		if (_pool.length > 0)
		{
			e = _pool.pop();
			e.blueprint = blueprint;
		}
		else
		{
			e = new BlueprintBuilderEvent(BUILD_FROM_BLUEPRINT, blueprint);
			e._poolArray = _pool;
		}
		return e;
	}
}