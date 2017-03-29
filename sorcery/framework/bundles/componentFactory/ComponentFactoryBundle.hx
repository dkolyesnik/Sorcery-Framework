package sorcery.framework.bundles.componentFactory;

import sorcery.core.Bundle;
import sorcery.core.abstracts.ComponentName;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.framework.bundles.componentFactory.interfaces.IComponentFactory;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ComponentFactoryBundle extends Bundle 
{

	public function new() 
	{
		super();
	}
	
	override function onInitialize():Void
	{
		//executed when Bundle is initialized
		core.framework.setObj(ComponentFactory.NAME, new ComponentFactory(core));
	}
	
	override function destroy():Void
	{
		//destroy all created entities
	}
	
	override function setupRequirements():Void
	{
		//names of required Bundles
		requiresBundles([]);
	}
	
	override function setupDelayedInitialization():Void
	{
		//setup initialization
		//waitsFor([/*events*/], /* function */);
	}
}