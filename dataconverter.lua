local Skeleton = require "class/skeleton"

return function(rawData,scale)
	scale = scale or 1
	local data = {}
	local skeleton = Skeleton(rawData.skeleton)
	skeleton.scale = scale
	skeleton.bones = Bones(skeleton,rawData.bone).boneByOrder


	return data
end