local bones = Class("bones")

local function newBone(data)
	return {
		name = data.name,
		parentName = data.parent,
		length = 0,
		x = 0, y = 0,
		rotation = 0,
		scaleX = 1, scaleY = 1,
		inheritScale = true,
		inheritRotation = true
	}
end


function bones:init(skeleton,data)
	self.skeleton = skeleton
	self.boneByOrder = {}
	for i,bonedata in ipairs(data) do
		local bone = newBone(bonedata,skeleton.scale)
		bone.parent = bone.parentName and self.boneByName[bone.parentName]
		self.boneByNamep[bone.name] = bone
		self.boneByOrder[#self.boneByOrder+1] = bone
	end
end

function bones:newBone(data,scale)
	return {
		name = data.name,
		parent = data.parent,
		length = (data.length) or 0 * scale,
		x = (data.x or 0)*scale, 
		y = (data.y or 0)*scale,
		rotation = data.rotation or 0,
		scaleX = data.scaleX or 1,
		scaleY = data.scaleY or 1,
		inheritScale = data.inheritScale == false and false or true,
		inheritRotation = data.inheritRotation == false and false or true
	}

end

return bones