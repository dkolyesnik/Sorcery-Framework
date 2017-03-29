package sorcery.framework.bundles.screenManager;

import sorcery.core.Entity;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.screenManager.abstracts.ScreenName;
import sorcery.framework.bundles.screenManager.abstracts.ScreenPartName;
import sorcery.framework.bundles.screenManager.interfaces.IScreenManager;
import sorcery.framework.bundles.screenManager.interfaces.IScreenPart;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ScreenManager extends Entity implements IScreenManager
{
	public static var NAME(default, never) = new FrameworkObjName<IScreenManager>("screenManager");

	public function new(p_core:ICore) 
	{
		super(p_core);
		setName(NAME);
	}
	
	public function addScreenPart(part:IScreenPart, ?screens:Array<ScreenName>):Void 
	{
		if (screens != null)
			part.setScreens(screens);
		addChild(cast part);
	}
	
	public function removeScreenPart(part:IScreenPart):Void 
	{
		removeChild(cast part);
	}
	
	public function findScreenPart(p_name:ScreenPartName):IScreenPart 
	{
		var child = findChild(p_name);
		if (Std.is(child, IScreenPart))
			return cast child;
		else 
			return null;
	}
	
	public function swapScreen(screenName:ScreenName):Void 
	{
		agenda.swap(screenName);
	}
	
	public function showScreen(screenName:ScreenName):Void 
	{
		agenda.show(screenName);
	}
	
	public function hideScreen(screenName:ScreenName):Void 
	{
		agenda.hide(screenName);
	}
	
	public function hideAllScreens():Void 
	{
		agenda.hideAll();
	}
	
}