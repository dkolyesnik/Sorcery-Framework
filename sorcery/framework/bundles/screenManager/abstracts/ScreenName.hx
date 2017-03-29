package sorcery.framework.bundles.screenManager.abstracts;
import sorcery.core.abstracts.Agenda;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
abstract ScreenName(String) to String from String
{
	inline public function new(s:String)
		this = s;
		
	@:to
	inline public function toAgenda():Agenda
		return new Agenda(this);
}