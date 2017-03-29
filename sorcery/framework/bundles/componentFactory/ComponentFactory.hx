package sorcery.framework.bundles.componentFactory;

import sorcery.core.Component;
import sorcery.core.Entity;
import sorcery.core.abstracts.ComponentName;
import sorcery.core.abstracts.FrameworkObjName;
import sorcery.core.interfaces.IComponent;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.componentFactory.interfaces.IComponentFactory;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
 @:keep
class ComponentFactory extends Component implements IComponentFactory
{
	public static var NAME(default, never) = new FrameworkObjName<IComponentFactory>("componentFactory");
	
	var _map:Map<String, ICore->IComponent>;
	public function new(p_core:ICore) 
	{
		super(p_core);
		_map = new Map();
	}
	
	/* INTERFACE sorcery.framework.bundles.componentFactory.interfaces.IComponentFactory */
	
	public function createComponent(componentId:String):IComponent
	{
		if (_map.exists(componentId))
		{
			var factoryMethod = _map[componentId];
			return factoryMethod(core);
		}
		core.log('WARNING: component with ID = $componentId is not registered id ComponentFactory');
		return null;
	}
	
	public function registerComponent(componentId:String, factoryMethod:ICore-> IComponent):Void 
	{
		if (_map.exists(componentId) && _map[componentId] != factoryMethod)
		{
			core.log('WARNING: another component with ID = $componentId is already registered in ComponentFactory');
		}
		else
		{
			_map[componentId] = factoryMethod;
		}
	}
	
	public function unregisterComponent(componentId:String):Void 
	{
		_map.remove(componentId);
	}
}