local texts = require('texts')
sublimation_box = texts.new('${state}',{text={font='メイリオ', size=8}, pos={x=595, y=515}, padding = 2})
sublimation_box:show()

function get_sets()
    set_language('japanese')
    
    sets.precast = {}
    sets.precast.ws = {}
    sets.precast.ability = {}
    sets.midcast = {}
    sets.aftercast = {}

 --[  ]遠隔・スナップ装備
sets.precast.snap = {
    ammo="エミネンブレット",
    head={ name="テーオンシャポー", augments={'"Snapshot"+5','"Snapshot"+5',}},
    body="ＡＭカバン+1",
    hands={ name="テーオングローブ", augments={'"Snapshot"+5','"Snapshot"+5',}},
    legs="ＯＲブラッカエ+2",
    feet="メガナダジャンボ+2",
    neck="スカウトゴルゲット",
    waist="インパルスベルト",
    left_ear="エアバニピアス",
    right_ear="オノワイヤリング",
    left_ring="守りの指輪",
    right_ring="昏黄の指輪",
    back={ name="ベレナスケープ", augments={'"Snapshot"+10',}},
    }

 --[  ]遠隔・物理ＷＳ装備
sets.precast.ws.phisical = {
    ammo="エミネンブレット",
    head="ＯＲベレー+2",
    body="イケンガベスト",
    hands="メガナダグローブ+2",
    legs="イケンガトラウザ",
    feet="イケンガクロッグ",
    neck="フォシャゴルゲット",
    waist="フォシャベルト",
    left_ear="エナベートピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="カコエシクリング+1",
    right_ring="昏黄の指輪",
    back={ name="ベレナスケープ", augments={'AGI+20','AGI+5','Weapon skill damage +10%',}},
    }

 --[  ]遠隔・属性ＷＳ装備
    sets.precast.ws.magic= {
        ammo="デベステトブレット",
        head="ＯＲベレー+2",
        body={ name="コーホトクローク+1", augments={'Path: A',}},
        hands={ name="カマインフィンガ+1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="ヘルクリアトラウザ", augments={'"Mag.Atk.Bns."+29','STR+6','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
        feet={ name="ヘルクリアブーツ", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Crit.hit rate+1','Mag. Acc.+15','"Mag.Atk.Bns."+13',}},
        neck="サンクトネックレス",
        waist="エスカンストーン",
        left_ear="フリオミシピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="ディンジルリング",
        right_ring="アルビナリング+1",
        back={ name="ベレナスケープ", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
    }
    
    sets.precast.ws["ラストスタンド"] = sets.precast.ws.phisical
    sets.precast.ws["カラナック"] = sets.precast.ws.phisical
    sets.precast.ws["トゥルーフライト"] = sets.precast.ws.magic
    sets.precast.ws["ワイルドファイア"] = set_combine(sets.precast.ws.magic, {hands={ name="カマインフィンガ+1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},})
    sets.precast.ws["イオリアンエッジ"] = sets.precast.ws.magic
    
 --[  ]ファストキャスト装備
    sets.precast.fc = {
        ammo="クロノブレット",
        head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body={ name="テーオンタバード", augments={'"Fast Cast"+5','Phalanx +3',}},
    hands={ name="レイライングローブ", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
        legs="ギーヴトラウザ",
        feet={ name="カマイングリーヴ+1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
        neck="ボルトサージトルク",
        waist="ニヌルタサッシュ",
        left_ear="ロケイシャスピアス",
        right_ear="エンチャンピアス+1",
        left_ring="守りの指輪",
        right_ring="ラハブリング",
        back="月光の羽衣",
    }
    
 --[  ]遠隔・着弾装備
sets.midcast.ra = {
    ammo="エミネンブレット",
    head="イケンガハット",
    body="イケンガベスト",
    hands="イケンガグローブ",
    legs="イケンガトラウザ",
    feet="イケンガクロッグ",
    neck="エルデションレンズ",
    waist="オネイロスセスト",
    lest_ear="エナベートピアス",
    right_ear="バレーピアス",
    left_ring="シーリチリング+1",
    right_ring="昏黄の指輪",
    back={ name="ベレナスケープ", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
    }
    
 --[21]通常・待機装備
sets.aftercast.idle = {
    ammo="エミネンブレット",
    head="マリグナスシャポー",
    body="マリグナスタバード",
    hands="メガナダグローブ+2",
    legs="マリグナスタイツ",
    feet="マリグナスブーツ",
    neck="サンクトネックレス",
    waist="ギシドゥバサッシュ",
    lest_ear="エナベートピアス",
    right_ear="バレーピアス",
    left_ring="シーリチリング+1",
    right_ring="シュネデックリング",
    back="月明の羽衣",
    }

sets.aftercast.melee = sets.midcast.ra

end

function precast(spell)
    local set_equip = nil
    
    if spell.name == '飛び道具' then
        set_equip = sets.precast.snap
    elseif spell.type == 'WeaponSkill' then
        if sets.precast.ws[spell.name] then
            set_equip = sets.precast.ws[spell.name]
        else
            set_equip = sets.precast.ws.phisical
        end
    elseif spell.type == 'Trust' then
        set_equip = sets.precast.fc
    elseif spell.type == 'Ninjutsu' then
        set_equip = sets.precast.fc
    end
    
    if set_equip then
        equip(set_equip)
    end
end

function midcast(spell)
    local set_equip = nil
    
    if spell.name == '飛び道具' then
        set_equip = sets.midcast.ra
    end
    
    if set_equip then
        equip(set_equip)
    end
end

function aftercast(spell)
    local set_equip = nil
    
    if player.status == 'Engaged' then
        if spell.type == 'WeaponSkill' and spell.interrupted == false then
            windower.add_to_chat(30, 'TP: ' .. player.tp .. ' after ' .. spell.name)
        end
        set_equip = sets.aftercast.melee
    else
        set_equip = sets.aftercast.idle
    end
    
    if set_equip ~= nill then
        equip(set_equip)
    end
end

function status_change(new, old)
    local set_equip = nil
    
    if new == 'Idle' then
        set_equip = sets.aftercast.idle
    elseif new == 'Engaged' then
        set_equip = sets.aftercast.melee
    end
    
    if set_equip ~= nil then
        equip(set_equip)
    end
end

function sublimation_update()

    local sublimation_actived = 'ベロシティ:あり'

    if buffactive['ベロシティショット'] then
        sublimation_box.state = sublimation_actived
        sublimation_box:color(255,255,0)
        sublimation_box:bg_color(0,0,255)
    else
        sublimation_box.state = 'ベロシティ:なし'
        sublimation_box:color(255,255,255)
        sublimation_box:bg_color(255,0,0)
    end

end

update_time = 0
update_interval = 1

windower.register_event('time change', function(new, old)
    local curr = os.clock()
    if curr > update_time + update_interval then
        update_time = curr
        sublimation_update()
        send_command("cancel 33")
    end
end)

function file_unload(file_name)
    sublimation_box:destroy()
end
