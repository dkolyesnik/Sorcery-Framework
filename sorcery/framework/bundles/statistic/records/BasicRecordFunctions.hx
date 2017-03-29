/**
 * Created by Dmitriy Kolesnik on 17.07.2016.
 */
package sorcery.framework.bundles.statistic.records;

class BasicRecordFunctions
{
    public function new()
    {
    }
    
    public static function summ(oldVal : Float, newVal : Float) : Float
    {
        return oldVal + newVal;
    }
    public static function max(oldVal : Float, newVal : Float) : Float
    {
        if (newVal > oldVal)
        {
            return newVal;
        }
        else
        {
            return oldVal;
        }
    }
    public static function min(oldVal : Float, newVal : Float) : Float
    {
        if (newVal < oldVal)
        {
            return newVal;
        }
        else
        {
            return oldVal;
        }
    }
    public static function avarage(oldVal : Float, newVal : Float) : Float
    {
        return (oldVal + newVal) / 2;
    }
    public static function replace(oldVal : Float, newVal : Float) : Float
    {
        return newVal;
    }
    
    public static function count(oldVal : Float, newVal : Float) : Float
    {
        return ++oldVal;
    }
}

