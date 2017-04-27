package sorcery.framework.bundles.simpleStats;
import sorcery.framework.bundles.simpleStats.StatFormula;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.framework.bundles.simpleStats.interfaces.IStatCatalog;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatCatalog implements IStatCatalog{
	var _stats:Map<StatId, StatFormula>;
	var _defaultFormula:StatFormula;
	public function new() {
		_stats = new Map();
		_defaultFormula = new StatFormula();
	}
	
	public function getStatFormula(statId:StatId):StatFormula {
		return _stats[statId];
	}
	
	public function registerStat(statId:StatId, ?formula:StatFormula):IStatCatalog {
		if (_stats.exists(statId))
			throw "Error: formula for this stat is already registered in catalog";
		_stats[statId] = formula == null ? _defaultFormula : formula;
		return this;
	}
}