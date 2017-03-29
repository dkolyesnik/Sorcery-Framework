package sorcery.framework.bundles.builder;

import haxecontracts.Contract;
import sorcery.core.Behavior;
import sorcery.core.TypedHandlerData;
import sorcery.core.abstracts.Priority;
import sorcery.core.interfaces.ICore;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BuilderComponent extends Behavior
{

	public function new(p_core:ICore, p_priority:Priority = 0) 
	{
		Contract.requires(Priority.validate(p_priority));
		
		super(p_core);
		addHandler(new TypedHandlerData(BuilderEvent.BUILD, createLink("#." + Builder.NAME), onBuild, p_priority));
	}
	
	function onBuild(e:BuilderEvent):Void
	{
		//override
	}
	
}

