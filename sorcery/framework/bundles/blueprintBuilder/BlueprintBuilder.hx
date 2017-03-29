package sorcery.framework.bundles.blueprintBuilder;

import sorcery.core.Behavior;
import sorcery.core.TypedHandlerData;
import sorcery.core.abstracts.ComponentName;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.abstracts.Priority;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.builder.Builder;
import sorcery.framework.bundles.builder.BuilderComponent;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BlueprintBuilder extends Behavior
{
	public static var NAME(default, never) = new FrameworkObjName<BlueprintBuilder>("blueprintBuidler");
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		setName(NAME);
		addHandler(new TypedHandlerData(BlueprintBuilderEvent.BUILD_FROM_BLUEPRINT, createLink("#."+Builder.NAME), onBuildFromBlueprint, Priority.LOWEST));
	}
	
	function onBuildFromBlueprint(e:BlueprintBuilderEvent):Void
	{
		//TODO create blueprint
		e.entity = core.allocateEntity();
	}
	
	
}