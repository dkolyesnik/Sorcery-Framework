package sorcery.framework.bundles.simpleStats.components;
import sorcery.framework.bundles.simpleStats.StatMod;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.framework.bundles.simpleStats.StatManager;

import sorcery.core.Component;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.simpleStats.interfaces.IStatManager;
using sorcery.framework.bundles.simpleStats.StatsTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatManagerComponent extends Component
{
	public var statManager(default, null):IStatManager;
	public function new(p_core:ICore, ?p_statManager:IStatManager) 
	{
		super(p_core);
		if (p_statManager == null)
			statManager = new StatManager(core.getStatCatalog());
		else
			statManager = p_statManager;
	}
	
}