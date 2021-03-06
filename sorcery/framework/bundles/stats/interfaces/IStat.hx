package sorcery.framework.bundles.stats.interfaces;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.macros.Nullsafety.*;
/**
 * @author Dmitriy Kolesnik
 */
interface IStat {
	function getRawValue():Float;
	
	function getValue():Float;
}