package sorcery.framework.bundles.builder;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.builder.interfaces.IBuilder;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BuilderTools
{
	public static function getBuilder(core:ICore):IBuilder
	{
		return core.framework.getObj(Builder.NAME);
	}
	
}