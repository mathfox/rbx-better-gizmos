local Ray = {} :: RayImpl

function Ray:draw(from, direction, style)
	return self.arrow:draw(from, from + direction, style)
end
