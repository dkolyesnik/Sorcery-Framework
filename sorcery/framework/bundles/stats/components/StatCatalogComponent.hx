package sorcery.framework.bundles.stats.components;
import sorcery.framework.bundles.stats.StatFormula;
import sorcery.framework.bundles.stats.abstracts.StatId;

import sorcery.core.Component;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.stats.StatBase;
import sorcery.framework.bundles.stats.StatCatalog;
import sorcery.framework.bundles.stats.interfaces.IStatCatalog;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatCatalogComponent extends Component implements IStatCatalog{
	inline public static var NAME = new FrameworkObjName<StatCatalogComponent>("statCatalog");
	
	var _catalog:StatCatalog;
	public function new(p_core:ICore) {
		super(p_core);
		_catalog = new StatCatalog();
	}
	
	
	/* INTERFACE sorcery.framework.bundles.stats.interfaces.IStatCatalog */
	
	public function createStat(statId:StatId):StatBase {
		_catalog.createStat(statId);
	}
	
	public function getFormula(statId:StatId):StatFormula {
		//_catalog.
	}
	
	public function registerStat(stat:StatBase):IStatCatalog {
		_catalog.registerStat(stat);
	}
	
	public function unregisterStat(statId:StatId):IStatCatalog {
		_catalog.unregisterStat(statId);
	}
	
}