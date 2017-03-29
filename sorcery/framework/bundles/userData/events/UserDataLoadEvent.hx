package sorcery.framework.bundles.userData.events;

import sorcery.core.Event;
import sorcery.core.abstracts.EventType;
import sorcery.framework.bundles.userData.interfaces.IUserDataLoad;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class UserDataLoadEvent extends Event
{
	public static var LOAD = new EventType<UserDataLoadEvent>("load");

	public var userData(default, null):IUserDataLoad;
	public var globalData(default, null):IUserDataLoad;
	
	public function new(p_userData:IUserDataLoad, p_globalData:IUserDataLoad) 
	{
		super(LOAD);
		userData = p_userData;
		globalData = p_globalData;
	}
	
	override public function reset():Void 
	{
		super.reset();
		userData = null;
		globalData = null;
	}
}