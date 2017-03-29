package sorcery.framework.bundles.screenManager;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.screenManager.interfaces.IScreenManager;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ScreenManagerTools
{
	public static function getScreenManager(core:ICore):IScreenManager
	{
		return core.framework.getObj(ScreenManager.NAME);
	}
}