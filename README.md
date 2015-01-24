# Vectorial
A Lua library for easy, intuitive 2D and 3D vectors.

# Usage
To use a vector library, simply `require "vectorial2"` or `require "vectorial3"` into a variable, i.e., `v2d = require "vectorial2"`.

You can now create vectors with, for example, `a = v2d.Vector2D(2, 3)` will create the 2D vector (2,3), and `c = v3d.Vector3D(2, 3, 4)` will create the 3D vector (2,3,4).

Operations on vectors are fairly intuitive. For example, if `a` and `b` are the 2D vectors (1,1) and (2,3), then `a + b` is equal to (3,4), `a - b` is equal to (-1,-2), and `a / b` is equal to (0.5, 0.333...). The unary minus works as well; `-b` equals (-2,-3). 

There are two exceptions. The modulo operator (%) is defined as caluclating vector distance; so `a % b` is equal to (1,2). The concatenation operator (..) is defined as linear distance, so `a .. b` is equal to 1. 

All of these work similarly for 3D vectors.
