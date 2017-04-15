package sorcery.framework.bundles.builder;

import haxecontracts.Contract;
import sorcery.core.Behavior;
import sorcery.core.TypedHandlerData;
import sorcery.core.abstracts.Priority;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.builder.interfaces.IBuilder;
using sorcery.framework.bundles.builder.BuilderTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */

 /**
  * Component that listen for builder events and fill up the entity with components
  */
class BuilderComponent extends Behavior
{
	var builder(default, null):IBuilder;
	public function new(p_core:ICore, p_priority:Priority = 0) 
	{
		Contract.requires(Priority.validate(p_priority));
		
		super(p_core);
		addHandler(new TypedHandlerData(BuilderEvent.BUILD, createLink("#.builder"), onBuild, p_priority));
	}
	
	override function onAddedToRoot():Void 
	{
		super.onAddedToRoot();
		builder = core.getBuilder();
	}
	
	override function onRemovedFromRoot():Void 
	{
		builder = null;
		super.onRemovedFromRoot();
	}
	
	function onBuild(e:BuilderEvent):Void
	{
		//override
	}
	
}

