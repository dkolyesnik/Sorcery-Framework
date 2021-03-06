package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.StatFormula;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStat;
import sorcery.framework.bundles.stats.interfaces.IStatManager;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatBase implements IStat {
	var _manager:IStatManager;
	var _formula:StatFormula;
	
	var _value:Float;
	
	public function new(defaultValue:Float, formula:StatFormula) {
		_formula = formula;
		_value = defaultValue;
	}

	public function setManager(manager:IStatManager):Void {
		_manager = manager;
	}
	
	public function addValue(value:Float):Void {
		throw "Error: need override";
	}

	public function removeValue(value:Float):Void {
		throw "Error: need override";
	}

	public function clone():StatBase {
		throw "Error: need override";
		return null;
	}
	
	public function replaceFormula(formula:StatFormula):Void {
		_formula = formula;
	}
	
	public function getFormula():StatFormula {
		return _formula;
	}
	
	public function getRawValue():Float {
		return _value;
	}

	public function getValue():Float {
		return _formula.calculateValue(_value, _manager);
	}

}