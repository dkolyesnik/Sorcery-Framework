/**
 * Created by Dmitriy Kolesnik on 17.07.2016.
 */
package sorcery.framework.bundles.statistic.records;

import Std;
import sorcery.core.Behavior;
import sorcery.core.Event;
import sorcery.core.TypedHandlerData;
import sorcery.core.interfaces.ICore;
import sorcery.framework.bundles.statistic.StatisticEvent;

typedef RecordFunction = Float->Float->Float;

@:allow(sorcery.framework.bundles.statistic.records.RecordHandlerData)
class RecordComponent extends Behavior
{
    // ==============================================================================
    // PRIVATE & PROTECTED VARS
    // ==============================================================================
    private var _default : Float;
    private var _value : Float;
    private var _temporary : Bool;
    private var _needSave : Bool;
    
    public function new(p_core:ICore, p_default : Float = 0, p_temporary : Bool = false, p_needSave : Bool = true)
    {
        super(p_core);
        _default = p_default;
        _value = p_default;
        _temporary = p_temporary;
        _needSave = p_temporary;
        _addHandlers();
    }
    
    // ==============================================================================
    // PUBLIC METHODS
    // ==============================================================================
    public function getValue() : Float
    {
        return _value;
    }
    
    public function initValue(val : Float) : Void
    {
        _value = val;
    }
	
	public function listenTo(varName:String, func:RecordFunction):RecordComponent
	{
		addHandler(new RecordHandlerData(this, createLink("@"), varName, func));
		return this;
	}
   
    // ==============================================================================
    // PROTECTED & PRIVATE METHODS
    // ==============================================================================
    
	function applyHandler(handler:RecordFunction, sentValue:Float):Void
	{
		var newValue = handler(_value, sentValue);
		if (newValue != _value)
		{
			parent.sendEvent(RecordEvent.getChangedEvent(_value, newValue));
			_value = newValue;
		}
	}
    
	private function _addHandlers() : Void
    {
        if (!_temporary)
        {
            addHandler(new TypedHandlerData(StatisticEvent.RESET, createLink("@"), _reset));
        }
        addHandler(new TypedHandlerData(StatisticEvent.FORCED_RESET, createLink("@"), _reset));
        
        if (_needSave)
        {
			//TODO
            //addLocalHandler(UserDataEvent.SAVE, _save);
            //addLocalHandler(UserDataEvent.LOAD, _load);
        }
    }
    
    private function _reset(e:Event) : Void
    {
        _value = _default;
    }
    
    //private function _sendVar(val : Float) : Void
    //{
        //_value = Reflect.callMethod(null, _func, [_value, val]);
        //
        //if (_callback != null)
        //{
            //_callback(alias, _value);
        //}
    //}
    
    //private function _save() : Void
    //{
        //core.userData.setData(alias, getValue());
    //}
    //
    //private function _load() : Void
    //{
        ////TODO decide what to do with this
        //removeCallback();
        //
        //initValue(Std.parseFloat(core.userData.getData(alias, _default)));
    //}
}

