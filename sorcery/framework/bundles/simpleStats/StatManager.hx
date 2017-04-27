package sorcery.framework.bundles.simpleStats;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.framework.bundles.simpleStats.interfaces.IStatCatalog;
import sorcery.framework.bundles.simpleStats.interfaces.IStatManager;
import sorcery.framework.bundles.simpleStats.interfaces.IStatManagerInternal;
import sorcery.framework.bundles.simpleStats.interfaces.IStatMod;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatManager implements IStatManager implements IStatManagerInternal {
	var _catalog:IStatCatalog;
	var _stats:Map<StatId, Float>;
	var _mods:Array<IStatMod>;
	public function new(catalog:IStatCatalog) {
		_catalog = catalog;
		_stats = new Map();
		_mods = [];
	}
	

	public function getCatalog():IStatCatalog {
		return _catalog;
	}

	public function addMod(mod:IStatMod):IStatManager {
		_mods.push(mod);
		mod.onAddToManager(this);
		return this;
	}

	public function removeMod(mod:IStatMod):IStatManager {
		if (_mods.remove(mod))
			mod.onRemoveFromManager(this);
		return this;
	}

	public function addValue(statId:StatId, value:Float):Void {
		if (_stats.exists(statId)){
			_stats[statId] += value;
		}else{
			_stats[statId] = value;
		}
	}

	public function removeValue(statId:StatId, value:Float):Void {
		if (_stats.exists(statId)) {
			_stats[statId] -= value;
		} else {
			throw "Error: removing value from a stat that wasn't added";
		}
	}
	
	public function getRawValue(statId:StatId):Float {
		if(_stats.exists(statId))
			return _stats[statId];
		else
			return 0.;
	}
	
	public function getValue(statId:StatId):Float {
		return _catalog.getStatFormula(statId).calculateValue(getRawValue(statId), this);
	}
}