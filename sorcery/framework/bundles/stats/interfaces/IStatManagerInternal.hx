package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatManagerInternal {
	function addValue(statId:StatId, value:Float):Void;
	function removeValue(statId:StatId, value:Float):Void;
	
	function addSubstat(statId:StatId, substatId:StatId):Void;
	function removeSubstat(statId:StatId, substatId:StatId):Void;
}