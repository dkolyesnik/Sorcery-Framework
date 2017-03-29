package sorcery.framework.bundles.stats;

import sorcery.core.Component;
import sorcery.core.interfaces.ICore;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatManagerComponent extends Component
{
	public var statManager:StatManager;
	public function new(p_core:ICore) 
	{
		super(p_core);
		
	}
	
}