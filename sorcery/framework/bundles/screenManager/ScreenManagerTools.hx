package sorcery.framework.bundles.screenManager;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntity;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ScreenManagerTools
{
	public static function getScreenManager(core:ICore):IEntity
	{
		return core.framework.getObj(ScreenManagerBundle.screenManagerName);
	}
}