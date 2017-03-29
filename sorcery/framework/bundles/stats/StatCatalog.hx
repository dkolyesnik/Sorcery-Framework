package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.Stat;
import sorcery.framework.bundles.stats.abstracts.StatId;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatCatalog
{
	var _stats:Map<StatId, Stat> = new Map();
	var _defaultStat:Stat;
	public function new() 
	{
		
	}
	
	public function registerStat(statId:StatId, stat:Stat):Void
	{
		if (_stats.exists(statId))
		{
			trace("Error: dublicate stat name");
		}
		else
		{
			_stats[statId] = stat;
		}
	}
	
	public function unregisterStat(statId:StatId):Void
	{
		_stats.remove(statId);
	}
	
	public function getStat(statId:StatId):Stat
	{
		return _stats.exists(statId) ? _stats[statId] : _defaultStat;
	}
	
}