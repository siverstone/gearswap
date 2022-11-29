-- 適当な自動化
include('simple_auto')

function init_auto_mode()
    state.AutoMode = M{['description']='Auto Mode', 'Off', 'Setup', 'Engage'}
    state.AutoWS = M(false, "Auto WS")
end

function simple_tick()
    -- windower.add_to_chat(123, tostring(moving))
    -- if check_rune() then return true end
    local current_auto_mode = state.AutoMode.value
    if current_auto_mode == 'Off' then return false end

    if current_auto_mode == 'Setup' then
        if not moving and check_spell_buff() then return true end
    elseif current_auto_mode == 'Engage' then
        if player.status ~= 'Engaged' then return false end
        if check_ability_buff() then return true end
        if not moving and check_spell_buff() then return true end
        if not moving and check_enmity() then return true end
        if state.AutoWS.current == 'on' then
            if check_ws() then return true end
        end
    end
    return false
end

local enmity_lists = {
--    {name='フラッシュ', id=112, pf='/ma', t='t'},
--    {name='フォイル', id=840, pf='/ma', t='me'},
    {name='心眼', id=133, pf='/ja', t='me'},
    {name='先義後利', id=141, pf='/ja', t='me'},
    {name='石火之機', id=140, pf='/ja', t='me'},
    {name='葉隠', id=54, pf='/ja', t='me'},
    {name='渾然一体', id=132, pf='/ja', t='t'},
--    {name='護摩の守護円', id=135, pf='/ja', t='me'},
--    {name='破魔の刃', id=53, pf='/ja', t='t'},
}

local sub_job_enmity_lists = {
--    {name='挑発', id=5, pf='/ja', t='t', job='戦'},
    {name='ウォークライ', id=2, pf='/ja', t='me', job='戦'},
    {name='アグレッサー', id=4, pf='/ja', t='me', job='戦'},
    {name='バーサク', id=1, pf='/ja', t='me', job='戦'},
    {name='スタン', id=252, pf='/ma', t='t', job='暗'},
    {name='ウェポンバッシュ', id=88, pf='/ja', t='t', job='暗'},
    {name='ブランクゲイズ', id=592, pf='/ma', t='t', job='青'},
    {name='ジェタチュラ', id=575, pf='/ma', t='t', job='青'},
--    {name='ガイストウォール', id=605, pf='/ma', t='t', job='青'},
--    {name='シープソ\\ング', id=584, pf='/ma', t='t', job='青'},
--    {name='サペリフィック', id=598, pf='/ma', t='t', job='青'},
--    {name='スティンキングガス', id=537, pf='/ma', t='t', job='青'},
}

function check_enmity()
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local ability_recasts = windower.ffxi.get_ability_recasts()

    for i, v in pairs(enmity_lists) do
        if windower.ffxi.get_mob_by_target(v.t) then
            if v.pf == '/ja' then
                if ability_recasts[v.id] == 0 and check_can_use_ability() then
                    windower.chat.input(v.pf..' "'..windower.to_shift_jis(v.name) ..'" <'..v.t..'>')
                    tickdelay = os.clock() + 2
                    return true
                end
            elseif v.pf == '/ma' then
                if spell_recasts[v.id] == 0 and check_can_use_magic() then
                    windower.chat.input(v.pf..' "'..windower.to_shift_jis(v.name) ..'" <'..v.t..'>')
                    tickdelay = os.clock() + 5
                    return true
                end
            end
        end
    end

    for i, v in pairs(sub_job_enmity_lists) do
        if player.sub_job == v.job and windower.ffxi.get_mob_by_target(v.t) then
            if v.pf == '/ja' then
                if ability_recasts[v.id] == 0 then
                    windower.chat.input(v.pf..' "'..windower.to_shift_jis(v.name) ..'" <'..v.t..'>')
                    tickdelay = os.clock() + 2
                    return true
                end
            elseif v.pf == '/ma' then
                if spell_recasts[v.id] == 0 then
                    windower.chat.input(v.pf..' "'..windower.to_shift_jis(v.name) ..'" <'..v.t..'>')
                    tickdelay = os.clock() + 5
                    return true
                end
            end
        end
    end

    return false
end

local ability_buff_lists = {
    {name='黙想', id=134},
    -- {name='リタリエーション', id=8},
    -- {name='リストレント', id=9},
}

local hasso = {name='八双', buff='八双', id=138, t='<me>', job='侍', overwrite=30}

function check_ability_buff()
    if not check_can_use_ability() then return false end
    local recasts = windower.ffxi.get_ability_recasts()
    local buffs = player.buff_details

    for i, v in pairs(ability_buff_lists) do
        if recasts[v.id] == 0 then
            windower.chat.input('/ja "'..windower.to_shift_jis(v.name) ..'" <me>')
            tickdelay = os.clock() + 2
            return true
        end
    end

    -- hasso
    if not buffactive[hasso.buff] and recasts[hasso.id] == 0 then
        windower.chat.input('/ja "'..windower.to_shift_jis(hasso.name) ..'" <me>')
        tickdelay = os.clock() + 2
        return true
    else
        for i = 1, #buffs do
            if buffs[i] and buffs[i].name == hasso.buff and 
                buffs[i].duration < hasso.overwrite and
                recasts[hasso.id] == 0 then
                windower.chat.input('/ja "'..windower.to_shift_jis(hasso.name) ..'" <me>')
                tickdelay = os.clock() + 2
                return true
            end
        end
    end
    return false
end

local spell_buff_lists = {
    Setup = {
    },
    Engage ={
    }
}

local sub_job_spell_lists = {
    {name='空蝉の術:弐', buff='分身(3)',id=339, job='忍', overwrite=0},
    {name='空蝉の術:壱', buff='分身(3)',id=338, job='忍', overwrite=0},
    {name='コクーン', buff='防御力アップ',id=547, job='青', overwrite=30},
}
function check_spell_buff()
    if not check_can_use_magic() then return false end
    mode = state.AutoMode.value
    local buffs = player.buff_details
    local recasts = windower.ffxi.get_spell_recasts()
    for i, v in pairs(sub_job_spell_lists) do
        if player.sub_job == v.job then
            if not buffactive[v.buff] then
              if not buffactive['分身(2)'] then
                if recasts[v.id] == 0 then
                    windower.chat.input('/ma "'..windower.to_shift_jis(v.name) ..'" <me>')
                    tickdelay = os.clock() + 5
                    return true
                end
              end  
            else 
                for i = 1, #buffs do
                    if buffs[i] and buffs[i].name == v.buff and
                        buffs[i].duration < v.overwrite and
                        recasts[v.id] == 0 then
    
                        windower.chat.input('/ma "'..windower.to_shift_jis(v.name) ..'" <me>')
                        tickdelay = os.clock() + 5
                        return true
                    end
                end
            end
        end
    end

    for i, v in pairs(spell_buff_lists[state.AutoMode.Value]) do
        if not buffactive[v.buff] then
            if recasts[v.id] == 0 then
                windower.chat.input('/ma "'..windower.to_shift_jis(v.name) ..'" <me>')
                tickdelay = os.clock() + 5
                return true
            end
        else 
            for i = 1, #buffs do
                if buffs[i] and buffs[i].name == v.buff and
                    buffs[i].duration < v.overwrite and
                    recasts[v.id] == 0 then

                    windower.chat.input('/ma "'..windower.to_shift_jis(v.name) ..'" <me>')
                    tickdelay = os.clock() + 5
                    return true
                end
            end
        end
    end

    return false
end

local use_ws = {
    [1] = '祖之太刀・不動',
    [2] = '九之太刀・花車',
    [3] = '十\\二之太刀・照破',
    [4] = '十\\二之太刀・照破',
}
local ws_index = 1
local ws_target_id = 0
function check_ws()
    if not check_can_use_ws() then return false end
    if player.tp > 1000 then
        ws_target_id = windower.ffxi.get_mob_by_target('t').id
        windower.chat.input('/ws "'..windower.to_shift_jis(use_ws[ws_index]) ..'" <t>')
        ws_index = ws_index % #use_ws + 1
        tickdelay = os.clock() + 5
        return true
    end
    return false
end

windower.raw_register_event("action message", function(actor_id, target_id, actor_index, target_index, message_id, param_1, param_2, param_3)
    if message_id == 6 or message_id == 20 then
        if target_id == ws_target_id then
            ws_index = 1
        end
    end
end)