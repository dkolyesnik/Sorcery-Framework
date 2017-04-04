package;

import sorcery.core.Component;
import sorcery.core.interfaces.ICore;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class PrototypeComponent extends Component
{
	public var _onActivate:Component->Void;
	public var _onDeactivate:Component->Void;
	public var _onAddedToRoot:Component->Void;
	public var _onRemovedFromRoot:Component->Void;
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
}