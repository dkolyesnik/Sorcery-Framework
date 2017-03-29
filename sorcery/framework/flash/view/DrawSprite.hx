package sorcery.framework.flash.view;
#if flash
import sorcery.framework.bundles.view.ColorRGB;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class DrawSprite
{

	public static function rect(x:Float, y:Float, width:Float, height:Float, color:ColorRGB, alpha:Float = 1):flash.display.Sprite
	{
		var spr = new flash.display.Sprite();
		spr.graphics.beginFill(color, alpha);
		spr.graphics.drawRect(x, y, width, height);
		spr.graphics.endFill();
		return spr;
	}
	
	//public static function circle(x,y,
	
}
#end