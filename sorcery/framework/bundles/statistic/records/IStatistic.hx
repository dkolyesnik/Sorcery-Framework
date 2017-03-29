package sorcery.framework.bundles.statistic.records;

/**
 * @author Dmitriy Kolesnik
 */
interface IStatistic 
{
	function submit(varName:String, value:Float):Void;
	function resetRecords(forced:Bool = false):Void;
}