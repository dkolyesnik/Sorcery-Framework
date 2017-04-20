package sorcery.framework.bundles.stats;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.stats.StatCatalog;
import sorcery.framework.bundles.stats.components.StatCatalogComponent;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatsTools{

	inline public static function getStatCatalog(core:ICore):StatCatalog {
		return core.framework.getObj(StatCatalogComponent.NAME).catalog;
	}
	
}