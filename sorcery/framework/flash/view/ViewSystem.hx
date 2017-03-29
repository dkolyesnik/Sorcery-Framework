package sorcery.framework.flash.view;

import sorcery.core.BaseSystem;
import sorcery.core.CoreEvent;
import sorcery.core.interfaces.ICore;
import sorcery.core.misc.NodeListLink;
import sorcery.framework.flash.view.CameraNode;
import sorcery.framework.flash.view.ViewNode;
import sorcery.framework.flash.view.ViewScene;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
@:allow(sorcery.framework.flash.view.ViewScene)
class ViewSystem extends BaseSystem 
{
/*
	mark NodeListLink with metadata
	@:sorcery_node("nodeName", true/false if need to prepare)
*/
	@:sorcery_node("view", true)
	var viewNodes:NodeListLink<ViewNode>;
	
	@:sorcery_node("camera", false)
	var cameraNodes:NodeListLink<CameraNode>;
	
	var scene:ViewScene;

	public function new(p_core:ICore, priority:Int = 0) 
	{
		super(p_core, priority);
		scene = new ViewScene();
		viewNodes.addOnAddedCallback(onViewAdded);
	}
	
	function onViewAdded(view:ViewNode) 
	{
		scene.add(view);
	}
	
	override function update(e:CoreEvent):Void 
	{
		for (view in viewNodes)
			view.update();
	}
}