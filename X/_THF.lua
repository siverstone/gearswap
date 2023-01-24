function get_sets()
    set_language('japanese')

    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['不意打ち'] = buffactive['不意打ち'] or false
    state.Buff['だまし討ち'] = buffactive['だまし討ち'] or false
    state.Buff['フェイント'] = buffactive['フェイント'] or false
    state.Buff['死の宣告'] = buffactive['死の宣告'] or false
    state.Buff['睡眠'] = buffactive['睡眠'] or false

--    include('Mote-TreasureHunter')
    include('Mote-Display')

    include('auto_thf')
end

function user_setup()
    state.OffenseMode:options('Normal','DT')
    state.HybridMode:options('Normal','TH')
    state.WeaponskillMode:options('Normal', 'DmgLim')
    state.Weapons = M{['description']='Use Weapons', 'Tauret', 'Gandring', 'Twashtar', 'Centovente'}

    init_auto_mode()

    bool_state = {
        {label='AutoWS', mode='AutoWS'},
    }
    mode_state = {
        {label='Auto', mode='AutoMode'},
        {label='Offense', mode='OffenseMode'},
--        {label='Hydrid', mode='HybridMode'},
--        {label='WS', mode='WeaponskillMode'},
        {label='Weapon', mode='Weapons'},
    }
    init_job_states(bool_state, mode_state)
end

function binds_on_load()
    send_command('bind f1 gs c cycle OffenseMode')
    send_command('bind ^f1 gs c cycle HybridMode')
    send_command('bind f2 gs c cycle WeaponskillMode')
    send_command('bind ^f2 gs c cycle Weapons')
    -- send_command('bind f3 gs c cycle CastingMode')
    -- send_command('bind f3 gs c cycle IdleMode')
    send_command('bind f4 gs c update user')
    send_command('bind ^f4 gs c cycle TreasureMode')

    -- send_command('bind !f4 gs c reset DefenseMode')
    -- send_command('bind f2 gs c set DefenseMode Physical')
    -- send_command('bind ^f2 gs c cycle PhysicalDefenseMode')
    -- send_command('bind !f2 gs c toggle Kiting')
    -- send_command('bind f3 gs c set DefenseMode Magical')

    -- send_command('bind ^- gs c toggle selectnpctargets')
    -- send_command('bind ^= gs c cycle pctargetmode')
end

function binds_on_unload()
    send_command('unbind f1')
    send_command('unbind ^f1')
    send_command('unbind f2')
    send_command('unbind ^f2')
    -- send_command('unbind f3')
    -- send_command('unbind ^f3')
    send_command('unbind f4')
    send_command('unbind ^f4')

    -- send_command('unbind ^-')
    -- send_command('unbind ^=')
end

function user_unload()
end

function init_gear_sets()
    sets.weapons = {}
    sets.weapons.Gandring = { main={name="ガンドリング"}, sub={ name="トゥワシュトラ"}}
    sets.weapons.Twashtar = { main={name="トゥワシュトラ"}, sub={ name="ターニオンダガー+1"}}
    sets.weapons.Tauret = { main={name="トーレット"}, sub={ name="ターニオンダガー+1"}}
    sets.weapons.Centovente = { main={name="トーレット"}, sub={ name="マレヴォレンス"}}

    sets.TreasureHunter = {
        hands={ name="ＰＤアムレット+1", augments={'Enhances "Perfect Dodge" effect',}},
    }

    sets.precast.FC = {
    head={ name="ヘルクリアヘルム", augments={'"Mag.Atk.Bns."+20','Damage taken-3%','INT+7','Mag. Acc.+6',}},
    body={ name="テーオンタバード", augments={'"Fast Cast"+5','Phalanx +3',}},
    hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="ダッシングサブリガ",
    feet="マリグナスブーツ",
    neck={ name="バーシチョーカー+1", augments={'Path: A',}},
    waist="トランスベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="ＶＣリング+1",
    back="リパルスマント",
    }

    sets.precast.RA = {
        head={ name="テーオンシャポー", augments={'"Snapshot"+5','"Snapshot"+5',}},
        body={ name="テーオンタバード", augments={'"Snapshot"+5','"Snapshot"+5',}},
        hands={ name="テーオングローブ", augments={'"Snapshot"+5','"Snapshot"+5',}},
        legs={ name="テーオンタイツ", augments={'"Snapshot"+5','"Snapshot"+5',}},
        feet="メガナダジャンボ+2",
        back={ name="トゥタティスケープ", augments={'"Snapshot"+10',}},
    }

    sets.precast.WS = { -- Multi
        head={ name="アデマボンネット+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="ＰＬベスト+3",
        hands={ name="アデマリスト+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="ＰＬキュロット+3",
        feet={ name="ＰＤプーレーヌ+3", augments={'Enhances "Assassin\'s Charge" effect',}},
        neck={ name="アサシンゴルゲ+2", augments={'Path: A',}},
        waist="フォシャベルト",
        left_ear="シェリダピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="ゲリリング",
        right_ring="イラブラットリング",
        back={ name="トゥタティスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }

    sets.precast.WS.wsd = {
    head="ＰＬボンネット+2",
    body="マリグナスタバード",
    hands="メガナダグローブ+2",
    legs={ name="ＰＤキュロット+2", augments={'Enhances "Feint" effect',}},
    feet="マリグナスブーツ",
    neck="サンクトネックレス",
        waist="フォシャベルト",
    left_ear="オドルピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="エポナリング",
    right_ring="ラジャスリング",
    back={ name="トゥタティスケープ", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }
    
    sets.precast.WS.sata = {
    head="ＰＬボンネット+2",
    body="マリグナスタバード",
    hands="メガナダグローブ+2",
    legs={ name="ＰＤキュロット+2", augments={'Enhances "Feint" effect',}},
    feet="マリグナスブーツ",
    neck="サンクトネックレス",
        waist="フォシャベルト",
    left_ear="オドルピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="エポナリング",
    right_ring="ラジャスリング",
    back={ name="トゥタティスケープ", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
    }
    
    sets.precast.WS.critical = {
    head={ name="ブリスタサリット+1", augments={'Path: A',}},
    body="マリグナスタバード",
    hands={ name="アデマリスト+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="ムンムケックス+2",
    feet="マリグナスブーツ",
    neck="フォシャゴルゲット",
        waist="フォシャベルト",
    left_ear="オドルピアス",
    left_ear="シェリダピアス",
    right_ear={ name="スカルカピアス", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
    right_ring="ラジャスリング",
    back="サクロマント",
    }

    sets.precast.WS.magic = {
    range="ウィングカッター+1",
    head="ニャメヘルム",
    body="ニャメメイル",
    hands="ニャメガントレ",
    legs="ニャメフランチャ",
    feet="ニャメソルレット",
    neck="サンクトネックレス",
    waist="エスカンストーン",
    left_ear="ストロファデピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="メタモルリング",
    right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}},
    back="サクロマント",
    }

    sets.precast.WS['ワスプスティング'] = sets.precast.WS.wsd
    sets.precast.WS['ガストスラッシュ'] = sets.precast.WS.wsd
    sets.precast.WS['シャドーステッチ'] = sets.precast.WS.wsd
    sets.precast.WS['バイパーバイト'] = sets.precast.WS.wsd
    sets.precast.WS['サイクロン'] = sets.precast.WS.wsd
    sets.precast.WS['エナジースティール'] = sets.precast.WS.wsd
    sets.precast.WS['エナジードレイン'] = sets.precast.WS.wsd
    sets.precast.WS['ダンシングエッジ'] = sets.precast.WS
    sets.precast.WS['シャークバイト'] = sets.precast.WS.wsd
    sets.precast.WS['イオリアンエッジ'] = sets.precast.WS.magic
    sets.precast.WS['マーシーストローク'] = sets.precast.WS.wsd
    sets.precast.WS['エヴィサレーション'] = sets.precast.WS.critical
    sets.precast.WS['エクゼンテレター'] = sets.precast.WS
    sets.precast.WS['ルドラストーム'] = sets.precast.WS.wsd
    sets.precast.WS['マンダリクスタッブ'] = sets.precast.WS.wsd
    
    sets.precast.WS['ワスプスティング'].SATA = sets.precast.WS.sata
    sets.precast.WS['バイパーバイト'].SATA = sets.precast.WS.sata
    sets.precast.WS['シャークバイト'].SATA = sets.precast.WS.sata
    sets.precast.WS['ルドラストーム'].SATA = sets.precast.WS.sata
    sets.precast.WS['マンダリクスタッブ'].SATA = sets.precast.WS.sata

    sets.precast.JA['絶対回避'] = {hands={ name="ＰＤアムレット+1", augments={'Enhances "Perfect Dodge" effect',}},}
    sets.precast.JA['かくれる'] = {body="ＰＬベスト+3",}
    sets.precast.JA['とんずら'] = {feet="ローグプーレーヌ",}
    sets.precast.JA['フェイント'] = {legs={ name="ＰＤキュロット+3", augments={'Enhances "Feint" effect',}},}

    sets.precast.JA.Waltz = {
        legs="ダッシングサブリガ",
        left_ring="アスクレピアリング",
        right_ring="ヴァルスールリング",
        back={ name="シコルマント", augments={'DEX+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Waltz" potency +10%','Damage taken-5%',}},
    }

    sets.midcast.RA = {
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck="サンクトネックレス",
        waist="エスカンストーン",
        left_ear="ディグニタリピアス",
        right_ear="昏黄の耳飾り",
        left_ring="ムンムリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back="サクロマント",
    }

    sets.idle = {
    range="ウィングカッター+1",
    head="マリグナスシャポー",
    body="マリグナスタバード",
    hands="マリグナスグローブ",
    legs="メガナダショウス+2",
    feet="マリグナスブーツ",
    neck={ name="バーシチョーカー+1", augments={'Path: A',}},
    waist="エングレイブベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="ＶＣリング+1",
    back="リパルスマント",
    }

    sets.engaged = {
    range="ウィングカッター+1",
    head="マリグナスシャポー",
    body="マリグナスタバード",
    hands={ name="アデマリスト+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="メガナダショウス+2",
    feet="ＳＫプーレーヌ+3",
    neck="エルデションレンズ",
    waist={ name="セールフィベルト+1", augments={'Path: A',}},
    left_ear="シェリダピアス",
    right_ear={ name="スカルカピアス", augments={'System: 1 ID: 1676 Val: 0','Accuracy+10','Mag. Acc.+10',}},
    left_ring="ゲリリング",
    right_ring="エポナリング",
    back="サクロマント",
    }
    sets.engaged.TH = set_combine(sets.engaged, sets.TreasureHunter)

    sets.engaged.DT = {
    range="ウィングカッター+1",
    head="マリグナスシャポー",
    body="マリグナスタバード",
    hands={ name="ＰＤアムレット+1", augments={'Enhances "Perfect Dodge" effect',}},
    legs="ダッシングサブリガ",
    feet="マリグナスブーツ",
    neck="リソムネックレス",
    waist="チャークベルト",
    left_ear="ランピアス",
    right_ear="エアバニピアス",
    left_ring="守りの指輪",
    right_ring="ＶＣリング+1",
    back="レイックマント",
    }

    sets.engaged.DT.TH = set_combine(sets.engaged.DT, sets.TreasureHunter)
end

function job_precast(spell, action, spellMap, eventArgs)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.HybridMode.value == 'TH' and string.find(spell.type, 'Magic') then
        equip(sets.TreasureHunter)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
end

function job_post_aftercast(spell, action, spellMap, eventArgs)
end

function get_custom_wsmode(spell, spellMap, default_wsmode)
    if state.Buff['不意打ち'] or state.Buff['だまし討ち'] then
        return 'SATA'
    end
end

function customize_idle_set(idleSet)
    local weapon = sets.weapons[state.Weapons.value]
    if player.equipment.sub == weapon.main.name then
        weapon.sub.priority = 1
        weapon.main.priority = 0
    end
    idleSet = set_combine(idleSet, weapon)
    if state.Buff['死の宣告'] then
        idleSet = set_combine(idleSet, {neck="ニカンダネックレス",}, {waist="ギジドゥバサッシュ",}, {left_ring={ name="ブレンモドリング+1", bag="wardrobe5",}}, { right_ring={ name="ブレンモドリング+1", bag="wardrobe6",}})
    end
    return idleSet
end

function customize_melee_set(meleeSet)
    local weapon = sets.weapons[state.Weapons.value]
    if player.equipment.sub == weapon.main.name then
        weapon.sub.priority = 1
        weapon.main.priority = 0
    end
    meleeSet = set_combine(meleeSet, weapon)
    if state.Buff['死の宣告'] then
        meleeSet = set_combine(meleeSet, {neck="ニカンダネックレス",}, {waist="ギジドゥバサッシュ",}, {left_ring={ name="ブレンモドリング+1", bag="wardrobe5",}}, { right_ring={ name="ブレンモドリング+1", bag="wardrobe6",}})
    elseif state.Buff['睡眠'] then
        meleeSet = set_combine(meleeSet, {head="フレンジーサリット",})
    else
        meleeSet = set_combine(meleeSet, weapon)
    end
    return meleeSet
end

function job_buff_change(buff, gain)
    if state.DisplayMode.value then update_job_states() end
end

function update_combat_form()
end

function job_update(cmdParams, eventArgs)
    if state.DisplayMode.value then update_job_states() end
end

function job_self_command(cmdParams, eventArgs)
    local itemizer_command = ''
    local get = 'get'
    local put = 'put'
    local name = 'ガーゴイルの欠片'
    local name2 = '風の塊'
    local sack = 'sack'
    if cmdParams[1] == 'get' then
        itemizer_command = itemizer_command..get..' '..name..' '..sack..' all ;' 
        send_command(itemizer_command)
    elseif cmdParams[1] == 'get2' then
        itemizer_command = itemizer_command..get..' '..name2..' '..sack..' all ;' 
        send_command(itemizer_command)
    end
    if cmdParams[1] == 'sack' then
        itemizer_command = itemizer_command..put..' '..name..' '..sack..' all ;'
        send_command(itemizer_command)
    elseif cmdParams[1] == 'sack2' then
        itemizer_command = itemizer_command..put..' '..name2..' '..sack..' all ;'
        send_command(itemizer_command)
    end
end

function job_sub_job_change(newSubjob, oldSubjob)
    set_equip_by_sub_job(newSubjob)
end

--function select_default_macro_book()
--    set_macro_page(1, 4)
--end

--function mogmaster(job)
--    send_command('input /si '..job..';')
--end

function set_equip_by_sub_job(subJob)
    if state.DisplayMode.value then update_job_states() end

--    send_command('wait 1; input /lockstyle on; wait 1; gs c ls;')
end
