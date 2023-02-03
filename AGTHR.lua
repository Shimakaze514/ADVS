AGTHR = {} -- DONT REMOVE!

function AGTHR.respawnTHR1()
    mist.respawnGroup('THR1-1', 120)
    mist.respawnGroup('THR1-2', 120)
    mist.respawnGroup('THR1-3', 120)
    trigger.action.outText('克拉斯诺达尔东北方发现敌人的坦克集结地！', 30)
end
function AGTHR.respawnTHR2()
    mist.respawnGroup('THR2', 120)
    trigger.action.outText('克拉斯诺达尔东方发现敌人的装甲突击旅！', 30)
end

local Root = missionCommands.addSubMenuForCoalition(coalition.side.BLUE,'开始有威胁区对地任务')
    missionCommands.addCommandForCoalition(coalition.side.BLUE,'生成坦克集结地' , Root , AGTHR.respawnTHR1 )--先定义函数再在这里调用
    missionCommands.addCommandForCoalition(coalition.side.BLUE,'生成装甲突击旅' , Root , AGTHR.respawnTHR2 )--先定义函数再在这里调用
--[[ local N2 = missionCommands.addSubMenu('we must go deeper', N1)
local N3 = missionCommands.addSubMenu('Go take a UX class', N2) ]]
