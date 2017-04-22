package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.StatFormula;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStatCatalog;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatCatalog implements IStatCatalog{
	var _stats:Map<StatId, StatBase>;
	var _substats:Map<SubstatId, StatFormula>;
	public function new() {
		_stats = new Map();
		_substats = new Map();
	}

	public function createStat(statId:StatId):StatBase {
		return _stats[statId].clone();
	}

	public function registerStat(statId:StatId, stat:StatBase):StatCatalog {
		if (_stats.exists(statId))
			throw "Error: such stat is already registered in catalog";
		_stats[statId] = stat;
		return this;
	}
	
	public function getDefaultValue(statId:StatId):Float {
		return _stats[statId].getRawValue();
	}
	
	public function getStatFormula(statId:StatId):StatFormula {
		return _stats[statId].getFormula();
	}
	
	public function getSubstatFormula(substatId:StatId):StatFormula {
		return _substats[substatId];
	}
	
	public function registerSubstat(substatId:StatId, formula:StatFormula):IStatCatalog {
		if (_substats.exists(statId))
			throw "Error: such substat is already registered in catalog";
		_substats[substatId] = formula;
		return this;
	}
}