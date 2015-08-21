# Vectorial
A Lua library for easy, intuitive 2D and 3D vectors. `vectorial2.lua` and `vectorial3.lua`, respecitvely, serve as definitions for instantiation of and operations on 2D and 3D vector quantities.

WARNING: Behavior of this library is not entirely stable. Pick a release and use it.

Current stable release is: *0.2*

## Usage
To use a vector library, simply `require "vectorial2"` or `require "vectorial3"` into a variable, i.e., `v2d = require "vectorial2"`.

You can now create vectors with, for example, `a = v2d.Vector2D(2, 3)` will create the 2D vector (2,3), and `c = v3d.Vector3D(2, 3, 4)` will create the 3D vector (2,3,4).

You can retrieve the values of vector components with, for example, `a:getX()` (which, in our example, would return 2). You can set values in a similar way: for example, `a:setX(3)` will make `a` equal to (3,3). A construction like `a:setX(a:getX() + 2)` would add 2 to a's x component.

Operations on vectors are fairly intuitive. For example, if `a` and `b` are the 2D vectors (1,1) and (2,3), then `a + b` is equal to (3,4), `a - b` is equal to (-1,-2), and `a / b` is equal to (0.5, 0.333...). The unary minus works as well; `-b` equals (-2,-3).

Comparisons work intuitively as well. `a == b` will return false, but if we had `c = Vector2D(1,1)` then `a == c` will return true. `a > b` is false, as is `a > c` (since they are equal). `a < b` will return true, as will `a <= c` (again, since they are equal).

There are two exceptions. The modulo operator (%) is defined as caluclating vector distance; so `a % b` is equal to (1,2). The concatenation operator (..) is defined as linear distance, so `a .. b` is equal to 1. 

Using `tostring()` works as well, so `tostring(a)` would return `[(X:2),(Y:3)]`.

All of these work similarly for 3D vectors.

Angles can be obtained with `:getAngle()`. `v2d:getAngle()` returns the angle of the vector in radians. `v3d:getAngle()` returns TWO values: "heading" and "carom". Heading is the angle of the X and Y components, while carom is the angle of the Z component to the X/Y plane.

Length (distance from the origin) can be obtained with `v2d:getLength()`. It works identically for 2D vectors and 3D vectors.

Averaging is implemented, as well - this is especially useful for finding the center of a large number of points. Simply pass `v2d.average()` or `v3d.average()` an array of vectors, and you'll get one vector back.

## Advanced Usage

(Almost) all operations on Vectorial vectors return Vectorial vectors. So, for example, to get the angle between two Vector2Ds a and b, one could simply use `d = (a - b):getAngle()`.

## Roadmap
We are planning to add

* Arbitrary precision support (this may end up being a fork for various reasons)
* Transformations (translate, stretch, shrink, rotate)
* Tables of vectors with their own methods for retrieving, reordering, transforming, and operating on all or some subset of the vectors they contain.
* N-dimensional vectors

though probably not in that order.
