package sorcery.framework.bundles.userData.misc;
import sorcery.framework.bundles.userData.interfaces.IUserDataLoad;
import sorcery.framework.bundles.userData.interfaces.IUserDataSave;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class DataHolder implements IUserDataLoad implements IUserDataSave
{
	var _intMap:Map<String, Int> = new Map();
	var _floatMap:Map<String, Float> = new Map();
	var _stringMap:Map<String, String> = new Map();
	public function new() 
	{
		
	}
	
	public function getInt(id:String, defaultValue:Int):Int 
	{
		return _intMap.exists(id)? _intMap[id] : defaultValue; 
	}
	
	public function setInt(id:String, value:Int):Void 
	{
		_intMap[id] = value;
	}
	
	public function getFloat(id:String, defaultValue:Float):Float 
	{
		return _floatMap.exists(id)? _floatMap[id] : defaultValue; 
	}
	
	public function setFloat(id:String, value:Float):Void 
	{
		_floatMap[id] = value;
	}
	
	public function getString(id:String, defaultValue:String):String 
	{
		return _stringMap.exists(id)? _stringMap[id] : defaultValue; 
	}
	
	public function setString(id:String, value:String):Void 
	{
		_stringMap[id] = value;
	}
	
}