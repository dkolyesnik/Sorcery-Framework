package sorcery.framework.bundles.simpleStats.interfaces;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.framework.bundles.simpleStats.interfaces.IStatManager;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatMod {
	function getManager():IStatManager;
	
	function getValue(statId:StatId):Float;
	function setValue(statId:StatId, value:Float):IStatMod;
	
	@:allow(sorcery.framework.bundles.simpleStats.interfaces.IStatManager)
	private function onAddToManager(manager:IStatManagerInternal):Void;
	
	@:allow(sorcery.framework.bundles.simpleStats.interfaces.IStatManager)
	private function onRemoveFromManager(manager:IStatManagerInternal):Void;
}