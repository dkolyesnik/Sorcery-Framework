package sorcery.framework.components;
import sorcery.core.interfaces.IEntity;
using sorcery.core.tools.EntityTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class PropertiesTools
{
	public static function getProperties(entity:IEntity):PropertyComponent
	{
		return entity.findChildAs("_properties", PropertyComponent);
	}
	
}