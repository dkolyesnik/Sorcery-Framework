package sorcery.framework.bundles.stats.components;

import sorcery.core.Behavior;
import sorcery.core.Component;
import sorcery.core.abstracts.Path;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntityChildLink;
import sorcery.framework.bundles.stats.StatMod;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.components.StatManagerComponent;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatModComponent extends Behavior{

	var _managerLink:IEntityChildLink;
	var _statMod:StatMod;
	public function new(p_core:ICore, pathToStatManager:Path) {
		super(p_core);
		_managerLink = createLink(pathToStatManager);
		_statMod = new StatMod();
	}
	
	override function onAddedToRoot():Void {
		safeCall((_managerLink.findAs(StatManagerComponent)).addMod(_statMod));
	}
	
	override function onRemovedFromRoot():Void {
		safeCall((_managerLink.findAs(StatManagerComponent)).removeMod(_statMod));
	}
}