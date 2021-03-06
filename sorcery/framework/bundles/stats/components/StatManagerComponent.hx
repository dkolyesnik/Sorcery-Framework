package sorcery.framework.bundles.stats.components;
import sorcery.framework.bundles.stats.abstracts.StatId;

import sorcery.core.Component;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.interfaces.IStatManager;
using sorcery.framework.bundles.stats.StatsTools;
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