package sorcery.framework.bundles.builder.interfaces;
import sorcery.core.interfaces.IEntity;
import sorcery.core.interfaces.IEntityChild;
import sorcery.core.interfaces.IParent;
import sorcery.framework.bundles.builder.BuildedEntity;

/**
 * @author Dmitriy Kolesnik
 */
interface IBuilder extends IParent
{
	function build(entityType:String, entity:IEntity, ?param:Map<String, Any>):IEntity;
	function allocateEntity(?p_name:String):BuildedEntity;
}