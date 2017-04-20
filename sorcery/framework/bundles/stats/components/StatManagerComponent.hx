package sorcery.framework.bundles.stats.components;
import sorcery.framework.bundles.stats.StatMod;
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
class StatManagerComponent extends Component implements IStatManager
{
	public var statManager(default, null):StatManager;
	public function new(p_core:ICore, ?catalog:StatCatalog) 
	{
		super(p_core);
		statManager = new StatManager(catalog == null ? core.getStatCatalog() : catalog);
	}
	
	
	/* INTERFACE sorcery.framework.bundles.stats.interfaces.IStatManager */
	
	public function getStat(statId:StatId):Stat {
		return statManager.getStat(statId);
	}
	
	public function addMod(mod:StatMod):IStatManager {
		statManager.addMod(mod);
		return this;
	}
	
	public function removeMod(mod:StatMod):IStatManager {
		statManager.removeMod(mod);
		return this;
	}
	
}