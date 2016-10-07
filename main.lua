require "util"
Class = require "middleclass"
local jsonpath = "spine-love/data/spineboy.json"
local dataStr = love.filesystem.read(jsonpath)
local converter = require "spine-love/spine-love/dkjson"
local rawData = converter.decode(dataStr)
local dataConverter = require "dataconverter"
local data = dataConverter(rawData)


