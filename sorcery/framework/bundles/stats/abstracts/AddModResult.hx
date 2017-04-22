package;
import sorcery.macros.Nullsafety.*;
/**
 * ...
 * @author Dmitriy Kolesnik
 */
@:enum
abstract AddModResult(Int) {
	var success = 1;
	var modAlredyAdded = 2;
	var substatAlreadyAdded = 3;
}