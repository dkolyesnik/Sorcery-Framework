package sorcery.framework.components;
import sorcery.core.interfaces.IEntity;
import sorcery.framework.components.PropertyComponent.PropertyName;
using sorcery.core.tools.EntityTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class PropertiesTools
{
	inline public static function getProperties(entity:IEntity):PropertyComponent
	{
		return entity.findChildAs("_properties", PropertyComponent);
	}
	
}