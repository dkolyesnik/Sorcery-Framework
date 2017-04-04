package sorcery.framework.flash.view;
import sorcery.core.interfaces.ICore;
import sorcery.core.SystemNode;
import flash.display.Sprite;
import flash.display.DisplayObject;
import sorcery.core.interfaces.IEntity;
import sorcery.framework.physics.interfaces.ISpatial2DComponent;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
@:allow(sorcery.framework.flash.view.ViewScene)
class ViewNode extends SystemNode 
{
	public var layerId:Int;
/*
	mark field 
	@:sorcery_prepare("path")
*/
	@:sorcery_prepare(":spatial")
	var spatial:ISpatial2DComponent;

	var _do:Sprite;

	public function new(p_core:ICore) 
	{
		super(p_core);
		nodeName = "view";
	}
	
	function addToLayer(sprite:Sprite):Void
	{
		if(_do != null)
			sprite.addChild(_do);
	}
	
	function removeFromLayer():Void
	{
		safeCall(_do.parent.removeChild(_do));
	}
	
	override public function onRemovedFromRoot():Void 
	{
		removeFromLayer();
		super.onRemovedFromRoot();
	}
	
	public function update():Void
	{
		var p = spatial.getGlobalPosition();
		_do.x = p.x;
		_do.y = p.y;
		_do.rotation = spatial.globalRotation;
	}
	
	public function setDisplayObject(p_do:Sprite) 
	{
		if (_do != null && _do.parent != null)
		{
			_do.parent.addChild(p_do);
			_do.parent.removeChild(_do);
		}
		_do = p_do;
	}
}