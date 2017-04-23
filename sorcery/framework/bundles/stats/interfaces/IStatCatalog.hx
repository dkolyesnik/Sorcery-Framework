package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.StatBase;
import sorcery.framework.bundles.stats.StatFormula;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.abstracts.SubstatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatCatalog {
	function createStat(statId:StatId):StatBase;

	function getStatFormula(statId:StatId):StatFormula;
	function getSubstatFormula(substatId:SubstatId):StatFormula;
	
	function registerStat(statId:StatId, stat:StatBase):IStatCatalog;
	function registerSubstat(substatId:SubstatId, formula:StatFormula):IStatCatalog;
}