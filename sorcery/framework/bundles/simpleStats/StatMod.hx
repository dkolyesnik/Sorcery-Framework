package sorcery.framework.bundles.simpleStats;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.framework.bundles.simpleStats.interfaces.IStatManagerInternal;

import sorcery.framework.bundles.simpleStats.interfaces.IStatManager;
import sorcery.framework.bundles.simpleStats.interfaces.IStatMod;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatMod implements IStatMod {

	var _manager:IStatManagerInternal;
	var _stats:Map<StatId, Float>;

	public function new() {
		_stats = new Map();
	}

	public function getManager():IStatManager {
		return cast _manager;
	}

	public function getValue(statId:StatId):Float {
		if (_stats.exists(statId))
			return _stats[statId];
		else
			return 0.;
	}

	public function setValue(statId:StatId, value:Float):IStatMod {
		if (_manager != null) {
			if (_stats.exists(statId))
				_manager.removeValue(statId, _stats[statId]);
			_stats[statId] = value;
			_manager.addValue(statId, value);
		} else{
			_stats[statId] = value;
		}
		return this;
	}

	function onAddToManager(manager:IStatManagerInternal):Void {
		if (_manager != null) {
			if (_manager != manager)
				getManager().removeMod(this);
			else
				return;
		}
		_manager = manager;
		for (statId in _stats.keys()) {
			_manager.addValue(statId, _stats[statId]);
		}
	}

	function onRemoveFromManager(manager:IStatManagerInternal):Void {
		if (_manager == manager) {
			for (statId in _stats.keys()) {
				_manager.removeValue(statId, _stats[statId]);
			}
		}
		_manager = null;
	}
}