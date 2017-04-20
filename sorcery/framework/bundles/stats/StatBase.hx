package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStat;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatBase implements IStat {
	var _statId:StatId;
	var _manager:StatManager;
	var _formula:StatFormula;
	var _value:Float;
	public function new(statId:StatId, formula:StatFormula) {
		_statId = statId;
		_formula = formula;
		_value = 0.;
	}
	
	public function getStatId():StatId {
		return _statId;
	}

	public function getRawValue():Float {
		return _value;
	}

	public function getValue():Float {
		return _formula.calculateValue(_value, _manager);
	}

	public function add(value:Float):Void {
		_value += value;
	}

	public function remove(value:Float):Void {
		_value -= value;
	}

	public function setManager(manager:StatManager):Void {
		_manager = manager;
	}

	public function clone():StatBase {
		return new StatBase();
	}
	
	public function getFormula() {
		return _formula;
	}
}