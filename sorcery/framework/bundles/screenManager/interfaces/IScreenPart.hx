package sorcery.framework.bundles.screenManager.interfaces;
import sorcery.framework.bundles.screenManager.abstracts.ScreenName;

/**
 * @author Dmitriy Kolesnik
 */
@:allow(sorcery.framework.bundles.screenManager.interfaces.IScreenManager)
interface IScreenPart 
{
	function setScreens(screenNames:Array<ScreenName>):IScreenPart;
	
	private function onActivate():Void;
	private function onDeactivate():Void;
	private function onFocus():Void;
	private function onLostFocus():Void;
}