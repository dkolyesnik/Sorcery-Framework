package sorcery.framework.bundles.stats.components;

import sorcery.core.Component;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.stats.StatCatalog;
import sorcery.framework.bundles.stats.interfaces.IStatCatalog;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatCatalogComponent extends Component{
	inline public static var NAME = new FrameworkObjName<StatCatalogComponent>("statCatalog");
	
	public var catalog(default, null):StatCatalog;
	public function new(p_core:ICore) {
		super(p_core);
		catalog = new StatCatalog();
	}
	
}