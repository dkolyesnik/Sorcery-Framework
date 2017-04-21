package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStatCatalog;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatCatalog implements IStatCatalog{
	var _stats:Map<StatId, StatBase>;
	
	public function new() {
		_stats = new Map();
	}

	public function createStat(statId:StatId):StatBase {
		if (_stats.exists(statId)){
			return _stats[statId].clone();
		} else {
			throw "Error: stat is not registered";
			return null;
		}
	}

	public function registerStat(statId:StatId, stat:StatBase):StatCatalog {
		if (_stats.exists(statId)){
			throw "Error: such stat is already registered in catalog";
		}
		_stats[statId] = stat;
		return this;
	}
	
	public function getFormula(statId:StatId):StatFormula {
		if (_stats.exists(statId))
			return _stats[statId].getFormula();
		else
			throw "Error: stat is not registered";
	}
}