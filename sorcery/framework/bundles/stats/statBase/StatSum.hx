package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStat;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatSum  extends StatBase{
	
	public function new(defaultValue:Float, formula:StatFormula) {
		super(defaultValue, formula);
	}
	
	override public function addValue(value:Float):Void {
		_value += value;
	}

	override public function removeValue(value:Float):Void {
		_value -= value;
	}

	override public function clone():StatBase {
		return new StatSum(_value, _formula);
	}
}