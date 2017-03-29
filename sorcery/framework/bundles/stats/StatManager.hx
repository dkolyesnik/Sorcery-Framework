package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.abstracts.StatId;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatManager
{
	/*
	    дефолтные значения могут быть просто одним из модификаторов
		
		НО! ВОПРОС надо ли хранить отдельо сырые значения, сохранять их и тд и отдельно изменения от модификаторов
	*/
	public var catalog:StatCatalog;
	var _rawValues:Map<StatId,Int>;
	var _statIdRemap:Map<StatId,StatId>;
	var _mods:Array<StatMod>;
	public function new() 
	{
		_reset();
	}
	
	// values
	public function getRawValue(statId:StatId, defaultValue:Int):Int
	{
		return _rawValues.exists(statId) ? _rawValues[statId] : defaultValue;
	}
	
	/**
	 * get calculated value of the stat
	 * @param	statId
	 * @param	defaultValue - default value of the raw stat
	 * @return
	 */
	public function getValue(statId:StatId, defaultValue:Int):Float
	{
		var neededStatId:StatId = statId;
		while (_statIdRemap.exists(neededStatId))
		{
			neededStatId = _statIdRemap[neededStatId];
		}
		
		return catalog.getStat(neededStatId).calculateValue(_rawValues.exists(statId) ? _rawValues[statId] : defaultValue, this);
	}
	
	// mods
	
	public function addMod(mod:StatMod):Void
	{
		if (_mods.indexOf(mod) >= 0)
			throw "Error mod already added";
		
		for (statId in mod.values.keys())
		{
			if (_rawValues.exists(statId))
				_rawValues[statId] += mod.values[statId];
			else
				_rawValues[statId] = mod.values[statId];
		}
		for (statId in mod.remaps.keys())
		{
			//TODO  как быть если мы пытаемся заремапить стат к-й уже заремаплен?
			if (_statIdRemap.exists(statId))
				throw "Error: stat already remaped";
			else
				_statIdRemap[statId] = mod.remaps[statId];
		}
		_mods.push(mod);
	}
	
	
	
	public function removeMod(mod:StatMod):Void
	{
		if (_mods.remove(mod))
		{
			for (statId in mod.values.keys())
			{
				_rawValues[statId] -= mod.values[statId];
			}
			for (statId in mod.remaps.keys())
			{
				_statIdRemap.remove(statId);
			}
		}
	}
	
	// private
	function _reset():Void
	{
		_rawValues = new Map();
		_statIdRemap = new Map();
	}
}