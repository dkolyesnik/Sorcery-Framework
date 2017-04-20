package sorcery.framework.bundles.stats;
import sorcery.core.macros.interfaces.IInjectAndCreate;
import sorcery.framework.bundles.stats.abstracts.StatId;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatMod
{
	public var catalog:StatCatalog;
	public var values(default,null):Array<StatValue>;
	public var substats(default, null):Map<StatId, StatId>;
	//public var remaps:Map<StatId, StatId>;
	public function new(catalog:StatCatalog) 
	{
		values = [];
		substats = new Map();
	}
	public function addValue(statId:StatId, value:Float):Void {
		values.push(new StatValue(statId, value));
	}
	public function removeValue(statId:StatId, value:Float):Bool {
		for (i in 0...values.length){
			var v = values[i];
			if (v.statId == statId && v.value == value){
				//OPT
				values.remove(v);
			}
				
		}
	}
}

class StatValue implements IInjectAndCreate{
	function new(statId:StatId, value:Float);
}

