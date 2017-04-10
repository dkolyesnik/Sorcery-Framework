package sorcery.framework.bundles.statistic;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.statistic.interfaces.IStatistic;
import sorcery.framework.bundles.statistic.records.RecordComponent;
using sorcery.framework.bundles.statistic.StatisticTools;
import sorcery.framework.bundles.statistic.records.BasicRecordFunctions.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatisticSetup
{
	var core:ICore;
	var statistic:IStatistic;
	public function new(core:ICore)
	{
		this.core = core;
		statistic = core.getStatistic();
	}

	public function setup():Void
	{
		//override
	}

	inline function createRecord(recordName:String, defaultValue = 0., temporary = false, needSave = true):RecordComponent
	{
		return statistic.createRecord(recordName, defaultValue, temporary, needSave);
	}
}