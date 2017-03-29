package sorcery.framework.bundles.builder;

import sorcery.core.Bundle;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.framework.bundles.builder.interfaces.IBuilder;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BuilderBundle extends Bundle 
{
	

	public function new() 
	{
		super();
	}
	
	override function onInitialize():Void
	{
		//executed when Bundle is initialized
		core.framework.setObj(Builder.NAME, new Builder(core));
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