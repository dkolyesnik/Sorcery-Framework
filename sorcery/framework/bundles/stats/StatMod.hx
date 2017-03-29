package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.StatId;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatMod
{
	public var values:Map<StatId, Int>;
	public var remaps:Map<StatId, StatId>;
	public function new() 
	{
		values = new Map();
		remaps = new Map();
	}
	
}