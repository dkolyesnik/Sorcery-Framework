package sorcery.framework.bundles.screenManager;

import sorcery.core.Bundle;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.IEntity;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ScreenManagerBundle extends Bundle 
{
	inline public static var screenManagerName = new FrameworkObjName<IEntity>("screenManager");
	
	public function new() 
	{
		super();
	}
	
	override function onInitialize():Void
	{
		//executed when Bundle is initialized
		core.framework.setObj(screenManagerName, core.allocateEntity(screenManagerName));
	}
	
	override function setupRequirements():Void
	{
		//names of required Bundles
		//requiresBundles([]);
	}
	
	override function setupDelayedInitialization():Void
	{
		//setup initialization
		//waitsFor([/*events*/], /* function */);
	}
}