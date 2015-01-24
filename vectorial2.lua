--[[   
   vectorial2.lua ver 0.2 - A library for 2D vectors.
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
      module.Vector2D = function (ix, iy)
	local v2d = {}
	      v2d.v = {}
	      v2d.v.x = ix
	      v2d.v.y = iy
	      mt ={} --Metatable
	
	function v2d:deepcopy(orig) --Deeply copy a table. This is for the operation metatables.
    		local orig_type = type(orig)
    		local copy
    		if orig_type == 'table' then
        		copy = {}
        		for orig_key, orig_value in next, orig, nil do
            			copy[self:deepcopy(orig_key)] = self:deepcopy(orig_value)
        		end
        		setmetatable(copy, self:deepcopy(getmetatable(orig)))
   		else -- number, string, boolean, etc
        		copy = orig
    		end
    		return copy
	end
	

	--Comparisons

	v2d.__eq = function(lhs, rhs)
		--Equal To operator for vector2Ds
		return (lhs.getX() == rhs.getX()) and (lhs.getY() == rhs.getY())
	end
	
	v2d.__lt = function(lhs, rhs)
		--Less Than operator for vector2Ds
		return (sqrt((lhs.getX()^2) + (lhs.getY()^2)) < sqrt((rhs.getX()^2) + (rhs.getY()^2)))
	end
	
	v2d.__le = function(lhs, rhs)
		--Less Than Or Equal To operator for vector2Ds
		return (sqrt((lhs.getX()^2) + (lhs.getY()^2)) <= sqrt((rhs.getX()^2) + (rhs.getY()^2)))
	end
	
	--Operations
	
	function v2d:setX(x)
		self.v.x = x
	end
	
	function v2d:setY(y)
		self.v.y = y
	end

	function v2d:getX()
		return self.v.x
	end
	
	function v2d:getY()
		return self.v.y
	end
	
	mt.__unm = function(rhs)
		--Unary Minus (negation) operator for Vector2Ds
		out = rhs:deepcopy(rhs) --Copy the operand for the output (else the output won't have metamethods)
		out:setX(-rhs:getX()) --Operate on the X property
		out:setY(-rhs:getY()) --Operate on the Y property
		return out
	end
	
	mt.__add = function(lhs, rhs)
		--Addition operator for Vector2Ds
		out = lhs:deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out:setX(lhs:getX() + rhs:getX()) --Operate on the X property
		out:setY(lhs:getY() + rhs:getY()) --Operate on the Y property
		return out
	end

	mt.__sub = function(lhs, rhs)
		--Subtraction operator for Vector2Ds
		out = lhs:deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out:setX(lhs:getX() - rhs:getX()) --Operate on the X property
		out:setY(lhs:getY() - rhs:getY()) --Operate on the Y property
		return out
	end

	mt.__mul = function(lhs, rhs)
		--Multiplication operator for Vector2Ds
		out = lhs:deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out:setX(lhs:getX() * rhs:getX()) --Operate on the X property
		out:setY(lhs:getY() * rhs:getY()) --Operate on the Y property
		return out
	end

	mt.__div = function(lhs, rhs)
		--Division operator for Vector2Ds
		out = lhs:deepcopy(lhs)--Copy the operand for the output (else the output won't have metamethods)
		out:setX(lhs:getX() / rhs:getX()) --Operate on the X property
		out:setY(lhs:getY() / rhs:getY()) --Operate on the Y property
		return out
	end
	
	mt.__mod = function(lhs, rhs)
		--Vector distance operator for Vector2Ds. Denoted by modulo (%)
		out = lhs:deepcopy(lhs)		--Copy the operand for the output (else the output won't have metamethods)
		out:setX(math.abs(rhs:getX() - lhs:getX())) --Operate on the X property
		out:setY(math.abs(rhs:getY() - lhs:getY())) --Operate on the Y property
		return out	
	end

	mt.__concat = function(lhs, rhs)
		--Linear distance operator for Vector2Ds. Denoted by concat (..)
		out = 0		--This is a linear operation, so no deepcopy. 
		out = math.sqrt((lhs:getX() - rhs:getX()) + (rhs:getY() - lhs:getY())) --Distance formula
		return out
	end

	mt.__tostring = function(self)
		--tostring handler for Vector2D
		out = ""	--This is a string operation, so no deepcopy.
		out = "[(X:"..self:getX().."),(Y:"..self:getY()..")]"
		return out
	end

	setmetatable(v2d, mt)

	return v2d
end
return module
