package sorcery.framework.bundles.userData;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.userData.interfaces.IUserData;
import sorcery.framework.bundles.userData.interfaces.IUserDataSave;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class UserDataTools
{

	inline public static function getUserData(core:ICore):IUserData
	{
		return core.framework.getObj(UserData.NAME);
	}
	
}