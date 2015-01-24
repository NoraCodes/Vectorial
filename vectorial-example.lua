--[[   
   vectorial-example.lua - A demonstration of my libraries for 3D and 2D vectors.
   Copyright (C) 2015 Leo Tindall

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
]]

v2d = require "vectorial2"
v3d = require "vectorial3"

--Create some Vectors (2D and 3D)
a = v2d.Vector2D(10, 7)
b = v2d.Vector2D(5, 15)
c = v3d.Vector3D(5, 6, 7)
d = v3d.Vector3D(8, 7, 6)

print("A: " .. tostring(a) .."\tB: ".. tostring(b) .. "\n\nC: " .. tostring(c) .. "\tD: " .. tostring(d))
print("\nAdding vectors:")
print(tostring(a + b) .. "\n" .. tostring(c + d))
print("\nSubtracting vectors:")
print(tostring(a - b) .. "\n" .. tostring(c - d))
print("\nMultiplying vectors:")
print(tostring(a * b) .. "\n" .. tostring(c * d))
print("\nDividing vectors:")
print(tostring(a / b) .. "\n" .. tostring(c / d))
print("\nVector distance:")
print(tostring(a % b) .. "\n" .. tostring(c % d))
print("\nLinear distance:")
print(tostring(a .. b) .. "\n" .. tostring(c .. d))

