package sorcery.framework.bundles.userData.events;

import sorcery.core.Event;
import sorcery.core.abstracts.EventType;
import sorcery.framework.bundles.userData.interfaces.IUserDataSave;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class UserDataSaveEvent extends Event  
{
	public static var SAVE = new EventType<UserDataSaveEvent>("save");
	
	public var userData(default, null):IUserDataSave;
	public var globalData(default, null):IUserDataSave;
	
	public function new(p_userData:IUserDataSave, p_globalData:IUserDataSave) 
	{
		super(SAVE);
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