type CircleShape <: Drawable
	ptr::Ptr{Void}
	_texture::Texture

	function CircleShape(ptr::Ptr{Void})
		c = new(ptr)
		finalizer(c, destroy)
		c
	end
end

function CircleShape()
	CircleShape(ccall(dlsym(libcsfml_graphics, :sfCircleShape_create), Ptr{Void}, ()))
end

function copy(shape::CircleShape)
	return CircleShape(ccall(dlsym(libcsfml_graphics, :sfCircleShape_copy), Ptr{Void}, (Ptr{Void},), shape.ptr))
end

function destroy(shape::CircleShape)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_destroy), Void, (Ptr{Void},), shape.ptr)
end

function set_position(shape::CircleShape, position::Vector2f)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setPosition), Void, (Ptr{Void}, Vector2f,), shape.ptr, position)
end

function set_rotation(shape::CircleShape, angle::Real)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setRotation), Void, (Ptr{Void}, Cfloat,), shape.ptr, angle)
end

function set_scale(shape::CircleShape, scale::Vector2f)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setScale), Void, (Ptr{Void}, Vector2f,), shape.ptr, scale)
end

function set_origin(shape::CircleShape, origin::Vector2f)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setOrigin), Void, (Ptr{Void}, Vector2f,), shape.ptr, origin)
end

function set_radius(shape::CircleShape, radius::Real)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setRadius), Void, (Ptr{Void}, Cfloat,), shape.ptr, radius)
end

function set_fillcolor(shape::CircleShape, color::Color)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setFillColor), Void, (Ptr{Void}, Color,), shape.ptr, color)
end

function set_outlinecolor(shape::CircleShape, color::Color)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setOutlineColor), Void, (Ptr{Void}, Color,), shape.ptr, color)
end

function set_outline_thickness(shape::CircleShape, thickness::Real)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setOutlineThickness), Void, (Ptr{Void}, Cfloat,), shape.ptr, thickness)
end

function get_origin(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getOrigin)), Vector2f, (Ptr{Void},), shape.ptr
end

function get_scale(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getScale), Vector2f, (Ptr{Void},), shape.ptr)
end

function get_rotation(shape::CircleShape)
	return Real(ccall(dlsym(libcsfml_graphics, :sfCircleShape_getRotation), Cfloat, (Ptr{Void},), shape.ptr))
end

function get_position(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getPosition), Vector2f, (Ptr{Void},), shape.ptr)
end

function get_radius(shape::CircleShape)
	return real(ccall(dlsym(libcsfml_graphics, :sfCircleShape_getRadius), Cfloat, (Ptr{Void},), shape.ptr))
end

function set_pointcount(shape::CircleShape, count::Int)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setPointCount), Void, (Ptr{Void}, Uint32,), shape.ptr, count)
end

function get_fillcolor(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getFillColor), Color, (Ptr{Void},), shape.ptr)
end

function get_outlinecolor(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getOutlineColor), Color, (Ptr{Void},), shape.ptr)
end

function get_outline_thickness(shape::CircleShape)
	return Real(ccall(dlsym(libcsfml_graphics, :sfCircleShape_getOutlineThickness), Cfloat, (Ptr{Void},), shape.ptr))
end

function get_pointcount(shape::CircleShape)
	return Int(ccall(dlsym(libcsfml_graphics, :sfCircleShape_getPointCount), Csize_t, (Ptr{Void},), shape.ptr))
end

function get_point(shape::CircleShape, index::Integer)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_getPoint), Vector2f, (Ptr{Void}, Csize_t), index)
end

function move(shape::CircleShape, offset::Vector2f)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_move), Void, (Ptr{Void}, Vector2f,), shape.ptr, offset)
end

function scale(shape::CircleShape, factors::Vector2f)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_scale), Void, (Ptr{Void}, Vector2f,), shape.ptr, factors)
end

function rotate(shape::CircleShape, angle::Real)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_rotate), Void, (Ptr{Void}, Cfloat,), shape.ptr, angle)
end

function set_texture(shape::CircleShape, texture::Texture)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setTexture), Void, (Ptr{Void}, Ptr{Void}, Int32,), shape.ptr, texture.ptr, false)
	shape._texture = texture
end

function set_texture_rect(shape::CircleShape, rect::IntRect)
	ccall(dlsym(libcsfml_graphics, :sfCircleShape_setTextureRect), Void, (Ptr{Void}, IntRect,), shape.ptr, rect)
end

function get_texture(shape::CircleShape)
	return Texture(call(dlsym(libcsfml_graphics, :sfCircleShape_getTexture), Ptr{Void}, (Ptr{Void},), shape.ptr))
end

function get_texture_rect(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getTextureRect), IntRect, (Ptr{Void},), shape.ptr)
end

function get_localbounds(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getLocalBounds), FloatRect, (Ptr{Void},), shape.ptr)
end

function get_globalbounds(shape::CircleShape)
	return ccall(dlsym(libcsfml_graphics, :sfCircleShape_getGlobalBounds), FloatRect, (Ptr{Void},), shape.ptr)
end

export CircleShape, set_position, set_radius, set_fillcolor, set_outlinecolor, move, get_position,
get_radius, set_origin, get_origin, get_fillcolor, get_outlinecolor, rotate, scale, copy, set_scale,
get_scale, set_rotation, get_rotation, get_localbounds, get_globalbounds, set_outline_thickness,
get_outline_thickness, get_pointcount, set_pointcount, get_texture_rect, get_texture, set_texture_rect, set_texture,
get_point
