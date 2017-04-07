package sorcery.framework.bundles.builder;

import sorcery.core.Entity;
import sorcery.core.interfaces.ICore;
import sorcery.core.interfaces.IEntity;
import sorcery.core.interfaces.IEntityChild;
import sorcery.framework.bundles.builder.BuilderEvent;
using sorcery.framework.bundles.builder.BuilderTools;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
class BuildedEntity extends Entity
{
	public var entityType(default, null):String;
	//public var builderType(
	var _buildOnAddedToRoot:Bool = false;
	var _unbuildOnRemovedFromRoot:Bool = false;
	
	var _buildOnActivated:Bool = false;
	var _unbuildOnDeactivated:Bool = false;
	
	//var _buildOnFocus
	//var _canBeUnbuilded = true; // can be used for optimization purposes
	
	var _isBuilded = false;
	var _isBuildingIsInProcess = false; 
	
	var _params:Dynamic;
	
	var _childrenAddedByBuilder:Array<IEntityChild>;
	
	public function new(p_core:ICore) 
	{
		super(p_core);
		_childrenAddedByBuilder = [];
	}
	
	public function setType(entityType:String):BuildedEntity
	{
		this.entityType = entityType;
		return this;
	}
	
	override public function addChild(child:IEntityChild):IEntityChild 
	{
		if (_isBuildingIsInProcess)
			_childrenAddedByBuilder.push(child);
		return super.addChild(child);
	}
	
	override public function removeChild(child:IEntityChild):IEntityChild 
	{
		_childrenAddedByBuilder.remove(child);
		return super.removeChild(child);
	}
	
	public function build():IEntity
	{
		if (_isBuilded || _isBuildingIsInProcess)
			return this;
		
		_isBuildingIsInProcess = true;
		core.getBuilder().build(entityType, this, _params);
		_isBuildingIsInProcess = false;
		_isBuilded = true;
		return this;
	}
	
	public function unbuild():Void
	{
		if (_isBuilded && !_isBuildingIsInProcess){
			for (child in _childrenAddedByBuilder)
			{
				super.removeChild(child);
			}
			_isBuilded = false;
		}
	}
	
	public function buildOnAddedToRoot(unbuild:Bool = true):BuildedEntity
	{
		_buildOnAddedToRoot = true;
		_unbuildOnRemovedFromRoot = unbuild;
		_buildOnActivated = false;
		_unbuildOnDeactivated = false;
		return this;
	}
	
	public function buildOnActivated(unbuild:Bool = true):BuildedEntity
	{
		_buildOnActivated = true;
		_unbuildOnDeactivated = unbuild;
		_buildOnAddedToRoot = false;
		_unbuildOnRemovedFromRoot = false;
		return this;
	}
	
	//TODO
	//public function buildOnEvent(eventType
	
	override function addToRoot():Void 
	{
		if (_buildOnAddedToRoot)
			build();
		super.addToRoot();
	}
	
	override function removeFromRoot():Void 
	{
		if (_unbuildOnRemovedFromRoot)
			unbuild();
		super.removeFromRoot();
	}
	
	override function activate():Void 
	{
		if (_buildOnActivated)
			build();
		super.activate();
	}
	
	override function deactivate():Void 
	{
		if (_unbuildOnDeactivated)
			unbuild();
		super.deactivate();
	}
}