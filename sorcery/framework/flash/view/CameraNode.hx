package sorcery.framework.flash.view;

import sorcery.core.interfaces.ICore;
import sorcery.core.SystemNode;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class CameraNode extends SystemNode 
{
/*
	mark field 
	@:sorcery_prepare("path")
*/
	public function new(p_core:ICore) 
	{
		super(p_core);
		nodeName = "camera";
	}
	
}