package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.abstracts.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
@:allow(sorcery.framework.bundles.stats.interfaces.IStatMod)
interface IStatManager {
	function getStat(statId:StatId):Stat;
	
	function addMod(mod:IStatMod):IStatManager;
	function removeMod(mod:IStatMod):IStatManager;
	
	private function addValue(statId:StatId, value:Float):Void;
	private function removeValue(statId:StatId, value:Float):Void;
	
	private function addSubstat(statId:StatId, substatId:StatId):Void;
	private function removeSubstat(statId:StatId, substatId:StatId):Void;
}