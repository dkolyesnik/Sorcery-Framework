package;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
abstract SubstatId(String) to String  from String{
	inline public function new(s:String) {
		this = s;
	}
}