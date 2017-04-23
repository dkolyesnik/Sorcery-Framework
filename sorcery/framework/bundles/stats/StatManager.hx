package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.abstracts.SubstatId;
import sorcery.framework.bundles.stats.interfaces.IStatCatalog;
import sorcery.framework.bundles.stats.interfaces.IStatManager;
import sorcery.framework.bundles.stats.interfaces.IStatManagerInternal;
import sorcery.framework.bundles.stats.interfaces.IStatMod;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatManager implements IStatManager implements IStatManagerInternal {
	var _catalog:IStatCatalog;
	var _stats:Map<StatId, StatBase>;
	var _substats:Map<StatId, SubstatId>;
	var _mods:Array<IStatMod>;
	public function new(catalog:IStatCatalog) {
		_catalog = catalog;
		_stats = new Map();
		_substats = new Map();
		_mods = [];
	}

	public function getCatalog():IStatCatalog {
		return _catalog;
	}

	public function getStat(statId:StatId):Stat {
		return _getStat(statId);
	}

	public function addMod(mod:IStatMod):IStatManager {
		_mods.push(mod);
		mod.setManager(this);
		return this;
	}

	public function removeMod(mod:IStatMod):IStatManager {
		if (_mods.remove(mod))
			mod.unsetManager(this);
		return this;
	}

	public function addValue(statId:StatId, value:Float):Void {
		var statBase = _getStat(statId);
		statBase.addValue(value);
	}

	public function removeValue(statId:StatId, value:Float):Void {
		if (_stats.exists(statId)) {
			_stats[statId].removeValue(value);
		} else {
			throw "Error: removing value from a stat that wasn't added";
		}
	}

	public function addSubstat(statId:StatId, substatId:StatId):Void {
		if (_substats.exists(statId)){
			var substatIds = _substats[statId];
			
		}
		var statBase = _getStat(statId);
		statBase
	}

	public function removeSubstat(statId:StatId, substatId:StatId):Void {

	}

	inline function _getStat(statId:StatId):StatBase {
		if (!_stats.exists(statId))
			_stats[statId] = _catalog.createStat(statId);
		return _stats[statId];
	}

	//public function getStat(statId:StatId):
	//public function getRawValue(statId:StatId, defaultValue:Int):Int
	//{
	//return _rawValues.exists(statId) ? _rawValues[statId] : defaultValue;
	//}
	//
	///**
	//* get calculated value of the stat
	//* @param	statId
	//* @param	defaultValue - default value of the raw stat
	//* @return
	//*/
	//public function getValue(statId:StatId, defaultValue:Int):Float
	//{
	//var neededStatId:StatId = statId;
	//while (_statIdRemap.exists(neededStatId))
	//{
	//neededStatId = _statIdRemap[neededStatId];
	//}
	//
	//return catalog.getStat(neededStatId).calculateValue(_rawValues.exists(statId) ? _rawValues[statId] : defaultValue, this);
	//}
	//
	//// mods
	//
	//public function addMod(mod:StatMod):Void
	//{
	//if (_mods.indexOf(mod) >= 0)
	//throw "Error mod already added";
	//
	//for (statId in mod.values.keys())
	//{
	//if (_rawValues.exists(statId))
	//_rawValues[statId] += mod.values[statId];
	//else
	//_rawValues[statId] = mod.values[statId];
	//}
	//for (statId in mod.remaps.keys())
	//{
	////TODO  как быть если мы пытаемся заремапить стат к-й уже заремаплен?
	//if (_statIdRemap.exists(statId))
	//throw "Error: stat already remaped";
	//else
	//_statIdRemap[statId] = mod.remaps[statId];
	//}
	//_mods.push(mod);
	//}
	//
	//
	//
	//public function removeMod(mod:StatMod):Void
	//{
	//if (_mods.remove(mod))
	//{
	//for (statId in mod.values.keys())
	//{
	//_rawValues[statId] -= mod.values[statId];
	//}
	//for (statId in mod.remaps.keys())
	//{
	//_statIdRemap.remove(statId);
	//}
	//}
	//}
	//
	//
	///* INTERFACE sorcery.framework.bundles.stats.interfaces.IStatManager */
	//
	//public function addValue(statId:StatId, value:Float):Void {
	//
	//}
	//
	//public function removeValue(statId:StatId, value:Float):Void {
	//
	//}
	//
	//// private

}