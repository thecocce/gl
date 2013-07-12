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
using de.polygonal.core.math.Mathematics;

class ColorXForm
{
	inline static var INV_FF = 0.00392156862745098;
	
	inline public static function lerp(a:ColorXForm, b:ColorXForm, alpha:Float, output:ColorXForm):ColorXForm
	{
		var oneMinusAlpha = 1 - alpha, t, u, v;
		
		t = a.multiplier;
		u = b.multiplier;
		v = output.multiplier;
		v.x = t.x * oneMinusAlpha + u.x * alpha;
		v.y = t.y * oneMinusAlpha + u.y * alpha;
		v.z = t.z * oneMinusAlpha + u.z * alpha;
		v.w = t.w * oneMinusAlpha + u.w * alpha;
		
		t = a.offset;
		u = b.offset;
		v = output.offset;
		v.x = t.x * oneMinusAlpha + u.x * alpha;
		v.y = t.y * oneMinusAlpha + u.y * alpha;
		v.z = t.z * oneMinusAlpha + u.z * alpha;
		v.w = t.w * oneMinusAlpha + u.w * alpha;
		return output;		
	}
	
	inline public static function concat(a:ColorXForm, b:ColorXForm, output:ColorXForm):ColorXForm
	{
		Vec3.add(a.multiplier, b.multiplier, output.multiplier);
		return output;
	}
	
	public var multiplier(default, null):ColorRGBA;
	public var offset(default, null):ColorRGBA;
	
	public function new(redMultiplier = 1., greenMultiplier = 1., blueMultiplier = 1., alphaMultiplier = 1.,
		redOffset = 0., greenOffset = 0.0, blueOffset = 0., alphaOffset = 0.)
	{
		multiplier = new ColorRGBA(redMultiplier, greenMultiplier, blueMultiplier, alphaMultiplier);
		offset = new ColorRGBA(redOffset, greenOffset, blueOffset, alphaOffset);
	}
	
	public function free()
	{
		multiplier = null;
		offset = null;
	}
	
	inline public function setMultiplier(rgb:Float, alpha = -1.)
	{
		var t = multiplier;
		t.x = rgb;
		t.y = rgb;
		t.z = rgb;
		if (alpha != -1) t.w = alpha;
	}
	
	inline public function setOffset(rgb:Float, alpha = -1.)
	{
		var t = offset;
		t.x = rgb;
		t.y = rgb;
		t.z = rgb;
		if (alpha != -1) t.w = alpha;
	}
	
	/**
	 * @param color tinting color in the 0xRRGGBB format.
	 * @param percent percentage to apply the tint color in <arg>&#091;0, 1&#093;</arg>.
	 */
	inline public function setTint(color:Int, percent:Float)
	{
		var oneMinusMultiplier = 1. - percent;
		setMultiplier(oneMinusMultiplier);
		offset.x = Std.int(color.getR() * percent);
		offset.y = Std.int(color.getG() * percent);
		offset.z = Std.int(color.getB() * percent);
	}
	
	/**
	 * @param x the brightness value in <arg>&#091;-1, 1&#093;</arg>.
	 */
	inline public function setBrightness(x:Float)
	{
		x = x.fclamp(-1, 1);
		setMultiplier(1 - x.fabs());
		setOffset(x > 0 ? x * 255 : 0);
	}
	
	/**
	 * Apply this color transformation to the given <code>color</code>.
	 */
	inline public function transform(color:ColorRGBA):ColorRGBA
	{
		var m = multiplier;
		var o = offset;
		color.x = color.x * m.x + o.x * INV_FF;
		color.y = color.y * m.y + o.y * INV_FF;
		color.z = color.z * m.z + o.z * INV_FF;
		color.w = color.w * m.w + o.w * INV_FF;
		return color;
	}
	
	/**
	 * Apply this color transformation to the given <code>color</code> in 0xAARRGGBB format.
	 */
	inline public function transformRGBA(color:Int):Int
	{
		var m = multiplier;
		var o = offset;
		return RGBA.ofFloat4
		(
			(color.getR() * m.x + o.x) * INV_FF,
			(color.getG() * m.y + o.y) * INV_FF,
			(color.getB() * m.z + o.z) * INV_FF,
			(color.getA() * m.w + o.w) * INV_FF
		);
	}
}