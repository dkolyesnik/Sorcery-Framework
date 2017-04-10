package sorcery.framework.bundles.statistic;

import sorcery.core.Bundle;
import sorcery.framework.bundles.userData.UserDataBundle;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatisticBundle extends Bundle 
{
	public function new() 
	{
		super();
	}
	
	override function onInitialize():Void
	{
		//executed when Bundle is initialized
		core.framework.setObj(Statistic.NAME, new Statistic(core));
	}
	
	override function onUninitialize():Void
	{
		//override to remove entities and so on
	}
	
	override function destroy():Void
	{
		//destroy all created entities
	}
	
	override function setupRequirements():Void
	{
		//names of required Bundles
		//requiresBundles([UserDataBundle.NAME]);
	}
	
	override function setupDelayedInitialization():Void
	{
		//setup initialization
		//waitsFor([/*events*/], /* function */);
	}
}