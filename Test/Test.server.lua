

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Collection = require(ReplicatedStorage.Collection)


local Queue = Collection.Queue.new()
local QueueFromTable = Collection.Queue.fromTable({5, 6, 7, 8})
