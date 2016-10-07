local skeleton = Class("skeleton")

function skeleton:init(data)
	self.version = data.spine
	self.hash = data.hash
	self.width = data.width or 0
	self.height = data.height or 0
	self.bones = {}
	self.boneNameIndices = {}
	self.slots = {}
	self.slotNameIndices = {}
	self.skins = {}
	self.events = {}
	self.animations = {}
	self.ikConstraints = {}
	self.defaultSkin = nil
end

function skeleton:findBone (boneName)
	if not boneName then error("boneName cannot be nil.", 2) end
	for i,bone in ipairs(self.bones) do
		if bone.name == boneName then return bone end
	end
	return nil
end

function skeleton:findBoneIndex (boneName)
	if not boneName then error("boneName cannot be nil.", 2) end
	for i,bone in ipairs(self.bones) do
		if bone.name == boneName then return i end
	end
	return -1
end

function skeleton:findSlot (slotName)
	if not slotName then error("slotName cannot be nil.", 2) end
	for i,slot in ipairs(self.slots) do
		if slot.name == slotName then return slot end
	end
	return nil
end

function skeleton:findSlotIndex (slotName)
	if not slotName then error("slotName cannot be nil.", 2) end
	return self.slotNameIndices[slotName] or -1
end

function skeleton:findSkin (skinName)
	if not skinName then error("skinName cannot be nil.", 2) end
	for i,skin in ipairs(self.skins) do
		if skin.name == skinName then return skin end
	end
	return nil
end

function skeleton:findEvent (eventName)
	if not eventName then error("eventName cannot be nil.", 2) end
	for i,event in ipairs(self.events) do
		if event.name == eventName then return event end
	end
	return nil
end

function skeleton:findAnimation (animationName)
	if not animationName then error("animationName cannot be nil.", 2) end
	for i,animation in ipairs(self.animations) do
		if animation.name == animationName then return animation end
	end
	return nil
end

function skeleton:findIkConstraint (ikConstraintName)
	if not ikConstraintName then error("ikConstraintName cannot be nil.", 2) end
	for i,ikConstraint in ipairs(self.ikConstraints) do
		if ikConstraint.name == ikConstraintName then return ikConstraint end
	end
	return nil
end

return skeleton