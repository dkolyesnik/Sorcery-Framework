package sorcery.framework.bundles.statistic;

import sorcery.core.Entity;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.statistic.records.IStatistic;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class Statistic extends Entity implements IStatistic
{
	public static var NAME(default, never) = new FrameworkObjName<IStatistic>("statistic");
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		
	}
	
	public function submit(varName:String, value:Float):Void
	{
		sendEvent(StatisticEvent.getSubmitEvent(varName, value));
	}
	
	public function resetRecords(forced:Bool = false):Void
	{
		if(!forced)
			sendEvent(StatisticEvent.getResetEvent());
		else
			sendEvent(StatisticEvent.getForcedResetEvent());
	}
	
	
}