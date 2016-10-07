local function newBoneData(data,scale)
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


local function getBonesData(skeleton,data)
	local boneByOrder = {}
	local boneByName = {}
	local scale = skeleton.scale
	for i,bonedata in ipairs(data) do
		local bone = newBoneData(bonedata,scale)
		bone.parent = bone.parentName and boneByName[bone.parentName]
		boneByName[bone.name] = bone
		boneByOrder[#boneByOrder+1] = bone
	end
	skeleton.bones = boneByOrder
	skeleton.boneNameIndices = boneByName
end

local function getIkData(skeleton,data)
	for i,ikMap in ipairs(data) do
		local ikData = {}
		ikData.name = ikMap.name
		ikData.bones = {}
		for i,boneName in ipairs(ikMap.bones) do
			local bone = skeleton.boneNameIndices[boneName]
			table.insert(ikData.bones,bone)
		end
		ikData.target = skeleton.boneNameIndices[ikMap.target]
		ikData.bendDirection = ikMap.bendPositive == false and -1 or 1
		ikData.mix = ikMap.mix or 1
	end
end

local function getColor(color)
	if not color then return end
	return 	{r = tonumber(color:sub(1, 2), 16) / 255,
			g= tonumber(color:sub(3, 4), 16) / 255,
			b=tonumber(color:sub(5, 6), 16) / 255,
			a=tonumber(color:sub(7, 8), 16) / 255}

end

local function getSlotData(skeleton,data)
	for i,slotMap in ipairs(data) do
		local slotData = {}
		slotData.name = slotMap.name
		slotData.boneData = skeleton.boneNameIndices[slotMap.bone]
		slotData.color = getColor(slotMap.color)
		slotData.attachmentName = slotMap.attachment
		slotData.blendMode = slotMap.blendMode or "alpha"
		skeleton.slots[#skeleton.slots+1] = slotData
		skeleton.slotNameIndices[slotData.name] = slotData
	end
end

local function getSkinData(skeleton,data)
	for name,map in pairs(data) do
		print(k,v)
	end

end