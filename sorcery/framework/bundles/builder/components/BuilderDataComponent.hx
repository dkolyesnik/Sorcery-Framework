package;

import sorcery.core.Behavior;
import sorcery.core.interfaces.ICore;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BuilderDataComponent extends Behavior
{
	public var entityType(default, null):String;
	//public var builderType(
	var _buildOnAddedToRoot:Bool = false;
	var _unbuildOnRemovedFromRoot:Bool = false;
	//var _build
	public function new(p_core:ICore) 
	{
		super(p_core);
		
	}
	
}