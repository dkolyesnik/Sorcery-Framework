package sorcery.framework.bundles.screenManager.abstracts;
import sorcery.core.abstracts.ComponentName;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
abstract ScreenPartName(String) to String
{
	public function new(s:String)
		this = s;
		
	@:to
	public function toComponentName():ComponentName
		return new ComponentName(this);
}