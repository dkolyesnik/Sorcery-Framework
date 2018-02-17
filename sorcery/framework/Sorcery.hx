package sorcery.framework;
import sorcery.core.Behavior;
import sorcery.core.HandlerData;
import sorcery.core.TypedHandlerData;
import sorcery.core.abstracts.EventType;
import sorcery.core.abstracts.FullName;
import sorcery.core.abstracts.Path;
import sorcery.core.interfaces.IBehavior;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntity;
import sorcery.core.interfaces.IEntityChildLink;
import sorcery.core.interfaces.IEvent;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class Sorcery
{
	static public var core:ICore;
	
	static var _behavior:BehaviorWithOpenedLinks;
	static public function init(p_core:ICore)
	{
		core = p_core;
		
		_behavior = new BehaviorWithOpenedLinks(core);
		core.root.addChild(_behavior);
	}
	
	static public function update()
	{
		core.time.update();
	}
	
	static function addHandler(handler:HandlerData):HandlerData
	{
		return _behavior.addHandler(handler);
	}
	
	static function sendEvent(event:IEvent):Void
	{
		core.root.sendEvent(event);
	}
	
	static function sendEventTo(targetName:FullName, event:IEvent):Bool
	{
		var targetEntity = core.root.findEntity(targetName);
		if (targetEntity != null)
		{
			targetEntity.sendEvent(event);
			return true;
		}
		else
		{
			return false;
		}
	}
	
	static function createLink(path:Path, parent:IEntity):IEntityChildLink
	{
		if (parent != null)
			_behavior.createLink2(path);
			
		return _behavior.createLink2(path);
	}
	
	static function destroyLink(link:IEntityChildLink):Void
	{
		_behavior.destroyLink2(link);
	}
}

//Hack to have handler access to links and handler generated for IEvent type
private class BehaviorWithOpenedLinks extends Behavior
{

	var _handler:TypedHandlerData<IEvent>;
	public function createLink2(path:Path):IEntityChildLink
	{
		return createLink(path);
	}
	
	public function destroyLink2(link:IEntityChildLink):Void
	{
		destroyLink(link);
	}
}