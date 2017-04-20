package sorcery.framework.macros;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Expr.Field;
import sorcery.core.macros.MacroClassBuilder;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
#if macro
class NamesToValuesBuildMacro{
	
	public static function build():Array<Field>{
		var builder = new MacroClassBuilder();
		for (f in builder.fields){
			var field:Field = f;
			switch(field.kind){
				case FieldType.FVar(t, e):
					field.kind = FVar(macro:String, macro $v{field.name});
					field.access = [Access.AInline, Access.AStatic, Access.APublic];
				default:
			}
		}
		return builder.export();
	}
	
}
#end