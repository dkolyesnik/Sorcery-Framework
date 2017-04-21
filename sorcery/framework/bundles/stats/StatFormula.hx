package sorcery.framework.bundles.stats;
import sorcery.framework.bundles.stats.interfaces.IStatManager;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class StatFormula
{

	public function new() 
	{
		
	}
	
	public function calculateValue(rawValue:Float, manager:IStatManager):Float
	{
		return rawValue;
	}
}