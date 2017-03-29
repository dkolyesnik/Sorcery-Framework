package sorcery.framework.bundles.componentFactory;

import haxecontracts.Contract;
import haxecontracts.HaxeContracts;
import sorcery.core.Behavior;
import sorcery.core.Component;
import sorcery.core.interfaces.IComponent;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntity;
import sorcery.framework.bundles.componentFactory.interfaces.IComponentFactory;
import sorcery.core.misc.Pair;
/**
 * ...
 * @author Dmitriy Kolesnik
 */

typedef ComponentFactoryData = Pair<String, ICore->IComponent>;
 
class ComponentPack extends Component implements HaxeContracts
{
	var _array:Array<ComponentFactoryData>;
	public function new(p_core:ICore) 
	{
		super(p_core);
		_array = [];
	}
	
	public function add(componentId:String, factoryMethod:ICore-> IComponent):Void
	{
		Contract.requires(componentId != null);
		Contract.requires(factoryMethod != null);
		
		_array.push(new ComponentFactoryData(componentId, factoryMethod));
	}
	
	public function addToFactory(factory:IComponentFactory):Void
	{
		Contract.requires(factory != null);
		
		for (data in _array)
			factory.registerComponent(data.a, data.b);
	}
	
	public function removeFromFactory(factory:IComponentFactory):Void
	{
		Contract.requires(factory != null);
		
		for (data in _array)
			factory.unregisterComponent(data.a);
	}
	
}