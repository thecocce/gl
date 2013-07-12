/*
 *                            _/                                                    _/
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/
 *   _/                            _/        _/
 *  _/                        _/_/      _/_/
 *
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.gl.color;

using de.polygonal.core.math.Mathematics;

#if (cpp || js)
private typedef UInt = Int;
#end

/**
 * <p>Helper class for working with the RGBA color space in the 0xAARRGGBB format.</p>
 * <p>The byte order for each channel when stored in little-endian is BGRA (left = least significant byte).</p>
 */
class RGBA
{
	inline public static function getA(rgba:UInt):UInt        { return rgba >>> 24; }
	inline public static function setA(rgba:UInt, x:Int):UInt { return (x << 24) | (rgba & 0x00ffffff); }
	
	inline public static function getR(rgba:UInt):UInt        { return rgba >> 16 & 0xff; }
	inline public static function setR(rgba:UInt, x:Int):UInt { return (x << 16) | (rgba & 0xff00ffff); }
	
	inline public static function getG(rgba:UInt):UInt        { return rgba >> 8 & 0xff; }
	inline public static function setG(rgba:UInt, x:Int):UInt { return (x << 8) | (rgba & 0xffff00ff); }
	
	inline public static function getB(rgba:UInt):UInt        { return rgba & 0xff; }
	inline public static function setB(rgba:UInt, x:Int):UInt { return x | (rgba & 0xffffff00); }
	
	inline public static function getRGB(rgba:UInt):UInt        { return rgba & 0x00ffffff; }
	inline public static function setRGB(rgba:UInt, x:Int):UInt { return x | rgba; }
	
	inline public static function ofInt3(r:Int, g:Int, b:Int):Int { return r << 16 | g << 8 | b; }
	
	inline public static function ofInt4(r:Int, g:Int, b:Int, a:Int):UInt { return a << 24 | r << 16 | g << 8 | b; }
	
	inline public static function ofFloat3(r:Float, g:Float, b:Float):Int
	{
		return ofInt3(
			Std.int(r.fclamp(0, 1) * 0xff),
			Std.int(g.fclamp(0, 1) * 0xff),
			Std.int(b.fclamp(0, 1) * 0xff));
	}
	
	inline public static function ofFloat4(r:Float, g:Float, b:Float, a:Float):UInt
	{
		return ofInt4(
			Std.int(r.fclamp(0, 1) * 0xff),
			Std.int(g.fclamp(0, 1) * 0xff),
			Std.int(b.fclamp(0, 1) * 0xff),
			Std.int(a.fclamp(0, 1) * 0xff));
	}
	
	inline public static function lerpInt(a:UInt, b:UInt, alpha:Float):UInt
	{
		var oneMinusAlpha = 1 - alpha;
		return ofInt4
		(
			Std.int(getA(a) * oneMinusAlpha + getA(b) * alpha),
			Std.int(getR(a) * oneMinusAlpha + getR(b) * alpha),
			Std.int(getG(a) * oneMinusAlpha + getG(b) * alpha),
			Std.int(getB(a) * oneMinusAlpha + getB(b) * alpha)
		);
	}
}