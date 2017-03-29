package sorcery.framework.bundles.statistic.records;

import sorcery.core.Event;
import sorcery.core.abstracts.EventType;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class RecordEvent extends Event
{
	public static var CHANGED(default, never) = new EventType<RecordEvent>("changed");
	
	public var oldValue(default, null):Float;
	public var newValue(default, null):Float;
	public function new(p_type:String, p_oldValue:Float, p_newValue:Float) 
	{
		super(p_type);
		oldValue = p_oldValue;
		newValue = p_newValue;
	}
	
	inline public static function getChangedEvent(p_oldValue:Float, p_newValue:Float):RecordEvent
	{
		return new RecordEvent(CHANGED, p_oldValue, p_newValue);
	}
}