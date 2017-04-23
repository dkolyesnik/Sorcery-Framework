package sorcery.framework.bundles.userData;
import sorcery.framework.bundles.userData.enums.StorageSlot;
import sorcery.framework.bundles.userData.misc.DataHolderMask;

import sorcery.core.Behavior;
import sorcery.core.Entity;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.userData.enums.SaveSlot;
import sorcery.framework.bundles.userData.events.UserDataSaveEvent;
import sorcery.framework.bundles.userData.interfaces.IStorage;
import sorcery.framework.bundles.userData.interfaces.IUserDataSave;
import sorcery.framework.bundles.userData.interfaces.IUserData;
import sorcery.framework.bundles.userData.misc.DataHolder;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class UserData extends Entity implements IUserData
{
	public static var NAME(default, null) = new FrameworkObjName<UserData>("userData");
	
	public var userHolder(default, null):DataHolder;
	public var globalHolder(default, null):DataHolder;
	
	var _storage:IStorage;
	var _currentStorageSlot:StorageSlot;
	var _autoSave:Bool = false;
	
	public function new(p_core:ICore, p_storage:IStorage) 
	{
		super(p_core);
		_storage = p_storage;
		userHolder = new DataHolder();
		globalHolder = new DataHolder();
	}
	
	function loadFromStorage(slot:SaveSlot):Void 
	{
		//TODO
	}
	
	function saveToStorage(slot:SaveSlot):Void 
	{
		_storage.save(Global, globalHolder);
		switch(slot)
		{
			case Current:
			case Default:
			case New:
				_currentStorageSlot = StorageSlot.SlotNum(_storage.getEmptySlotNum());
			case SlotNum(n):
				_currentStorageSlot = StorageSlot.SlotNum(n);
		}
		_storage.save(_currentStorageSlot, userHolder);
	}
	
	public function save(slot:SaveSlot):Void 
	{
		var e = new UserDataSaveEvent(userHolder, globalHolder);
		sendEvent(e);
		e.reset();
		saveToStorage(slot);
	}
	
	public function load(slot:SaveSlot):Void 
	{
		switch(slot)
		{
			case SaveSlot.Current:
			case SaveSlot.Default:
				//TODO
			case SaveSlot.SlotNum(n):
				//if (n != _currentStorageSlot)
				//{
					//
				//}
			default:
		}
		
		var e = new UserDataSaveEvent(userHolder, globalHolder);
		sendEvent(e);
		e.reset();
	}
	
	public function getSlotDescription(slot:SaveSlot, ?mask:DataHolderMask):DataHolder 
	{
		//TODO
		return null;
	}
	
	public function getAllSlotsDescription(?mask:DataHolderMask):Array<DataHolder> 
	{
		//TODO
		return null;
	}
	
}