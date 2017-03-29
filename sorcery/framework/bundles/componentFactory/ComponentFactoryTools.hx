package sorcery.framework.bundles.componentFactory;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.componentFactory.interfaces.IComponentFactory;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ComponentFactoryTools
{

	public static function getComponentFactory(core:ICore):IComponentFactory
	{
		return core.framework.getObj(ComponentFactory.NAME);
	}
	
}