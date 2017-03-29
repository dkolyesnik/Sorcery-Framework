package sorcery.framework.bundles.blueprintBuilder;

import sorcery.core.abstracts.Priority;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.builder.BuilderComponent;
import sorcery.framework.bundles.builder.BuilderEvent;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BlueprintPackComponent extends BuilderComponent
{
	var _blueprints:Map<String, Dynamic> = new Map();
	public function new(p_core:ICore, p_priority:Priority = 0) 
	{
		super(p_core, p_priority);
	}
	
	function fillBlueprints():Void
	{
		//override
	}
	
	override function onBuild(e:BuilderEvent):Void 
	{
		if (_blueprints.exists(e.entityId))
		{
			var blueprintEvent = BlueprintBuilderEvent.getBuildBlueprintEvent(_blueprints[e.entityId]);
			parent.sendEvent(blueprintEvent);
			if (blueprintEvent.entity != null)
				e.entity = blueprintEvent.entity;
			blueprintEvent.reset();
		}
	}
}