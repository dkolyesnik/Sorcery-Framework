package sorcery.framework.bundles.simpleStats.interfaces;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
@:allow(sorcery.framework.bundles.stats.interfaces.IStatMod)
interface IStatManager {
	function getRawValue(statId:StatId):Float;
	function getValue(statId:StatId):Float;
	
	function addMod(mod:IStatMod):IStatManager;
	function removeMod(mod:IStatMod):IStatManager;
	
	
}