package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.StatBase;
import sorcery.framework.bundles.stats.StatFormula;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IStatCatalog {
	function createStat(statId:StatId):StatBase;

	function getFormula(statId:StatId):StatFormula;
	
	function registerStat(statId:StatId, stat:StatBase):IStatCatalog;
	
}