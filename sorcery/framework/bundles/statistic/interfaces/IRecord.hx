package sorcery.framework.bundles.statistic.interfaces;
import sorcery.framework.bundles.statistic.records.RecordComponent.RecordFunction;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IRecord {
	function getValue() : Float;
	function initValue(val : Float) : Void;
	function listenTo(varName:String, func:RecordFunction):IRecord;
}