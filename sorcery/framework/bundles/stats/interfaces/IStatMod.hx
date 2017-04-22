package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStatManager;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatMod {
	function getManager():IStatManager;
	function removeFromManager():Void;
	
	@:allow(sorcery.framework.bundles.stats.interfaces.IStatManager)
	private function setManager(manager:IStatManagerInternal):Void;
}