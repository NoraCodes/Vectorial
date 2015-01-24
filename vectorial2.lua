--[[   
   vectorial2.lua - A library for 2D vectors.
   Copyright (C) 2015 Leo Tindall

   ---
    All operators work as expected except modulo (%) which is vector distance and concat (..) which is linear distance.
   ---

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
local module = {}
local module.Vector2D = function (x, y)
	local v2d = {}
	      v2d.v = {x, y}
	
	function v2d.deepcopy(orig) --Deeply copy a table. This is for the operation metatables.
    		local orig_type = type(orig)
    		local copy
    		if orig_type == 'table' then
        		copy = {}
        		for orig_key, orig_value in next, orig, nil do
            			copy[deepcopy(orig_key)] = deepcopy(orig_value)
        		end
        		setmetatable(copy, deepcopy(getmetatable(orig)))
   		else -- number, string, boolean, etc
        		copy = orig
    		end
    		return copy
	end
	

	--Comparisons

	v2d.__eq = function(lhs, rhs)
		--Equal To operator for vector2Ds
		return (lhs.x == rhs.x) and (lhs.y == rhs.y)
	end
	
	v2d.__lt = function(lhs, rhs)
		--Less Than operator for vector2Ds
		return (lhs.x < rhs.x) and (lhs.y < rhs.y)
	end
	
	v2d.__le = function(lhs, rhs)
		--Less Than Or Equal To operator for vector2Ds
		return (lhs.x <= rhs.x) and (lhs.y <= rhs.y)
	end
	
	--Operations
	
	v2d:setX = function (x)
		self.x = x
	end
	
	v2d:setY = function (y)
		self.y = y
	end

	v2d:getX = function ()
		return self.x
	end
	
	v2d:getY = function ()
		return self.y
	end
	
	v2d.__unm = function(rhs)
		--Unary Minus (negation) operator for Vector2Ds
		out = rhs.deepcopy(rhs) --Copy the operand for the output (else the output won't have metamethods)
		out.setX(-rhs.getX()) --Operate on the X property
		out.setY(-rhs.getY()) --Operate on the Y property
		return out
	end
	
	v2d.__add = function(lhs, rhs)
		--Addition operator for Vector2Ds
		out = lhs.deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out.setX(lhs.getX() + rhs.getX()) --Operate on the X property
		out.setY(lhs.getY() + rhs.getY()) --Operate on the Y property
		return out
	end

	v2d.__sub = function(lhs, rhs)
		--Subtraction operator for Vector2Ds
		out = lhs.deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out.setX(lhs.getX() - rhs.getX()) --Operate on the X property
		out.setY(lhs.getY() - rhs.getY()) --Operate on the Y property
		return out
	end

	v2d.__mul = function(lhs, rhs)
		--Multiplication operator for Vector2Ds
		out = lhs.deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out.setX(lhs.getX() * rhs.getX()) --Operate on the X property
		out.setY(lhs.getY() * rhs.getY()) --Operate on the Y property
		return out
	end

	v2d.__div = function(lhs, rhs)
		--Division operator for Vector2Ds
		out = lhs.deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out.setX(lhs.getX() / rhs.getX()) --Operate on the X property
		out.setY(lhs.getY() / rhs.getY()) --Operate on the Y property
		return out
	end
	
	v2d.__mod = function(lhs, rhs)
		--Vector distance operator for Vector2Ds. Denoted by modulo (%)
		out = lhs.deepcopy(lhs)		--Copy the operand for the output (else the output won't have metamethods)
		out.setX(math.abs(rhs.getX() - lhs.getX())) --Operate on the X property
		out.setY(math.abs(rhs.getY() - lhs.getY())) --Operate on the Y property
		return out	
	end

	v2d.__concat = function(lhs, rhs)
		--Linear distance operator for Vector2Ds. Denoted by concat (..)
		out = 0		--This is a linear operation, so no deepcopy. 
		out = math.sqrt((lhs.getX() - rhs.getX()) + (rhs.getY() - lhs.getY())) --Distance formula
		return out
	end

	v2d.__tostring = function(self)
		--tostring handler for Vector2D
		out = ""	--This is a string operation, so no deepcopy.
		out = "[(X:"..self:getX().."),(Y:"..self:getY()..")]"
		return out
	end

	return v2d
end
return module
