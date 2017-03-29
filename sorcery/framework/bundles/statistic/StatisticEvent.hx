package sorcery.framework.bundles.statistic;

import sorcery.core.Event;
import sorcery.core.abstracts.EventType;
/**
 * Created by Dmitriy Kolesnik on 20.07.2016.
 */
 
class StatisticEvent extends Event
{
	
    public static var RESET(default,never) = new EventType<Event>("reset");
    public static var FORCED_RESET(default, never) = new EventType<Event>("forced_reset");
	
	public static var SUBMIT(default, never) = new EventType<StatisticEvent>("submit");
	
    public var varName(default, null):String;
	public var value(default, null):Float;
	
    public function new(p_type : String, p_varName:String, p_value:Float)
    {
		super(p_type);
		varName = p_varName;
		value = p_value;
    }
	
	inline public static function getSubmitEvent(p_varName:String, p_value:Float):StatisticEvent
	{
		return new StatisticEvent(SUBMIT, p_varName, p_value);
	}
	
	
	static var _resetEvetn:Event;
	inline public static function getResetEvent():Event
	{
		if (_resetEvetn == null)
			_resetEvetn = new Event(RESET);
		return _resetEvetn;
	}
	
	static var _forcedResetEvetn:Event;
	inline public static function getForcedResetEvent():Event
	{
		if (_forcedResetEvetn == null)
			_forcedResetEvetn = new Event(FORCED_RESET);
		return _forcedResetEvetn;
	}
}

