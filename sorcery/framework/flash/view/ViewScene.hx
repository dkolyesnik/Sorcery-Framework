package sorcery.framework.flash.view;
import sorcery.framework.flash.view.ViewNode;
import flash.display.Sprite;
import sorcery.framework.flash.view.Layer;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ViewScene
{
	var _scene:Sprite;
	var _layers:Array<Layer>;
	public function new() 
	{
		_scene = new Sprite();
		flash.Lib.current.addChild(_scene);
		_layers = [];
	}
	
	public function add(view:ViewNode):Void
	{
		view.addToLayer( _findLayer(view.layerId).sprite);
	}
		
	function _findLayer(index:Int):Layer
	{
		_createNewLayer(index);
		return _layers[index];
	}
	function _createNewLayer(index:Int):Void
	{
		while (index >= _layers.length)
			_addLayer();
	}
	function _addLayer():Void
	{
		var layer = new Layer();
		_scene.addChild(layer.sprite);
		_layers.push(layer);
	}
}