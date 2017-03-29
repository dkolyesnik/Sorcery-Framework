package sorcery.framework.bundles.builder.interfaces;
import sorcery.core.interfaces.IEntity;
import sorcery.core.interfaces.IEntityChild;
import sorcery.core.interfaces.IParent;

/**
 * @author Dmitriy Kolesnik
 */
interface IBuilder extends IParent
{
	function build(entityId:String, ?name:String, ?entity:IEntity, ?params:Dynamic, isGroup:Bool = false):IEntity;
}