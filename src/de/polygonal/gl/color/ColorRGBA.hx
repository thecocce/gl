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

import de.polygonal.core.math.Vec3;

using de.polygonal.gl.color.RGBA;

#if (cpp || js)
private typedef UInt = Int;
#end

class ColorRGBA extends Vec3
{
	inline public static function ofInt(x:Int):ColorRGBA
	{
		return new ColorRGBA(x.getR(), x.getG(), x.getB(), x.getA());
	}
	
	inline public static function toInt(x:ColorRGBA):UInt
	{
		return RGBA.ofFloat4(x.r, x.g, x.b, x.a);
	}
	
	public function new(r = 0., g = 0., b = 0., a = 1.)
	{
		super(r, g, b, a);
	}
	
	inline public function set3(r:Float, g:Float, b:Float):Void
	{
		x = r;
		y = g;
		z = b;
	}
	
	inline public function set4(r:Float, g:Float, b:Float, a:Float):Void
	{
		x = r;
		y = g;
		z = b;
		w = a;
	}
	
	public var r(get_r, set_r):Float;
	inline function get_r():Float
	{
		return x;
	}
	inline function set_r(value:Float):Float
	{
		return x = value;
	}
	
	public var g(get_g, set_g):Float;
	inline function get_g():Float
	{
		return y;
	}
	inline function set_g(value:Float):Float
	{
		return y = value;
	}
	
	public var b(get_b, set_b):Float;
	inline function get_b():Float
	{
		return z;
	}
	inline function set_b(value:Float):Float
	{
		return z = value;
	}
	
	public var a(get_a, set_a):Float;
	inline function get_a():Float
	{
		return w;
	}
	inline function set_a(value:Float):Float
	{
		return w = value;
	}
}