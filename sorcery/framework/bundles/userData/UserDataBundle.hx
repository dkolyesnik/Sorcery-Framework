package sorcery.framework.bundles.userData;

import sorcery.core.Bundle;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class UserDataBundle extends Bundle 
{

	public function new() 
	{
		super();
	}
	
	override function onInitialize():Void
	{
		//executed when Bundle is initialized
		
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
		requiresBundles([]);
	}
	
	override function setupDelayedInitialization():Void
	{
		//setup initialization
		//waitsFor([/*events*/], /* function */);
	}
}