package sorcery.framework.components;

import sorcery.core.Component;
import sorcery.core.interfaces.ICore;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class PropertyComponent extends Component
{
	var _properties:Map<String, Any>;
	public function new(p_core:ICore) 
	{
		super(p_core);
		_properties = new Map();
		setName("_properties");
	}
	
	public function setPropery<T>(name:PropertyName<T>, value:T):Void
	{
		_properties[name] = value;
	}
	
	public function getProperty<T>(name:PropertyName<T>, defaultValue:T):T
	{
		if(_properties.exists(name))
			return cast _properties[name];
		else 
			return defaultValue;
	}
	
	public function deleteProperty(name:String):Void
	{
		_properties.remove(name);
	}
}

abstract PropertyName<T>(String) to String
{
	inline public function new(s:String)
	{
		this = s;
	}
}