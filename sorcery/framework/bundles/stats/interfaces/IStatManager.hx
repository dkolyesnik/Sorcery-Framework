package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.StatMod;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatManager {
	function getStat(statId:StatId):Stat;
	
	function addMod(mod:StatMod):IStatManager;
	function removeMod(mod:StatMod):IStatManager;
	
	//function addValue(statId:StatId, value:Float):Void;
	//function removeValue(statId:StatId, value:Float):Void;
}