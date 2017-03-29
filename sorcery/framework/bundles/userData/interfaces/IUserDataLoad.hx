package sorcery.framework.bundles.userData.interfaces;

/**
 * @author Dmitriy Kolesnik
 */
interface IUserDataLoad 
{
  	function getInt(id : String, defaultValue : Int) : Int;
	function getFloat(id:String, defaultValue:Float):Float;
	function getString(id:String, defaultValue:String):String;
}