package sorcery.framework.bundles.componentFactory.interfaces;
import sorcery.core.interfaces.IComponent;
import sorcery.core.interfaces.ICore;

/**
 * @author Dmitriy Kolesnik
 */
interface IComponentFactory 
{
	function createComponent(componentId:String):IComponent;
	
	function registerComponent(componentId:String, factoryMethod:ICore-> IComponent):Void;
	function unregisterComponent(componentId:String):Void;
}