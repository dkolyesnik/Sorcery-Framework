package sorcery.framework.bundles.userData.interfaces;
import sorcery.framework.bundles.userData.enums.SaveSlot;
import sorcery.framework.bundles.userData.misc.DataHolder;
import sorcery.framework.bundles.userData.misc.DataHolderMask;

/**
 * @author Dmitriy Kolesnik
 */
interface IUserData 
{
	function save(slot:SaveSlot):Void;
	function load(slot:SaveSlot):Void;
	
	function getSlotDescription(slot:SaveSlot, ?mask:DataHolderMask):DataHolder;
	function getAllSlotsDescription(?mask:DataHolderMask):Array<DataHolder>;
}