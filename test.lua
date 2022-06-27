-- for k, v in pairs(_G) do
-- 	print(k,v)
-- end

local cnf ={
	[1] = {
		id = 1,
		rechargeReq = {0,4000},
		replacementRatio = 5,
	},
	[2] = {
		id = 2,
		rechargeReq = {4000,10000},
		replacementRatio = 4,
	},
	[3] = {
		id = 3,
		rechargeReq = {10000},
		replacementRatio = 3,
	},
}

local totalCharge = 100
local num = 0
local ret = totalCharge

local len = #cnf
for i = len, 1, -1 do
	local cnfItem = cnf[i]
	local minVal = cnfItem.rechargeReq[1]

	if ret > minVal then
		local diff = ret - minVal
		local addVal = diff * cnfItem.replacementRatio
		num = num + addVal
		ret = ret - diff

		print('diff: ', diff, 'addVal: ', addVal, 'ret: ', ret)
	end
end

print("补偿奖励数量：", num)
print('=======================')


local list = {101, 102, 103, 104, 105}

for _,v in pairs(list) do
	local formationIdx = math.modf(v / 100)
	dataPos = math.fmod(formationIdx, 100)
	print(dataPos)
end

-- local a = 1
-- local b = 2

-- local temp = a
-- 	  a = b
-- 	  b = temp

-- print('a:',a)
-- print('b:', b)

print('=================================')

local MultiFieldTransfer = 100
local map = {
	[101] = 1,
	[102] = 2,
	[103] = 3,

	[201] = 4,
	[202] = 5,
	[203] = 6,

	[301] = 7,
	[302] = 8,
	[303] = 9,
}

function InfoPos2DataPos(infoPos)
	-- 出战队伍索引
	local formationIdx = 1
	local dataPos = infoPos

	if infoPos > MultiFieldTransfer then
		formationIdx = math.modf(infoPos / MultiFieldTransfer)
		dataPos = math.fmod(infoPos, MultiFieldTransfer)
	end

	return dataPos, formationIdx
end

function DataPos2InfoPos(dataPos, formationIdx, notMulti)
	-- 不是多队伍
	if formationIdx == 1 and notMulti then
		formationIdx = 0
	end

	local infoPos = formationIdx * MultiFieldTransfer + dataPos

	return infoPos
end

function OnOneKeyChangeFormationTeam(teamId1, teamId2)
	local newMap = {}

    for idx, heroId in pairs(map) do
        local retIdx = idx
        local dataPos, formationIdx = InfoPos2DataPos(idx)

        if formationIdx == teamId1 then
	        retIdx = DataPos2InfoPos(dataPos, teamId2)
        end
        if formationIdx == teamId2 then
            retIdx = DataPos2InfoPos(dataPos, teamId1)
        end

        newMap[retIdx] = heroId
    end
    map = newMap
end

function Print(parma)
	for k,v in pairs(parma) do
		print(k,v)
	end
end

OnOneKeyChangeFormationTeam(1,2)
-- Print(map)

function Test1(...)
	local parma = {...}
	print(parma[2])
end

-- Test1({itemId = 1, num = 2}, 'sssss')


local randList = {1, 2, 3, 2, 3, 1}
for pos, v in pairs(randList) do
	print("pos: ", pos, "value: ", v)
end

randList[2] = nil

print('================')

for pos, v in pairs(randList) do
	print("pos: ", pos, "value: ", v)
end

randList = {}
print(randList[2])

-- local type = 20
-- local pos = 10

-- local offset = type * 100 + pos
-- print("offset: ", offset)

-- print("type: ", math.floor(offset/100))
-- print("pos: ", offset - math.floor(offset/100) * 100)

-- local mapTest = {
-- 	[1] = "ddd",
-- 	[2] = "ffff",
-- 	[3] = "lll",
-- }
-- print(#mapTest)

print('**************************************')

local openPosMap = {
	[1] = 5,
	[2] = 8,
	[3] = 1,
	[4] = 7,
	[5] = 5,
	[6] = 6,
	[7] = 3,
	[8] = nil,
	[9] = 1,
	-- [10] = 7,
	-- [11] = 8,
	-- [12] = nil,
	-- [13] = nil,
	-- [14] = nil,
	-- [15] = 6,
	-- [16] = 3,
}

table.remove(openPosMap, 8)
-- table.remove(openPosMap, 12)
-- table.remove(openPosMap, 13)
-- table.remove(openPosMap, 14)

for i,v in pairs(openPosMap) do
	print(i,v)
end
print("#openPosMap: ", #openPosMap)

local list = {}
for i=200,200-10 + 1,-1 do
	table.insert(list, i)
end

for k,v in pairs(list) do
	print(k,v)
end

print('------------------------')

function TablePrint(root)
	if root == nil then
		return
	end
	local cache = {  [root] = "." }
	local function _dump(t,space,name)
		local temp = {}
		for k,v in pairs(t) do
			local key = tostring(k)
			if cache[v] then
				table.insert(temp,"+" .. key .. " {" .. cache[v].."}")
			elseif type(v) == "table" then
				local new_key = name .. "." .. key
				cache[v] = new_key
				table.insert(temp,"+" .. key .. _dump(v,space .. (next(t,k) and "|" or " " ).. srep(" ",#key),new_key))
			else
				table.insert(temp,"+" .. key .. " [" .. tostring(v).."]")
			end
		end
		return table.concat(temp,"\n"..space)
	end
	print(_dump(root, "",""))
end

local config = {
	[1303901] = {
		[0] = {
			actItemIdx = 1303901,
			rewardId = 1675562,
		},
		[1] = {
			actItemIdx = 1303901,
			rewardId = 1675563,
		},
		[2] = {
			actItemIdx = 1303901,
			rewardId = 1675564,
		},
		[3] = {
			actItemIdx = 1303901,
			rewardId = 1675565,
		},
	},
}

config = config[1303901]

local rightCount = 0

-- local retCnf

-- local len = #config
-- for i = len, 1, -1 do
-- 	local cnfItem = config[i]
-- 	TablePrint(cnfItem)
-- 	if rightCount >= cnfItem.num then
-- 		retCnf = cnfItem
-- 		break
-- 	end
-- end

-- print(len)
-- TablePrint(retCnf)

print('=====================')
local retMap = {
	[1] = 1,
	[2] = 2,
	[3] = 3,
}

for i,v in pairs(retMap) do
	print(i,v)
end


if not 0 then
	print("fffffff")
end

local selectType = 3
-- if not selectType then
-- 	print('dddddddddd')
-- end

-- if selectType ~= 0 then
-- 	print('selectType ~= 0')
-- end

-- if selectType ~= 1 then
-- 	print('selectType ~= 1')
-- end

if not selectType and selectType ~= 0 and selectType ~= 1 then
	print("param error!")
end

print("0 or 1: ", 0 or 1)


print('*******************************')
local rings = {0,1,2,5,3,1,8}
for i,v in ipairs(rings) do
	print(i,v)
end

function GetNTotalRings(n)
	n = n or 1
	n = math.max(1, n)
	table.sort(rings, function(a, b)
		return a > b
	end)
	
	local totalRings = 0
	for i = 1, n, 1 do
		if rings[i] then
			totalRings = totalRings + rings[i]
		end
	end
	return totalRings
end

print("GetNTotalRings(7): ", GetNTotalRings(10))

