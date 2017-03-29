package sorcery.framework.bundles.userData.interfaces;
import sorcery.framework.bundles.userData.enums.StorageSlot;
import sorcery.framework.bundles.userData.misc.DataHolder;
import sorcery.framework.bundles.userData.misc.DataHolderMask;

/**
 * @author Dmitriy Kolesnik
 */
interface IStorage 
{
	function save(slot:StorageSlot, dataHolder:DataHolder):Void;
	function load(slot:StorageSlot, dataHolder:DataHolder):Void;
	
	function getSlotsDescription(?mask:DataHolderMask):Array<DataHolder>;
	function getEmptySlotNum():Int;
}