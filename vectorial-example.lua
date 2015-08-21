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
print("2D: " .. tostring(a .. b) .. "\n3D: " .. tostring(c .. d))

print("\n2D Angles:")
print("A: " .. tostring(a:getAngle()) .. " radians")
print("\n3D Angles:")
hdg, crm = c:getAngle()
print("C: (hdg)" .. hdg .." | (crm)" .. crm .. " radians")
print("\nLength:")
print("A: " .. tostring(a:getLength()), "C: " .. tostring(c:getLength()))

a = v2d.Vector2D(3, 5)
b = v2d.Vector2D(-3, 5)
c = v2d.Vector2D(3, -5)
d = v2d.Vector2D(-3, -5)
print("\nAveraging 2D vectors:")
print("A: " .. tostring(a) .."\tB: ".. tostring(b) .. "\nC: " .. tostring(c) .. "\tD: " .. tostring(d))
v = v2d.average({a,b,c,d})
print("Avg:" .. tostring(v))

a = v3d.Vector3D(3, 5, 7)
b = v3d.Vector3D(-3, 5, 7)
c = v3d.Vector3D(3, -5, -7)
d = v3d.Vector3D(-3, -5, -7)
print("\nAveraging 3D vectors:")
print("A: " .. tostring(a) .."\tB: ".. tostring(b) .. "\nC: " .. tostring(c) .. "\tD: " .. tostring(d))
v = v3d.average({a,b,c,d})
print("Avg:" .. tostring(v))



