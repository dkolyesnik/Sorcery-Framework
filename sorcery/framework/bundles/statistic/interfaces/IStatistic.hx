package sorcery.framework.bundles.statistic.interfaces;
import sorcery.core.interfaces.IParent;
import sorcery.framework.bundles.statistic.records.RecordComponent;

/**
 * @author Dmitriy Kolesnik
 */
interface IStatistic extends IParent
{
	function submit(varName:String, value:Float):Void;
	function resetRecords(forced:Bool = false):Void;
	function createRecord(recordName:String, defaultValue:Float = 0., temporary:Bool = false, needSave:Bool = true):RecordComponent;
	function getRecord(recordName:String):IRecord;
}