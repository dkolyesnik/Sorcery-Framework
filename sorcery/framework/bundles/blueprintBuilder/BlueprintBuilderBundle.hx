package sorcery.framework.bundles.blueprintBuilder;

import sorcery.core.Bundle;
import sorcery.framework.bundles.componentFactory.ComponentFactoryBundle;
import sorcery.framework.bundles.builder.BuilderBundle;
using sorcery.framework.bundles.builder.BuilderTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BlueprintBuilderBundle extends Bundle 
{

	public function new() 
	{
		super();
	}
	
	override function onInitialize():Void
	{
		//executed when Bundle is initialized
				
		core.framework.setObj(BlueprintBuilder.NAME, new BlueprintBuilder(core));
	}
	
	override function destroy():Void
	{
		//destroy all created entities
	}
	
	override function setupRequirements():Void
	{
		//names of required Bundles
		requiresBundles([ComponentFactoryBundle.NAME, BuilderBundle.NAME]);
	}
	
	override function setupDelayedInitialization():Void
	{
		//setup initialization
	}
	
}