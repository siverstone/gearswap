-- 適当な自動化
include('simple_auto')

function init_auto_mode()
    state.AutoMode = M{['description']='Auto Mode', 'Off', 'Setup', 'Engage'}
    state.AutoRune = M{['description']='Auto Rune', 'ルックス', 'イグニス', 'ゲールス', 'フラブラ', 'テッルス', 'スルポール', 'ウンダ','テネブレイ' }
    state.AutoWS = M(false, "Auto WS")
end

function simple_tick()
    -- windower.add_to_chat(123, tostring(moving))
    -- if check_rune() then return true end
    local current_auto_mode = state.AutoMode.value
    if current_auto_mode == 'Off' then return false end

    if current_auto_mode == 'Setup' then
        if check_majesty() then return true end
        if check_rune() then return true end
        if not moving and check_spell_buff() then return true end
    elseif current_auto_mode == 'Engage' then
        if player.status ~= 'Engaged' then return false end
        if check_majesty() then return true end
        if check_rune() then return true end
        if check_ability_buff() then return true end
        if not moving and check_enmity() then return true end
        if not moving and check_spell_buff() then return true end
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
    if rune_count < 2 then
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

local majesty = {name='マジェスティ', buff='マジェスティ', id=150, pf='/ja', t='me', overwrite=30}
function check_majesty()
    if not check_can_use_ability() then return false end
    local recasts = windower.ffxi.get_ability_recasts()
--    local buffs = player.buff_details

    if recasts[majesty.id] == 0 then
        windower.chat.input('/ja "'..windower.to_shift_jis(majesty.name) ..'" <me>')
        tickdelay = os.clock() + 2
        return true
--    else
--        for i = 1, #buffs do
--            if buffs[i] and buffs[i].name == majesty.buff and 
--                buffs[i].duration < majesty.overwrite and
--                recasts[majesty.id] == 0 then
--                windower.chat.input('/ja "'..windower.to_shift_jis(majesty.name) ..'" <me>')
--                tickdelay = os.clock() + 2
--                return true
--            end
--        end
    end
end

local enmity_lists = {
--    {name='センチネル', id=75, pf='/ja', t='me'},
    {name='パリセード', id=42, pf='/ja', t='me'},
    {name='ランパート', id=77, pf='/ja', t='me'},
    {name='シールドバッシュ', id=73, pf='/ja', t='t'},
--    {name='フラッシュ', id=112, pf='/ma', t='t'},
--    {name='バニシュガ', id=38, pf='/ma', t='t'},
}

local sub_job_enmity_lists = {
    {name='挑発', id=5, pf='/ja', t='t', job='戦'},
    {name='フルーグ', id=59, pf='/ja', t='me', job='剣'},
    {name='フォイル', id=840, pf='/ma', t='me', job='剣'},
    {name='ソ\\ードプレイ', id=24, pf='/ja', t='me', job='剣'},
    {name='ブランクゲイズ', id=592, pf='/ma', t='t', job='青'},
    {name='ジェタチュラ', id=575, pf='/ma', t='t', job='青'},
    {name='ガイストウォール', id=605, pf='/ma', t='t', job='青'},
    {name='サペリフィック', id=598, pf='/ma', t='t', job='青'},
    {name='シープソ\\ング', id=584, pf='/ma', t='t', job='青'},
    {name='スティンキングガス', id=537, pf='/ma', t='t', job='青'},
    {name='ブラッドセイバー', id=541, pf='/ma', t='t', job='青'},
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
    {name='ヴァリエンス', buff='', id=113, overwrite=0},
    {name='ヴァレション', buff='ヴァリエンス', id=23, overwrite=0},
}

local ability_buff_lists = {
    {name='シバルリー', id=79},
}

function check_ability_buff()
    if not check_can_use_ability() then return false end
    local recasts = windower.ffxi.get_ability_recasts()
    local buffs = player.buff_details

    -- check fastcast
    if rune_count == 2 then
        for i, v in pairs(vali_lists) do
            if not buffactive[v.buff] then
                if recasts[v.id] == 0 then
                    windower.chat.input('/ja "'..windower.to_shift_jis(v.name) ..'" <me>')
                    tickdelay = os.clock() + 2
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
        if player.mp < 200 and recasts[v.id] == 0 then
            windower.chat.input('/ja "'..windower.to_shift_jis(v.name) ..'" <me>')
            tickdelay = os.clock() + 2
            return true
        end
    end

    return false
end

local spell_buff_lists = {
    Setup = {
        {name='プロテスV', buff='プロテス', id=46, overwrite=30},
        {name='シェルIV', buff='シェル', id=51, overwrite=30},
        {name='クルセード', buff='敵対心アップ', id=476, overwrite=30},
        {name='ファランクス', buff='ファランクス', id=106, overwrite=30},        
    },
    Engage ={
        {name='プロテスV', buff='プロテス', id=46, overwrite=30},
        {name='ファランクス', buff='ファランクス', id=106, overwrite=30},
        {name='リアクト', buff='リアクト', id=97, overwrite=0},
        {name='クルセード', buff='敵対心アップ', id=476, overwrite=30},
        {name='エンライトII', buff='エンライト', id=855, overwrite=30},
        {name='シェルIV', buff='シェル', id=51, overwrite=30},
    },
}
local sub_job_spell_lists = {
        {name='ストンスキン', buff='ストンスキン', id=54, job='剣', overwrite=0},
        {name='コクーン', buff='防御力アップ',id=547, job='青', overwrite=30},
}
function check_spell_buff()
    if not check_can_use_magic() then return false end
    mode = state.AutoMode.value
    local buffs = player.buff_details
    local recasts = windower.ffxi.get_spell_recasts()
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

    for i, v in pairs(sub_job_spell_lists) do
        if player.sub_job == v.job then
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
    end

    return false
end

--local use_ws = 'ロイエ'
local use_ws = 'イオリアンエッジ'
--local use_ws = 'サークルブレード'
function check_ws()
    if not check_can_use_ability() then return false end
--    if buffactive['アフターマス:Lv3'] then
if not buffactive['アフターマス:Lv3'] then
        if player.tp >= 1000 then
            windower.chat.input('/ws "'..windower.to_shift_jis(use_ws) ..'" <t>')
            tickdelay = os.clock() + 5
            return true
        end
    else
        if player.tp == 3000 then
            windower.chat.input('/ws "'..windower.to_shift_jis(use_ws) ..'" <t>')
            tickdelay = os.clock() + 5
            return true
        end
    end

    return false
end