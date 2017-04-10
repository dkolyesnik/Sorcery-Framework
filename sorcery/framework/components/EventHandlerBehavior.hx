package;

import sorcery.core.Behavior;
import sorcery.core.TypedHandlerData;
import sorcery.core.abstracts.EventType;
import sorcery.core.interfaces.ICore;

/**
 * ...
 * @author Dmitriy Kolesnik
 */
class EventHandlerBehavior<T> extends Behavior
{

	public function new(p_core:ICore, eventType:EventType<T>, path:Path, handler:T->Void) 
	{
		super(p_core);
		addHandler(new TypedHandlerData(eventType, createLink(path), handler));
	}
	
}