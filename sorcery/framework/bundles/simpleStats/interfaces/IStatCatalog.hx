package sorcery.framework.bundles.simpleStats.interfaces;
import sorcery.framework.bundles.simpleStats.StatFormula;
import sorcery.framework.bundles.simpleStats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatCatalog {
	function getStatFormula(statId:StatId):StatFormula;
	function registerStat(statId:StatId, ?formula:StatFormula):IStatCatalog;
}