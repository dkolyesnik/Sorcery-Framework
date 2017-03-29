package sorcery.framework.physics;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class MathS
{
	/**
	 * Transform angle into the 0, 360 
	 * @param	a - angle in degrees
	 * @return angle in 0, 360 diapson
	 */
	inline public static function angle0_360(a:Float):Float
	{
		a %= 360;
		if (a < 0) a += 360 else if(a > 360) a -= 360;
		return a;
	}
}