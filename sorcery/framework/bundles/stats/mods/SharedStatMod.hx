package sorcery.framework.bundles.stats.mods;

import sorcery.framework.bundles.stats.StatMod;
import sorcery.framework.bundles.stats.interfaces.IStatManager;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class SharedStatMod extends StatMod{

	var _managers:Array<IStatManager>;
	public function new() {
		super();
		_managers = [];
	}
	
	//override 
}