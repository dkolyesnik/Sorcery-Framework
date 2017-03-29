package sorcery.framework.abstracts;

/**
 * RGB color type based on a 32-bit integer.
 */
abstract ColorRGB(Int) from Int to Int {
    /**
     * Predefined color constants for common colors.
     */
    
    public static inline var TRANSPARENT : ColorRGB = 0x000000;
    public static inline var BLACK : ColorRGB = 0x000000;
    public static inline var WHITE : ColorRGB = 0xffffff;
    public static inline var RED : ColorRGB = 0xff0000;
    public static inline var GREEN : ColorRGB = 0x00ff00;
    public static inline var BLUE : ColorRGB = 0x0000ff;
    public static inline var CYAN : ColorRGB = 0x00ffff;
    public static inline var MAGENTA : ColorRGB = 0xff00ff;
    public static inline var YELLOW : ColorRGB = 0xffff00;
    
    /**
     * Performs implicit casting from an RGB hex string to a color.
     * @param   argb    RGB hex string
     * @return  Color based on hex string
     */
    @:from public static inline function fromString(argb : String) : ColorRGB {
        return new ColorRGB(Std.parseInt(argb));
    }
    
    /**
     * Creates a new color from integer color components.
     * @param   r   Red channel value
     * @param   g   Green channel value
     * @param   b   Blue channel value
     * @return  Color based on color components
     */
    public static inline function fromRGBi(r : Int, g : Int, b : Int) : ColorRGB {
        return new ColorRGB(((r << 16) | (g << 8) | b));
    }
    
    /**
     * Creates a new color from floating point color components.
     * @param   r   Red channel value
     * @param   g   Green channel value
     * @param   b   Blue channel value
     * @return  Color based on color components
     */
    public static inline function fromRGBf(r : Float, g : Float, b : Float) : ColorRGB {
        return fromRGBi(Std.int(r * 255), Std.int(g * 255), Std.int(b * 255));
    }
    
    /**
     * Constructs a new color.
     * @param   rgb    Color formatted as RGB integer
     */
    inline function new(rgb : Int) this = rgb;
    
    /**
     * Integer color channel getters and setters.
     */

    public var ri(get, set) : Int;
    inline function get_ri() return (this >> 16) & 0xff;
    inline function set_ri(ri : Int) { this = fromRGBi(ri, gi, bi); return ri; }
    
    public var gi(get, set) : Int;
    inline function get_gi() return (this >> 8) & 0xff;
    inline function set_gi(gi : Int) { this = fromRGBi(ri, gi, bi); return gi; }
    
    public var bi(get, set) : Int;
    inline function get_bi() return this & 0xff;
    inline function set_bi(bi : Int) { this = fromRGBi(ri, gi, bi); return bi; }
    
    /**
     * Floating point color channel getters and setters.
     */

    public var rf(get, set) : Float;
    inline function get_rf() return ri / 255;
    inline function set_rf(rf : Float) { this = fromRGBf(rf, gf, bf); return rf; }
    
    public var gf(get, set) : Float;
    inline function get_gf() return gi / 255;
    inline function set_gf(gf : Float) { this = fromRGBf(rf, gf, bf); return gf; }
    
    public var bf(get, set) : Float;
    inline function get_bf() return bi / 255;
    inline function set_bf(bf : Float) { this = fromRGBf(rf, gf, bf); return bf; }
	
	public function toHtmlColor():String
	{
		trace("#" + Std.string(this));
		return "#" + Std.string(this);
	}
}