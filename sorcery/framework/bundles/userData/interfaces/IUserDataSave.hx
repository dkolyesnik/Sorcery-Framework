/**
 * Created by Dmitriy Kolesnik on 17.07.2016.
 */
package sorcery.framework.bundles.userData.interfaces;


interface IUserDataSave
{
    function setInt(id : String, value : Int) : Void;
	function setFloat(id:String, value:Float):Void;
	function setString(id:String, value:String):Void;
}


