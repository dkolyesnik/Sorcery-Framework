package sorcery.framework.bundles.stats.mods;
import sorcery.core.macros.interfaces.IInjectAndCreate;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStatCatalog;
import sorcery.framework.bundles.stats.interfaces.IStatManager;
import sorcery.framework.bundles.stats.interfaces.IStatManagerInternal;
import sorcery.framework.bundles.stats.interfaces.IStatMod;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ArrayStatMod implements IStatMod {
	public var values(default,null):Array<StatValue>;
	//public var substats(default, null):Array<SubstatInfo>;

	var _manager:IStatManager;
	public function new() {
		values = [];
		//substats = [];
	}

	public function getManager():IStatManager {
		return _manager;
	}

	public function removeFromManager():Void {
		safeCall(_manager.removeMod(this));
	}
	
	public function addValue(statId:StatId, value:Float):Void {
		values.push(new StatValue(statId, value));
		if (_manager != null) {
			_manager.addValue(statId, value);
		}
	}

	public function removeValue(statId:StatId, value:Float):Bool {
		for (i in 0...values.length) {
			var v = values[i];
			if (v.statId == statId && v.value == value) {
				//OPT
				values.remove(v);
				if (_manager != null)
					_manager.removeValue(statId, value);
			}
		}
	}

	//public function increaseValue(statId:StatId, value:Float):Void {
		//var statValueExist = false;
		//for (v in values) {
			//if (v.statId == statId) {
				//statValueExist = true;
				//if (_manager != null) {
					//_manager.removeValue(v.statId, v.value);
					//v.value += value;
					//_manager.addValue(v.statId, v.value);
				//} else {
					//v.value += value;
				//}
				//break;
			//}
		//}
		//if (!statValueExist)
			//addValue(statId, value);
	//}
//
	//public function decreaseValue(statId:StatId, value:Float):Bool {
		//var statValueExist = false;
		//for (v in values) {
			//if (v.statId == statId) {
				//statValueExist = true;
				//if (_manager != null) {
					//_manager.removeValue(v.statId, v.value);
					//v.value -= value;
					//_manager.addValue(v.statId, v.value);
				//} else {
					//v.value -= value;
				//}
				//break;
			//}
		//}
		//return statValueExist;
	//}

	//public function addSubstat(statId:StatId, substatId:StatId):Void {
		//substats.push(new SubstatInfo(statId, substatId));
		//if (_manager != null)
			//_manager.removeSubstat(statId, substatId);
	//}
//
	//public function removeSubstat(statId:StatId, substatId:StatId):Bool {
//
	//}

	function setManager(manager:IStatManagerInternal):Void {
		if (_manager != null) {
			if (_manager != manager)
				_manager.removeMod(this);
			else
				return;
		}

		_manager = manager;
		for (v in values)
			_manager.addValue(v.statId, v.value);
	}

}

class StatValue implements IInjectAndCreate {
	function new(statId:StatId, value:Float);
}

class SubstatInfo implements IInjectAndCreate {
	function new(statId:StatId, substatId:StatId);
}
