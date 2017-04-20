package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStatManager;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatManager implements IStatManager {
	var _catalog:StatCatalog;
	var _stats:Map<StatId, StatBase>;
	var _mods:Array<StatMod>;
	public function new(catalog:StatCatalog) {
		_catalog = catalog;
		_reset();
	}

	public function getCatalog():StatCatalog {
		return _catalog;
	}

	public function getStat(statId:StatId):Stat {
		return _getStat(statId);
	}

	public function addMod(mod:StatMod):IStatManager {
		_mods.push(mod);
		for (v in mod.values) {
			var st = _getStat(v.statId);
			st.add(v.value);
		}
		return this;
	}

	public function removeMod(mod:StatMod):IStatManager {
		if (_mods.remove(mod)){
			for (v in mod.values) {
				var st = _getStat(v.statId);
				st.remove(v.value);
			}
		}
		return this;
	}

	inline function _getStat(statId:StatId):StatBase {
		if (!_stats.exists(statId))
			_stats[statId] = _catalog.createStat(statId);
		return _stats[statId];
	}

	inline function _reset():Void {
		_stats = new Map();
		_mods = [];
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