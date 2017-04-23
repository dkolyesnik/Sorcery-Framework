package sorcery.framework.bundles.statistic;

import sorcery.core.Entity;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.statistic.interfaces.IRecord;
import sorcery.framework.bundles.statistic.interfaces.IStatistic;
import sorcery.framework.bundles.statistic.records.RecordComponent;
using sorcery.core.tools.EntityTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class Statistic extends Entity implements IStatistic
{
	public static var NAME(default, never) = new FrameworkObjName<Statistic>("statistic");
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		setName(NAME);
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
	
	public function createRecord(recordName:String, defaultValue:Float = 0., temporary:Bool = false, needSave:Bool = true):RecordComponent
	{
		var record = new RecordComponent(core, defaultValue, temporary, needSave);
		addChild(record.setName(recordName));
		return record;
	}
	
	public function getRecord(recordName:String):IRecord {
		return this.findChildAs(recordName, RecordComponent);
	}
}