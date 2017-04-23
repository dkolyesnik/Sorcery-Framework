package sorcery.framework.bundles.simpleStats;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.simpleStats.StatCatalog;
import sorcery.framework.bundles.simpleStats.components.StatCatalogComponent;
import sorcery.framework.bundles.simpleStats.interfaces.IStatCatalog;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatsTools{

	inline public static function getStatCatalog(core:ICore):IStatCatalog {
		return core.framework.getObj(StatCatalogComponent.NAME).catalog;
	}
	
}