package sorcery.framework.bundles.simpleStats.abstracts;
/**
 * ...
 * @author Dmitriy Kolesnik
 */

typedef ToStringObj = {
	function toString():String;
}
abstract StatId(String) from String to String
{
	inline public function new(s:String)
		this = s;
		
	@:from
	inline public static function fromToString(obj:ToStringObj):StatId{
		return new StatId(obj.toString());
	}
	
}