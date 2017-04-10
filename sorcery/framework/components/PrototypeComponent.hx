package;

import sorcery.core.Component;
import sorcery.core.interfaces.IComponent;
import sorcery.core.interfaces.ICore;
import sorcery.macros.Nullsafety.*;
using Lambda;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class PrototypeComponent extends Component
{
	public var _onActivate:IComponent->Void;
	public var _onDeactivate:IComponent->Void;
	public var _onAddedToRoot:IComponent->Void;
	public var _onRemovedFromRoot:IComponent->Void;
	public var _onFocus:IComponent->Void;
	public var _onLostFocus:IComponent->Void;
	override function onAddedToRoot():Void 
	{
		safeCall((_onAddedToRoot)(this));
	}
	
	override function onRemovedFromRoot():Void 
	{
		safeCall((_onRemovedFromRoot)(this));
	}
	
	override function onActivate():Void 
	{
		safeCall((_onActivate)(this));
	}
	
	override function onDeactivate():Void 
	{
		safeCall((_onDeactivate)(this));
	}
	
	override function onFocus():Void 
	{
		safeCall((_onFocus)(this));
	}
	
	override function onLostFocus():Void 
	{
		safeCall((_onLostFocus)(this));
	}
	
	public function clone():PrototypeComponent
	{
		var newPrototype = new PrototypeComponent(core);
		newPrototype._onActivate = _onActivate;
		newPrototype._onDeactivate = _onDeactivate;
		newPrototype._onAddedToRoot = _onAddedToRoot;
		newPrototype._onRemovedFromRoot = _onRemovedFromRoot;
		newPrototype._onFocus = _onFocus;
		newPrototype._onLostFocus = _onLostFocus;
	}
}