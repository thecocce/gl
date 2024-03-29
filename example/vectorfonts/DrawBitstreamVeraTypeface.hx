﻿/*
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
import de.polygonal.gl.text.VectorFont;
import de.polygonal.gl.VectorRenderer;
import de.polygonal.motor.geom.primitive.AABB2;

class DrawBitstreamVeraTypeface
{
	static function main():Void
	{
		var fontList = new Array<Class<VectorFont>>();
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSansBold);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSansBoldOblique);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSansMono);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSansMonoBold);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSansMonoBoldOblique);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSansMonoOblique);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSansOblique);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSerif);
		fontList.push(de.polygonal.gl.text.fonts.vera.BitstreamVeraSerifBold);
		
		var bound = new AABB2(20, 10, 20, 10);
		
		var vr = new VectorRenderer(1024, 1024);
		
		for (fontClass in fontList)
		{
			var f:VectorFont = Type.createInstance(fontClass, []);
			f.setRenderer(vr);
			f.size = 12;
			
			vr.clearStroke();
			vr.setFillColor();
			vr.fillStart();
			
			var x = bound.minX;
			var y = bound.maxY + f.size + 4;
			
			bound = f.writeCharSet(x, y, 1024);
			
			vr.fillEnd();
			
			vr.setLineStyle(0x00FF00, .5, 0);
			vr.aabb(bound);
		}
		
		vr.flush(flash.Lib.current.graphics);
	}
}