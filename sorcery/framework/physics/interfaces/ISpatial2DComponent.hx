package sorcery.framework.physics.interfaces;
import sorcery.core.interfaces.IComponent;
import sorcery.framework.physics.Points;
/**
 * @author Dmitriy Kolesnik
 */
interface ISpatial2DComponent extends IComponent
{
	var parent2DSpatial(get, null):ISpatial2DComponent;
	
	var x(get, set):Float;
	var y(get, set):Float;
	/**
	 * degrees
	 */
	var rotation(get, set):Float;
	function getPosition():Point2D;
	function setPosition(x:Float, y:Float):Void;
	function move(x:Float, y:Float):Void;
	function rotate(angle:Float):Void;
	
	var globalX(get, set):Float;
	var globalY(get, set):Float;
	/**
	 * degrees
	 */
	var globalRotation(get, set):Float;
	
	function getGlobalPosition():Point2D;
	function setGlobalPosition(x:Float, y:Float):Void;
	function moveGlobal(x:Float, y:Float):Void;
	
	function localToGlobal(x:Float, y:Float):Point2D;
	function globalToLocal(x:Float, y:Float):Point2D;
	//var scaleX(get, set):Float;
	//var scaleY(get, set):Float;
}