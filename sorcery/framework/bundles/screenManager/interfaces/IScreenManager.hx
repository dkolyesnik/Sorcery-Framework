package sorcery.framework.bundles.screenManager.interfaces;
import sorcery.framework.bundles.screenManager.abstracts.ScreenName;
import sorcery.framework.bundles.screenManager.abstracts.ScreenPartName;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
interface IScreenManager
{
	function addScreenPart(part:IScreenPart, ?screens:Array<ScreenName>):Void;
	function removeScreenPart(part:IScreenPart):Void;
	function findScreenPart(name:ScreenPartName):IScreenPart;
	
	function swapScreen(screenName:ScreenName):Void;
	function showScreen(screenName:ScreenName):Void;
	function hideScreen(screenName:ScreenName):Void;
	function hideAllScreens():Void;
}