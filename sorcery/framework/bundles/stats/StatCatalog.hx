package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatCatalog{
	var _stats:Map<StatId, StatBase>;
	var _defaultStat:StatBase;
	public function new() {
		_stats = new Map();
		_defaultStat = new StatBase(new StatFormula());
	}

	public function createStat(statId:StatId):StatBase {
		if (_stats.exists(statId)){
			return _stats[statId].clone();
		} else {
			return _defaultStat.clone();
		}
	}

	public function getFormula(statId:StatId):StatFormula {
		if (_stats.exists(statId))
			_stats[statId].getFormula();
		else
			_defaultStat.getFormula();
	}
	
	//public function registerDefaultStat(stat:StatBase):StatCatalog{
		//_defaultStat
	//}
	
	public function registerStat(stat:StatBase):StatCatalog {
		if (_stats.exists(stat.getStatId())){
			throw "Error: such stat is already registered in catalog";
		}
	}
	public function unregisterStat(statId:StatId):StatCatalog {
		
	}
	

	//public 	function registerFormula(statId:StatId, formula:StatFormula):Void
	//{
		//if (_stats.exists(statId)) {
			//trace("Error: dublicate stat name");
		//} else {
			//_stats[statId] = stat;
		//}
	//}
//
	//public 	function unregisterFormula(statId:StatId):Void
	//{
		//_stats.remove(statId);
	//}
//
	//function getFormula(statId:StatId):StatFormula{
		//return _stats.exists(statId) ? _stats[statId] : _defaultStat;
	//}

}