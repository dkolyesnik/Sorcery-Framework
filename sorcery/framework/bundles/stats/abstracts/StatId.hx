package sorcery.framework.bundles.stats.abstracts;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
abstract StatId(String) from String to String
{
	inline public function new(s:String)
		this = s;
}