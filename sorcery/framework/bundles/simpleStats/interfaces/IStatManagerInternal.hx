package sorcery.framework.bundles.simpleStats.interfaces;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatManagerInternal {
	function addValue(statId:StatId, value:Float):Void;
	function removeValue(statId:StatId, value:Float):Void;
}