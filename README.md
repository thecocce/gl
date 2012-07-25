# Graphics library (gl)
Includes a fast [vector rendering system](http://lab.polygonal.de/?p=916) based on the FP10 drawing API capable of drawing outline fonts *without* embedding any external resources. This allows high quality, extra-smooth font rendering that can be seamlessly integrated into the rendering pipeline.

## Installation
Install [Haxe](http://haxe.org/download) and run `$ haxelib install polygonal-gl` from the console.
This installs the polygonal-gl library hosted on [lib.haxe.org](http://lib.haxe.org/p/polygonal-gl), which always mirrors the git master branch. From now on just compile with `$ haxe ... -lib polygonal-gl`.
If you want to test the latest beta build, you should pull the dev branch and add the src folder to the classpath via `$ haxe ... -cp src`.

## Changelog

### 1.03 (released 2011-07-17)

 * fixed: don't snap to integer coordinates when drawing centered proportional text
 * modified: minor optimizations

### 1.02 (released 2010-12-12)

 * fixed: ColorMatrix.colorize()
 * fixed: VectorRenderer#polyLineVector()
 * fixed: VectorRenderer: GraphicsPathWinding had no effect when GraphicsPath pool was used
 * modified: VectorRenderer: minor API changes
 * modified: VectorRenderer: minor optimization: skip arrowhead drawing if size equals zero
 * modified: VectorRenderer#arc(): added resume parameter (skips initial moveTo() command)
 * added: VectorRenderer#setComplexLineStyle()
 * added: VectorRenderer#ssl(): draws a swept-sphere line (capsule)
 * added: VectorRenderer#ssr(): draws a swept-sphere rectangle (rounded rectangle)
 * added: VectorRenderer#ssp(): draws a swept-sphere polygon
 * added: VectorRenderer#dashedLine() : draws a dashed line
 * added: VectorRenderer#poly() : draws a polygon
 * added: RasterRenderer class
 * added: MonospaceBitmapFont
 * added: ProggyOptiS (monospace bitmap font)
 * fixed: VectorRenderer: grid drawing
 * modified: VectorRenderer: improved object pooling
 * added: PF Ronda Seven pixel font

### 1.01 (released 2010-04-08)

 * fixed: VectorFont: adaption for new [MemoryManager](http://lab.polygonal.de/?p=1230)
 * fixed: VectorFont: now computes correct bounds for whitespace characters
 * modified: VectorFont: multiple instances of the same font now share a single spacing/kerning/bounds table for smaller memory footprint
 * modified: VectorFont: performance improvements at compile time and run time
 * modified: VectorFont: faster font decoding when compiled with -debug
 * modified: VectorFont: added basic tabulator support (VectorFont.tabSize)
 * modified: VectorFont: VectorFont.write() computes bounding box from written characters on the fly
 * modified: automatically sets native font size for pixel fonts upon instantiation.
 * code style: VectorFont.setPointSize() is now a getter/setter named size
 * modified: VectorFont: improved performance by adding an object pool for Vector/GraphicsPath objects (optional)
 * fixed: VectorRenderer.drawPolyLine()
 * fixed: VectorRenderer.bezier8() when compiled with -D no_alchemy
 * fixed: VectorRenderer correct plane drawing for parallel planes.
 * modified: all vector fonts are now compatible with -D no_alchemy
 * modified: VectorRenderer: supports drawing OBB's and grids

### 1.0 (released 2009-12-14)

 * Initial version.