# Vectorial
A Lua library for easy, intuitive 2D and 3D vectors. `vectorial2.lua` and `vectorial3.lua`, respecitvely, serve as definitions for instantiation of and operations on 2D and 3D vector quantities.

WARNING: Behavior of this library is NOT stable!

# Usage
To use a vector library, simply `require "vectorial2"` or `require "vectorial3"` into a variable, i.e., `v2d = require "vectorial2"`.

You can now create vectors with, for example, `a = v2d.Vector2D(2, 3)` will create the 2D vector (2,3), and `c = v3d.Vector3D(2, 3, 4)` will create the 3D vector (2,3,4).

Operations on vectors are fairly intuitive. For example, if `a` and `b` are the 2D vectors (1,1) and (2,3), then `a + b` is equal to (3,4), `a - b` is equal to (-1,-2), and `a / b` is equal to (0.5, 0.333...). The unary minus works as well; `-b` equals (-2,-3).

Comparisons work intuitively as well. `a == b` will return false, but if we had `c = Vector2D(1,1)` then `a == c` will return true. `a > b` is false, as is `a > c` (since they are equal). `a < b` will return true, as will `a <= c` (again, since they are equal).

There are two exceptions. The modulo operator (%) is defined as caluclating vector distance; so `a % b` is equal to (1,2). The concatenation operator (..) is defined as linear distance, so `a .. b` is equal to 1. 

All of these work similarly for 3D vectors.
