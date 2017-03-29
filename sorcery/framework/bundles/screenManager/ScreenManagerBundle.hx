package sorcery.framework.bundles.screenManager;

import sorcery.core.Bundle;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.framework.bundles.screenManager.interfaces.IScreenManager;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ScreenManagerBundle extends Bundle 
{
	
	public function new() 
	{
		super();
	}
	
	override function onInitialize():Void
	{
		//executed when Bundle is initialized
		core.framework.setObj(ScreenManager.NAME, new ScreenManager(core));
		//core.framework.getObj(SCREEN_MANAGER).
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