import sorcery.framework.bundles.stats.Stat;
import sorcery.framework.bundles.stats.StatBase;
import sorcery.framework.bundles.stats.StatFormula;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatMult extends StatBase {

	var _multipliers:Array<Float>;
	public function new(formula:StatFormula) {
		super(formula);
		_multipliers = [];
	}

	override public function addValue(value:Float):Void {
		_multipliers.push(value);
		_recalculateValue();
	}

	override public function removeValue(value:Float):Void {
		_multipliers.remove(value);
		_recalculateValue();
	}

	override public function clone():StatBase {
		return new StatMult(_formula);
	}

	function _recalculateValue():Void {
		if (_multipliers.length > 0) {
			_value = _multipliers[0];
			for (i in 1..._multipliers.length)
				_value *= _multipliers[i];
		} else {
			_value = 0.;
		}
	}
}