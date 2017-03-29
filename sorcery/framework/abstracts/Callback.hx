/*
 * package sorcery.core.abstracts;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
//interface IA<T>
//{
//}

 
/*
#if cs
import cs.system.Action_1;
abstract Callback(cs.system.Action_1<String>) from Action_1<String> to Action_1<String>
{
	function new(f)
	{
		this = f;
	}
	
	public function invokeIt(data:String):Void
	{
		//this.Invoke(data);
	}
	
	@:from static function fromHaxeFunc(foo:String->Void):Callback
	{
		return new Callback(new Action_1<String>(foo));
	}
}
//#end
//#else
//abstract Callback(String->Void) from (String->Void)
//{
	//function new(f)
		//this = f;
	//public inline function invoke(data:String):Void
	//{
		//(this)(data);
	//}
//}
//#end
*/
package sorcery.framework.abstracts;
#if cs
import cs.system.Action_1;
abstract Callback(cs.system.Action_1<String>) from Action_1<String> to Action_1<String>
{
	function new(f)
		this = f;
		
	public function invokeIt(data:String):Void
		this.Invoke(data);
	
	@:from static function fromHaxeFunc(foo:String->Void):Callback
		return new Callback(new Action_1<String>(foo));
}
#end