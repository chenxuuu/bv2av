--from python code: https://www.zhihu.com/question/381784377/answer/1099438784
local it = "fZodR9XQDSUm21yCkr6zBqiveYah8bt4xsWpHnJE7jL5VG3guMTKNPAwcF"
local tr = {}
for i=0,#it-1 do
    tr[it:sub(i+1,i+1)] = i
end
local s = {12, 11, 4, 9, 5, 7, 3, 10, 6, 8}
local xor = 177451812
local add = 8728348608

local function dec(x)
    local r = 0
    for i=1,6 do
        r = r + tr[x:sub(s[i],s[i])] * 58 ^ (i - 1)
    end
    return "av"..((r - add) ~ xor)
end

local function enc(x)
    local xt = (x ~ xor) + add
    local r = {"B", "V", "1", nil, nil, "4", nil, "1", nil, "7"}
    for i=1,6 do
        local lt = math.floor(xt/58^(i-1))%58
        r[s[i]] = it:sub(lt+1,lt+1)
    end
    return table.concat(r)
end

print(dec('BV17x411w7KC'))
print(dec('BV1Q541167Qg'))
print(dec('BV1mK4y1C7Bz'))
print(enc(170001))
print(enc(455017605))
print(enc(882584971))
