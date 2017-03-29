package sorcery.framework.bundles.userData.misc;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class DataHolderMask
{
	public var intMask:Array<String>;
	public var floatMask:Array<String>;
	public var stringMask:Array<String>;
	public function new(intMask:Array<String>, floatMask:Array<String>, stringMask:Array<String>) 
	{
		this.intMask = intMask;
		this.floatMask = floatMask;
		this.stringMask = stringMask;
	}
	
}