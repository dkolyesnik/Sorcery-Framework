package sorcery.framework.bundles.builder.components;

import sorcery.core.Component;
import sorcery.core.interfaces.ICore;
using sorcery.framework.bundles.builder.BuilderTools;
using sorcery.core.tools.EntityTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BuildUponAddedToRootComponent extends Component
{
	var objectName:String;
	var objectType:String;
	var params:Dynamic;
	var isGroup:Bool;
	
	@:injectArguments
	public function new(p_core:ICore, objectType:String,  ?objectName:String, ?params:Dynamic, isGroup:Bool = false) 
	{
		super(p_core);
	}
	
	override function onAddedToRoot():Void 
	{
		var ent = core.getBuilder().build(objectType, core.allocateEntity(objectName), params, isGroup);
		objectName = ent.name;
		parent.addChild(ent);
	}
	
	override function onRemovedFromRoot():Void 
	{
		parent.removeChildByName(objectName);
	}
}