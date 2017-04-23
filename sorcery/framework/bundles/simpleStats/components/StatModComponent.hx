package sorcery.framework.bundles.stats.components;

import sorcery.core.Behavior;
import sorcery.core.Component;
import sorcery.core.abstracts.Path;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntityChildLink;
import sorcery.framework.bundles.stats.abstracts.StatId;
import sorcery.framework.bundles.stats.components.StatManagerComponent;
import sorcery.framework.bundles.stats.interfaces.IStatManager;
import sorcery.framework.bundles.stats.interfaces.IStatMod;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */

 /**
  * базовый комонент для работы со стат модами. В случае если нужен будет доступ к самому моду надо будет создать наследника
  * и дать доступ к конкретной реализации IStatMod
  */
class StatModComponent extends Behavior{

	var _statMod:IStatMod;
	var _managerLink:IEntityChildLink;
	public function new(p_core:ICore, pathToStatManager:Path, statMod:IStatMod) {
		super(p_core);
		_managerLink = createLink(pathToStatManager);
		_statMod = statMod;
	}
	
	override function onAddedToRoot():Void {
		safeCall((_managerLink.findAs(StatManagerComponent)).statManager.addMod(_statMod));
	}
	
	override function onRemovedFromRoot():Void {
		_statMod.removeFromManager();
	}
}