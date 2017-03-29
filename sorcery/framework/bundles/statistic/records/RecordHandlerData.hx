package sorcery.framework.bundles.statistic.records;

import sorcery.core.abstracts.Priority;
import sorcery.core.HandlerData;
import sorcery.core.interfaces.IEntityChildLink;
import sorcery.core.interfaces.IEvent;
import sorcery.framework.bundles.statistic.StatisticEvent;
import sorcery.framework.bundles.statistic.records.RecordComponent.RecordFunction;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class RecordHandlerData extends HandlerData
{
	var _varName:String;
	var _func:RecordFunction;
	var _record:RecordComponent;
	public function new(p_record:RecordComponent, p_link:IEntityChildLink, p_varName:String, p_func:RecordFunction) 
	{
		super(StatisticEvent.SUBMIT, p_link, 0);

		_varName = p_varName;
		_func = p_func;
		_record = p_record;
	}

	override public function activate(event:IEvent):Void 
	{
		var e:StatisticEvent = cast event;
		_record.applyHandler(_func, e.value);
	}
}