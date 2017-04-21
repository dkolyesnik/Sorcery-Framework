package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.interfaces.IStatManager;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatMod {
	function getManager():IStatManager;
	/**
	 * set manager, and add all values and substats to that manager
	 */
	function setManager(manager:IStatManager):Void;
	function unsetManager(manager:IStatManager):Void;
}