-- 適当な自動化
include('simple_auto')

function init_auto_mode()
    state.AutoMode = M{['description']='Auto Mode', 'Off', 'Setup', 'Engage'}
    state.AutoRune = M{['description']='Auto Rune','テネブレイ', 'イグニス', 'ゲールス', 'フラブラ', 'テッルス', 'スルポール', 'ウンダ', 'ルックス', }
    state.AutoWS = M(false, "Auto WS")
end

function simple_tick()
    -- windower.add_to_chat(123, tostring(moving))
    -- if check_rune() then return true end
    local current_auto_mode = state.AutoMode.value
    if current_auto_mode == 'Off' then return false end

    if current_auto_mode == 'Setup' then
        if check_rune() then return true end
        if not moving and check_spell_buff() then return true end
    elseif current_auto_mode == 'Engage' then
        if player.status ~= 'Engaged' then return false end
        if check_rune() then return true end
        if check_ability_buff() then return true end
        if not moving and check_spell_buff() then return true end
        if not moving and check_enmity() then return true end
        if state.AutoWS.current == 'on' then
            if check_ws() then return true end
        end
    end
    return false
end

local ability_rune = S{'イグニス', 'ゲールス', 'フラブラ', 'テッルス', 'スルポール', 'ウンダ', 'ルックス', 'テネブレイ'}
local rune_id = 92
local rune_overwrite = 30
rune_count = 0
function check_rune()
    if not check_can_use_ability() then return false end
    local last_rune_duration = 0
    local last_rune_name = nil
    local buffs = player.buff_details
    rune_count = 0
    for i = 1, #buffs do
        if buffs[i] and ability_rune:contains(buffs[i].name) then
            rune_count = rune_count + 1
            last_rune_duration = buffs[i].duration
            last_rune_name = buffs[i].name
        end
    end

	local recasts = windower.ffxi.get_ability_recasts()
    if recasts[rune_id] ~= 0 then return false end
    if rune_count < 3 then
        windower.chat.input('/ja "'..windower.to_shift_jis(state.AutoRune.value) ..'" <me>')
        tickdelay = os.clock() + 2
        return true
    else
        if last_rune_name and last_rune_duration < rune_overwrite then
            windower.chat.input('/ja "'..windower.to_shift_jis(state.AutoRune.value) ..'" <me>')
            tickdelay = os.clock() + 2
            return true
        elseif last_rune_name ~= state.AutoRune.value then
            windower.chat.input('/ja "'..windower.to_shift_jis(state.AutoRune.value) ..'" <me>')
            tickdelay = os.clock() + 2
            return true
        end
    end
    return false
end

local enmity_lists = {
--    {name='フラッシュ', id=112, pf='/ma', t='t'},
    {name='フルーグ', id=59, pf='/ja', t='me'},
    {name='フォイル', id=840, pf='/ma', t='me'},
}

local sub_job_enmity_lists = {
--    {name='挑発', id=5, pf='/ja', t='t', job='戦'},
--    {name='スタン', id=252, pf='/ma', t='t', job='暗'},
--    {name='ウェポンバッシュ', id=88, pf='/ja', t='t', job='暗'},
      {name='アブゾタック', id=275, pf='/ma', t='t', job='暗'},
      {name='ジェタチュラ', id=575, pf='/ma', t='t', job='青'},
      {name='ガイストウォール', id=605, pf='/ma', t='t', job='青'},
      {name='シープソ\\ング', id=584, pf='/ma', t='t', job='青'},
      {name='ブランクゲイズ', id=592, pf='/ma', t='t', job='青'},
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

local vali_lists = {
    {name='ヴァリエンス', buff='リエモン', id=113, overwrite=0},
    {name='ヴァレション', buff='リエモン', id=23, overwrite=0},
}

local ability_buff_lists = {
    {name='ソ\\ードプレイ', id=24},
    {name='バットゥタ', id=120},
    {name='ビベイシャス', id=242},
}

local hasso = {name='八双', buff='八双', id=138, t='<me>', job='侍', overwrite=30}
function check_ability_buff()
    if not check_can_use_ability() then return false end
    local recasts = windower.ffxi.get_ability_recasts()
    local buffs = player.buff_details

    -- check fastcast
    if rune_count == 3 then
        for i, v in pairs(vali_lists) do
            if not buffactive[v.buff] then
                if recasts[v.id] == 0 then
                    windower.chat.input('/ja "'..windower.to_shift_jis(v.name) ..'" <me>')
                    tickdelay = os.clock() + 5
                    return true
                end
            else
                for i = 1, #buffs do
                    if buffs[i] and buffs[i].name == v.buff and
                        buffs[i].duration < v.overwrite and
                        recasts[v.id] == 0 then
                        windower.chat.input('/ja "'..windower.to_shift_jis(v.name) ..'" <me>')
                        tickdelay = os.clock() + 2
                        return true
                    end
                end
            end
        end
    end

    for i, v in pairs(ability_buff_lists) do
        if recasts[v.id] == 0 then
            windower.chat.input('/ja "'..windower.to_shift_jis(v.name) ..'" <me>')
            tickdelay = os.clock() + 2
            return true
        end
    end

    -- hasso
    if player.sub_job == '侍' then
        if not buffactive[hasso.buff] then
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
    end
    return false
end

local spell_buff_lists = {
    Setup = {
--        {name='バエアロ', buff='バエアロ', id=62, overwrite=0},
--        {name='バストン', buff='バストン', id=63, overwrite=0},
--        {name='バサンダ', buff='バサンダ', id=64, overwrite=0},
--        {name='バウォタ', buff='バウォタ', id=65, overwrite=0},
        {name='アクアベール', buff='アクアベール', id=55, overwrite=0},
        {name='シェルV', buff='シェル', id=52, overwrite=0},
        {name='プロテスIV', buff='プロテス', id=46, overwrite=0},
        {name='ファランクス', buff='ファランクス', id=106, overwrite=0},
        {name='クルセード', buff='敵対心アップ', id=476, overwrite=0},
        {name='アイススパイク', buff='アイススパイク', id=250, overwrite=0},
        {name='ストンスキン', buff='ストンスキン', id=54, overwrite=0},
        {name='リフレシュ', buff='リフレシュ', id=109, overwrite=0},
        {name='リジェネIV', buff='リジェネ', id=477, overwrite=0},
    },
    Engage ={
--        {name='バエアロ', buff='バエアロ', id=62, overwrite=0},
--        {name='バストン', buff='バストン', id=63, overwrite=0},
--        {name='バサンダ', buff='バサンダ', id=64, overwrite=0},
--        {name='バウォタ', buff='バウォタ', id=65, overwrite=0},
        {name='シェルV', buff='シェル', id=52, overwrite=0},
        {name='ファランクス', buff='ファランクス', id=106, overwrite=0},
        {name='アクアベール', buff='アクアベール', id=55, overwrite=0},
        {name='クルセード', buff='敵対心アップ', id=476, overwrite=0},
        {name='アイススパイク', buff='アイススパイク', id=250, overwrite=0},
        {name='ストンスキン', buff='ストンスキン', id=54, overwrite=0},
        {name='リフレシュ', buff='リフレシュ', id=109, overwrite=0},
        {name='リジェネIV', buff='リジェネ', id=477, overwrite=0},
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
--  [1] = 'デミディエーション',
  [1] = 'ショックウェーブ',
}
local ws_index = 1
local ws_target_id = 0
function check_ws()
    if not check_can_use_ws() then return false end
    if player.tp >= 1000 then
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