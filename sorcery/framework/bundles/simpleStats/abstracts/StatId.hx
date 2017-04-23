package sorcery.framework.bundles.simpleStats.abstracts;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
abstract StatId(String) from String to String
{
	inline public function new(s:String)
		this = s;
}