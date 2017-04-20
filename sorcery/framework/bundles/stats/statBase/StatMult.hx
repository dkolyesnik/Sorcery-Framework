package sorcery.framework.bundles.stats.statBase;
import sorcery.framework.bundles.stats.Stat;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatMult extends StatBase{
	
	var _multipliers:Array<Float>;
	public function new(formula:StatFormula) {
		super(formula);
		_value = 0.;
		_multipliers = [];
	}
	
	override public function add(value:Float):Void {
		_multipliers.push(value);
	}
	
	override public function remove(value:Float):Void {
		_multipliers.remove(value);
	}
	
	override public function clone():StatBase {
		return new StatMult();
	}
}