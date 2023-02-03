net.log('[SMK] JL1 RESPAWN loading...')
net.send_chat('[SMK] JL1 RESPAWN loading...',true)

if not Group.getByName('地面-4') then
    mist.respawnGroup('地面-4', true)
end

if not Group.getByName('地面-8') then
    mist.respawnGroup('地面-8', true)
end

if not Group.getByName('地面-53') then
    mist.respawnGroup('地面-53', true)
end

if not Group.getByName('地面-101') then
    mist.respawnGroup('地面-101', true)
end

if not Group.getByName('地面-12') then
    mist.respawnGroup('地面-12', true)
end

if not Group.getByName('地面-13') then
    mist.respawnGroup('地面-13', true)
end

if not Group.getByName('地面-52') then
    mist.respawnGroup('地面-52', true)
end
---
if not Group.getByName('aaa') then
    mist.respawnGroup('aaa', true)
end

if not Group.getByName('红外防空') then
    mist.respawnGroup('红外防空', true)
end

if not Group.getByName('针s') then
    mist.respawnGroup('针s', true)
end

if not Group.getByName('police') then
    mist.respawnGroup('police', true)
end

if not Group.getByName('police-1') then
    mist.respawnGroup('police-1', true)
end

if not Group.getByName('police-2') then
    mist.respawnGroup('police-2', true)
end

if not Group.getByName('BVR blue') then
    mist.respawnGroup('BVR blue', true)
end

if not Group.getByName('BVR blue-1') then
    mist.respawnGroup('BVR blue-1', true)
end

if not Group.getByName('BVR blue-2') then
    mist.respawnGroup('BVR blue-2', true)
end

if not Group.getByName('BVR blue-3') then
    mist.respawnGroup('BVR blue-3', true)
end

if not Group.getByName('BVR blue-4') then
    mist.respawnGroup('BVR blue-4', true)
end

if not Group.getByName('BVR blue-5') then
    mist.respawnGroup('BVR blue-5', true)
end

if not Group.getByName('BVR red') then
    mist.respawnGroup('BVR red', true)
end

if not Group.getByName('BVR red-1') then
    mist.respawnGroup('BVR red-1', true)
end

if not Group.getByName('BVR red-2') then
    mist.respawnGroup('BVR red-2', true)
end

if not Group.getByName('BVR red-3') then
    mist.respawnGroup('BVR red-3', true)
end

if not Group.getByName('BVR red-4') then
    mist.respawnGroup('BVR red-4', true)
end

if not Group.getByName('BVR red-5') then
    mist.respawnGroup('BVR red-5', true)
end

net.log('[SMK] JL1 RESPAWN loaded')
net.send_chat('[SMK] JL1 RESPAWN loaded',true)

local JL1Load = {}

function JL1Load.onPlayerTrySendChat(id, msg, all)
    if msg == "-reload" then
--[[         mist.respawnGroup('BVR red-5', true)
        mist.respawnGroup('BVR red-4', true)
        mist.respawnGroup('BVR red-3', true)
        mist.respawnGroup('BVR red-2', true)
        mist.respawnGroup('BVR red-1', true)
        mist.respawnGroup('BVR red', true)
        mist.respawnGroup('BVR blue-5', true)
        mist.respawnGroup('BVR blue-4', true)
        mist.respawnGroup('BVR blue-3', true)
        mist.respawnGroup('BVR blue-2', true)
        mist.respawnGroup('BVR blue-1', true)
        mist.respawnGroup('BVR blue', true)
        mist.respawnGroup('police-2', true)
        mist.respawnGroup('police-1', true)
        mist.respawnGroup('police', true)
        mist.respawnGroup('针s', true)
        mist.respawnGroup('红外防空', true)
        mist.respawnGroup('aaa', true)
        mist.respawnGroup('地面-52', true)
        mist.respawnGroup('地面-12', true)
        mist.respawnGroup('地面-13', true)
        mist.respawnGroup('地面-101', true)
        mist.respawnGroup('地面-53', true)
        mist.respawnGroup('地面-8', true)
        mist.respawnGroup('地面-4', true) ]]
        net.send_chat('重生完成',true)
    end
end