package sorcery.framework.bundles.stats.abstracts;
import sorcery.framework.bundles.stats.interfaces.IStat;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
@:forward
abstract Stat(IStat) from IStat to IStat {
	inline public function new (value:IStat){
		this = value;
	}
	@:to
	inline public function toFloat():Float{
		return this.getValue();
	}
}