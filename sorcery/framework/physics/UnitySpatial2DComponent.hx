package sorcery.framework.physics;

import sorcery.core.Component;
import sorcery.core.CoreNames;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntity;
using sorcery.core.tools.EntityTools;
import sorcery.framework.physics.interfaces.ISpatial2DComponent;
import sorcery.math.Points.Point2D;
import unityengine.GameObject;
import unityengine.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class UnitySpatial2DComponent extends Component implements ISpatial2DComponent
{
	inline static var NAME = "spatial";
	var _go:GameObject;
	var _parent2DSpatial:UnitySpatial2DComponent;
	var _initialized:Bool = false;
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		setName(NAME);
		_go = new GameObject();
	}
	
	public var parent2DSpatial(get, null):ISpatial2DComponent;
	
	function get_parent2DSpatial():ISpatial2DComponent 
	{
		return parent2DSpatial;
	}
	
	public var x(get, set):Float;
	
	function get_x():Float 
	{
		return _go.transform.localPosition.x;
	}
	
	function set_x(value:Float):Float 
	{
		var pos = _go.transform.localPosition;
		pos.x = value;
		_go.transform.localPosition = pos;
		return value;
	}
	
	public var y(get, set):Float;
	
	function get_y():Float 
	{
		return _go.transform.localPosition.y;
	}
	
	function set_y(value:Float):Float 
	{
		var pos = _go.transform.localPosition;
		pos.y = value;
		_go.transform.localPosition = pos;
		return value;
	}
	
	public var rotation(get, set):Float;
	
	function get_rotation():Float 
	{
		return _go.transform.localRotation.eulerAngles.z;
	}
	
	function set_rotation(value:Float):Float 
	{
		var angles = _go.transform.localRotation.eulerAngles;
		angles.z = value;
		_go.transform.localRotation = Quaternion.Euler(angles);
		return value;
	}
	
	public function getPosition():Point2D
	{
		var pos = _go.transform.localPosition;
		
		return new Point2D(pos.x, pos.y);
	}
	
	public function setPosition(x:Float, y:Float):Void 
	{
		_go.transform.localPosition.Set(x, y, _go.transform.localPosition.z);
	}
	
	public function move(x:Float, y:Float):Void 
	{
		var pos = _go.transform.localPosition;
		pos.x += x;
		pos.y += y;
		_go.transform.localPosition = pos;
	}
	
	public function rotate(angle:Float):Void 
	{
		_go.transform.Rotate(0, 0, angle);
	}
	
	public var globalX(get, set):Float;
	
	function get_globalX():Float 
	{
		return _go.transform.position.x;
	}
	
	function set_globalX(value:Float):Float 
	{
		var pos = _go.transform.position;
		pos.x = value;
		_go.transform.position = pos;
		return value;
	}
	
	public var globalY(get, set):Float;
	
	function get_globalY():Float 
	{
		return _go.transform.position.y;
	}
	
	function set_globalY(value:Float):Float 
	{
		var pos = _go.transform.position;
		pos.y = value;
		_go.transform.position = pos;
		return value;
	}
	
	public var globalRotation(get, set):Float;
	
	function get_globalRotation():Float 
	{
		return _go.transform.rotation.eulerAngles.z;
	}
	
	function set_globalRotation(value:Float):Float 
	{
		var angles = _go.transform.rotation.eulerAngles;
		angles.z = value;
		_go.transform.rotation = Quaternion.Euler(angles);
		return value;
	}
	
	public function getGlobalPosition():Point2D
	{
		var pos = _go.transform.position;
		return new Point2D(pos.x, pos.y);
	}
	
	public function setGlobalPosition(x:Float, y:Float):Void 
	{
		_go.transform.position.Set(x, y, _go.transform.position.z);
	}
	
	public function moveGlobal(x:Float, y:Float):Void 
	{
		var pos = _go.transform.position;
		pos.x += x;
		pos.y += y;
		_go.transform.position = pos;
	}
	
	public function localToGlobal(x:Float, y:Float):Point2D 
	{
		var pos = _go.transform.TransformPoint(x, y, 0);
		return new Point2D(pos.x, pos.y);
	}
	
	public function globalToLocal(x:Float, y:Float):Point2D 
	{
		var pos = _go.transform.InverseTransformPoint(x, y, 0);
		return new Point2D(pos.x, pos.y);
	}
	
	//override function onAddedToParent(p_parent:IEntity):Void 
	//{
		////super.onAddedToParent(p_parent);
	//}
	
	override public function onAddedToRoot():Void 
	{
		super.onAddedToRoot();
		//searching for the parentSpatial
		var child = parent.findChildInParents(NAME);
		
		if (child != null)
		{
			_parent2DSpatial = cast child;
			parent2DSpatial = _parent2DSpatial;
			if (_initialized)
			{
				//if (_go.transform.parent != parentSp._go.transform)
				_go.transform.parent = _parent2DSpatial._go.transform;
			}
			else
			{
				Object.Instantiate(_go, _parent2DSpatial._go.transform);
				_initialized = true;
			}
		}
		if (_initialized)
		{
			if(_go.transform.parent != null)
				_go.transform.parent = null;
		}
		else
		{
			Object.Instantiate(_go);
				_initialized = true;
		}
	}	
	
	override public function onRemovedFromRoot():Void 
	{
		super.onRemovedFromRoot();
		_go.transform.parent = null;
		parent2DSpatial = null;
		_parent2DSpatial = null;
	}
	
	override function onActivate():Void 
	{
		super.onActivate();
		_go.SetActive(true);
	}
	
	override function onDeactivate():Void 
	{
		super.onDeactivate();
		_go.SetActive(false);
	}
	
}