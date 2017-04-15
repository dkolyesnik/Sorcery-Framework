package sorcery.framework.physics.tools;
import sorcery.core.interfaces.IEntity;
import sorcery.framework.physics.Points.Point2D;
import sorcery.framework.physics.interfaces.ISpatial2DComponent;
using sorcery.core.tools.EntityTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class Spatial2DTools{

	inline public static function getSpatial(entity:IEntity):ISpatial2DComponent{
		return entity.findChildAs("spatial", ISpatial2DComponent);
	}
	
	inline public static function setPosition(entity:IEntity, x:Float, y:Float):ISpatial2DComponent
	{
		var spatial = getSpatial(entity);
		spatial.setPosition(x, y);
		return spatial;
	}
	
	inline public static function getPosition(entity:IEntity):Point2D
	{
		return getSpatial(entity).getPosition();
	}
}