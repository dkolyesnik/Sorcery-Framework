package sorcery.framework.physics;
import sorcery.core.abstracts.Agenda;
#if flash
import flash.geom.Point;
import sorcery.core.Component;
import sorcery.core.CoreNames;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntity;
import sorcery.framework.physics.interfaces.ISpatial2DComponent;
import sorcery.math.Points.Point2D;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
using sorcery.core.tools.EntityTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class FlashSpatial2DComponent extends Component implements ISpatial2DComponent
{
	inline static var NAME = "spatial";
	var _do:Sprite;
	var _parent2DSpatial:FlashSpatial2DComponent;
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		setName(NAME);
		_do = new Sprite();
		_do.mouseEnabled = false;
		_do.mouseChildren = false;
	}
	
	public var parent2DSpatial(get, null):ISpatial2DComponent;
	
	function get_parent2DSpatial():ISpatial2DComponent 
	{
		return parent2DSpatial;
	}
	
	public var x(get, set):Float;
	
	function get_x():Float 
	{
		return _do.x;
	}
	
	function set_x(value:Float):Float 
	{
		return _do.x = value;
	}
	
	public var y(get, set):Float;
	
	function get_y():Float 
	{
		return _do.y;
	}
	
	function set_y(value:Float):Float 
	{
		return _do.y = value;
	}
	
	public var rotation(get, set):Float;
	
	function get_rotation():Float 
	{
		return MathS.angle0_360(_do.rotation);
	}
	
	function set_rotation(value:Float):Float 
	{
		return _do.rotation = value;
	}
	
	public function getPosition():Point2D
	{
		return new Point2D(_do.x, _do.y);
	}
	
	public function setPosition(x:Float, y:Float):Void 
	{
		_do.x = x;
		_do.y = y;
	}
	
	public function move(x:Float, y:Float):Void 
	{
		_do.x += x;
		_do.y += y;
	}
	
	public function rotate(angle:Float):Void 
	{
		var r = _do.rotation + angle;
		_do.rotation = MathS.angle0_360(r);
	}
	
	public var globalX(get, set):Float;
	
	function get_globalX():Float 
	{
		var globalPoint = _do.localToGlobal(new flash.geom.Point(0, 0));
		return globalPoint.x;
	}
	
	function set_globalX(value:Float):Float 
	{
		var globalPoint = _do.localToGlobal(new flash.geom.Point(0, 0));
		globalPoint.x = value;
		var localPoint = _do.globalToLocal(globalPoint);
		_do.x = localPoint.x;
		_do.y = localPoint.y;
		return value;
	}
	
	public var globalY(get, set):Float;
	
	function get_globalY():Float 
	{
		var globalPoint = _do.localToGlobal(new flash.geom.Point(0, 0)); 
		return globalPoint.y;
	}
	
	function set_globalY(value:Float):Float 
	{
		var globalPoint = _do.localToGlobal(new flash.geom.Point(0, 0));
		globalPoint.y = value;
		var localPoint = _do.globalToLocal(globalPoint);
		_do.x = localPoint.x;
		_do.y = localPoint.y;
		return value;
	}
	
	public var globalRotation(get, set):Float;
	
	function get_globalRotation():Float 
	{
		var angle = _do.rotation;
		var par = _do.parent;
		while (par != null)
		{
			angle += par.rotation;
			par = par.parent;
		}
		return MathS.angle0_360(angle);
	}
	
	function set_globalRotation(value:Float):Float 
	{
		_do.rotation = MathS.angle0_360(_do.rotation + globalRotation - value);
		return value;
	}
	
	public function getGlobalPosition():Point2D 
	{
		var globalPos = _do.localToGlobal(new Point(0, 0));
		return new Point2D(globalPos.x, globalPos.y);
	}
	
	public function setGlobalPosition(x:Float, y:Float):Void 
	{
		var localPoint = _do.globalToLocal(new flash.geom.Point(x,y));
		_do.x = localPoint.x;
		_do.y = localPoint.y;
	}
	
	public function moveGlobal(x:Float, y:Float):Void 
	{
		var globalPoint = _do.localToGlobal(new flash.geom.Point(0, 0));
		globalPoint.x += x;
		globalPoint.y += y;
		var localPoint = _do.globalToLocal(globalPoint);
		_do.x = localPoint.x;
		_do.y = localPoint.y;
	}
	
	public function localToGlobal(x:Float, y:Float):Point2D 
	{
		var globalPoint = _do.localToGlobal(new flash.geom.Point(x, y));
		return new Point2D(globalPoint.x, globalPoint.y);
	}
	
	public function globalToLocal(x:Float, y:Float):Point2D 
	{
		var localPoint = _do.globalToLocal(new flash.geom.Point(x, y));
		return new Point2D(localPoint.x, localPoint.y);
	}
	
	override function onActivate():Void 
	{
		super.onActivate();
		//TODO add to parent??
	}
	
	override function onDeactivate():Void 
	{
		super.onDeactivate();
		//TODO remove from parent ??
	}
	
	
	override public function onAddedToRoot():Void 
	{
		super.onAddedToRoot();
		var child = parent.findChildInParents(NAME);
		if (child != null)
		{
			_parent2DSpatial = cast child;
			parent2DSpatial = _parent2DSpatial;
			_parent2DSpatial._do.addChild(_do);
		}
		if (_do.parent == null)
			flash.Lib.current.addChild(_do);
	}
	
	override public function onRemovedFromRoot():Void 
	{
		if (_do.parent != null)
			_do.parent.removeChild(_do);
		parent2DSpatial = null;
		_parent2DSpatial = null;
		super.onRemovedFromRoot();
	}
	
}
#end