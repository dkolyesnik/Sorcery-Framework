package sorcery.framework.bundles.screenManager;

import sorcery.core.Behavior;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.screenManager.abstracts.ScreenName;
import sorcery.framework.bundles.screenManager.interfaces.IScreenPart;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class ScreenPart extends Behavior implements IScreenPart
{

	public function new(p_core:ICore) 
	{
		super(p_core);
		
	}
	
	public function setScreens(screenNames:Array<ScreenName>):IScreenPart 
	{
		if (_agendas != null)
		{
			if (parent == null)
			{
				_agendas = new Map();
			}
			else
			{
				var array = [];
				for (a in _agendas.keys())
					array.push(a);
				for (a in array)
					_agendas.remove(a);
				_agendas = new Map();
			}
		}
		for (s in screenNames)
			addAgenda(s);
		
		return this;
	}
	
}