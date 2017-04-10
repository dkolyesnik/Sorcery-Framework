package sorcery.framework.bundles.statistic;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.statistic.interfaces.IStatistic;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatisticTools
{

	inline public static function getStatistic(core:ICore):IStatistic
	{
		return core.framework.getObj(Statistic.NAME);
	}
	
}