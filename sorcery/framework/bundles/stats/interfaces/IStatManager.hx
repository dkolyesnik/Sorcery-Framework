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
	
	
}