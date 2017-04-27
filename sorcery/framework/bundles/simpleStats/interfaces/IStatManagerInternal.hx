package sorcery.framework.bundles.simpleStats.interfaces;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
@:allow(sorcery.framework.bundles.simpleStats.interfaces.IStatMod)
interface IStatManagerInternal {
	private function addValue(statId:StatId, value:Float):Void;
	private function removeValue(statId:StatId, value:Float):Void;
}