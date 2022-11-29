function get_sets()
    set_language('japanese')

    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['身替'] = buffactive['身替'] or false
    state.Buff['分身(3)'] = buffactive['分身(3)'] or false
    state.Buff['分身(2)'] = buffactive['分身(2)'] or false
    -- state.Buff['散華'] = buffactive['散華'] or false
    -- state.Buff['陰忍'] = buffactive['陰忍'] or false
    -- state.Buff['ラストリゾート'] = buffactive['ラストリゾート'] or false
    -- state.Buff['ダークシール'] = buffactive['ダークシール'] or false
    -- state.Buff['ネザーヴォイド'] = buffactive['ネザーヴォイド'] or false
    state.Buff['死の宣告'] = buffactive['死の宣告'] or false

    include('Mote-TreasureHunter')
    include('Mote-Display')

    include('auto_nin')
end

function user_setup()
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'DmgLim')
    state.Weapons = M{['description']='Use Weapons', 'Kinshi', 'Tauret', 'Club',}

    init_auto_mode()

    bool_state = {
        {label='AutoWS', mode='AutoWS'},
    }
    mode_state = {
        {label='Auto', mode='AutoMode'},
        {label='Offense', mode='OffenseMode'},
        {label='Hybrid', mode='HybridMode'},
        {label='WS', mode='WeaponskillMode'},
        {label='Weapon', mode='Weapons'},
    }
    init_job_states(bool_state, mode_state)
--    select_default_macro_book()
--    mogmaster('nin')
end

function binds_on_load()
    send_command('bind f1 gs c cycle OffenseMode')
    send_command('bind ^f1 gs c cycle HybridMode')
    send_command('bind f2 gs c cycle WeaponskillMode')
    send_command('bind ^f2 gs c cycle Weapons')
    send_command('bind f3 gs c cycle AutoMode')
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
    send_command('unbind f3')
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
    sets.weapons.Kinshi = {main="金糸雀", sub="ターニオンダガー+1"}
    sets.weapons.Tauret = {main="トーレット", sub="ターニオンダガー+1"}
    sets.weapons.Club = {main="デジョンカジェル", sub="ターニオンダガー+1"}

    sets.TreasureHunter = {
        ammo="完璧な幸運の卵",
--      head="白ララブキャップ+1",
    hands={ name="ヘルクリアグローブ", augments={'Attack+13','Weapon skill damage +2%','"Treasure Hunter"+2','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
        waist="チャークベルト",
    }

    sets.EnmityBoost = {
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body="エメットハーネス+1",
        hands="クーリスグローブ",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="アホシレギンス",
        neck="月光の首飾り",
        waist="カシリベルト",
        left_ear="クリプティクピアス",
        right_ear="フリオミシピアス",
        left_ring="守りの指輪",
        right_ring="アイワツリング",
        back={ name="アンダルタマント", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.FC = {
    head={ name="ヘルクリアヘルム", augments={'"Mag.Atk.Bns."+14','"Fast Cast"+5','MND+10','Mag. Acc.+8',}},
    body={ name="テーオンタバード", augments={'"Fast Cast"+5','Phalanx +3',}},
    hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="ムンムケックス+2",
    feet={ name="ヘルクリアブーツ", augments={'Mag. Acc.+17','"Fast Cast"+5','STR+2',}},
    neck={ name="バーシチョーカー+1", augments={'Path: A',}},
    waist="フルームベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="アンダルタマント", augments={'"Fast Cast"+10',}},
    }

    sets.precast.WS = { -- Multi
    head="乾闥婆陣鉢改",
    body="乾闥婆作務衣改",
    hands={ name="アデマリスト+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="真膝丸膝甲",
    feet={ name="ヘルクリアブーツ", augments={'Accuracy+30','"Triple Atk."+3','AGI+7',}},
    neck="フォシャゴルゲット",
    waist="セールフィベルト+1",
    left_ear="ブルタルピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="エポナリング",
    right_ring="ゲリリング",
    back="サクロマント",
    }

    sets.precast.WS.critical = {
        ammo="パルーグストーン",
        head={ name="ブリスタサリット+1", augments={'Path: A',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands="ムンムリスト+2",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="ムンムゲマッシュ+2",
        neck={ name="忍者の喉輪+2", augments={'Path: A',}},
        waist="フォシャベルト",
        left_ear="マーケピアス+1",
        right_ear="オドルピアス",
        left_ring="王将の指輪",
        right_ring="ムンムリング",
        back="サクロマント",
    }

    sets.precast.WS.wsd = {
        ammo={ name="シーズボムレット+1", augments={'Path: A',}},
        head="ムパカキャップ",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="忍者の喉輪+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="マーケピアス+1",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="王将の指輪",
        right_ring="イラブラットリング",
        back="サクロマント",
    }

    sets.precast.WS.magic = {
        -- ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        ammo={ name="シーズボムレット+1", augments={'Path: A',}},
        -- head={ name="ニャメヘルム", augments={'Path: B',}},
        head={ name="極望月半首", augments={'Enhances "Yonin" and "Innin" effect',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="サンクトネックレス",
        waist="オルペウスサッシュ",
        left_ear="昏黄の耳飾り",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="王将の指輪",
        right_ring="ゲリリング",
        back={ name="アンダルタマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }

    sets.precast.WS.magic_drk = {
        -- ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        ammo={ name="シーズボムレット+1", augments={'Path: A',}},
        head="妖蟲の髪飾り+1",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="サンクトネックレス",
        waist="オルペウスサッシュ",
        left_ear="昏黄の耳飾り",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="アルコンリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back="サクロマント",
    }

    sets.precast.WS['臨'] = sets.precast.WS.critical
    sets.precast.WS['烈'] = sets.precast.WS.magic
    sets.precast.WS['滴'] = sets.precast.WS.magic
    sets.precast.WS['凍'] = sets.precast.WS.magic
    sets.precast.WS['地'] = sets.precast.WS.magic
    sets.precast.WS['影'] = sets.precast.WS.magic_drk
    sets.precast.WS['迅'] = sets.precast.WS.critical 
    sets.precast.WS['天'] = sets.precast.WS.wsd
    sets.precast.WS['空'] = sets.precast.WS
    sets.precast.WS['湧'] = sets.precast.WS.magic
    sets.precast.WS['カムハブリ'] = sets.precast.WS.wsd
    sets.precast.WS['秘'] = sets.precast.WS.critical
    sets.precast.WS['瞬'] = sets.precast.WS

    -- sets.precast.WS.dmglim = {head={ name="スティンガヘルム+1", augments={'Path: A',}},}
    -- sets.precast.WS.DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)

    -- sets.precast.WS['ダブルスラスト'].DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)
    -- sets.precast.WS['サンダースラスト'].DmgLim = set_combine(sets.precast.WS.wsd, sets.precast.WS.dmglim)
    -- sets.precast.WS['ライデンスラスト'].DmgLim = set_combine(sets.precast.WS.wsd, sets.precast.WS.dmglim)
    -- sets.precast.WS['足払い'].DmgLim = sets.precast.WS.magic_acc
    -- sets.precast.WS['ペンタスラスト'].DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)
    -- sets.precast.WS['ボーパルスラスト'].DmgLim = set_combine(sets.precast.WS.wsd, sets.precast.WS.dmglim)
    -- sets.precast.WS['スキュアー'].DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)
    -- sets.precast.WS['大車輪'].DmgLim = set_combine(sets.precast.WS.wsd, {right_ear="スラッドピアス",}, sets.precast.WS.dmglim)
    -- sets.precast.WS['インパルスドライヴ'].DmgLim = set_combine(sets.precast.WS.wsd, sets.precast.WS.dmglim)
    -- sets.precast.WS['ソニックスラスト'].DmgLim = set_combine(sets.precast.WS.wsd, sets.precast.WS.dmglim)
    -- sets.precast.WS['雲蒸竜変'].DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)
    -- sets.precast.WS['カムラン'].DmgLim = set_combine(sets.precast.WS.wsd, {right_ear="スラッドピアス",}, sets.precast.WS.dmglim)
    -- sets.precast.WS['スターダイバー'].DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)

    -- sets.precast.WS['シェルクラッシャー'].DmgLim = sets.precast.WS.magic_acc
    -- sets.precast.WS['フルスイング'].DmgLim = set_combine(sets.precast.WS.wsd, sets.precast.WS.dmglim)
    -- sets.precast.WS['レトリビューション'].DmgLim = set_combine(sets.precast.WS.wsd, sets.precast.WS.dmglim)
    -- sets.precast.WS['シャッターソウル'].DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)

    sets.precast.JA['挑発'] = sets.EnmityBoost
    sets.precast.JA['ウォークライ'] = sets.EnmityBoost

    sets.midcast.magic_acc = {
        ammo="ペムフレドタスラム",
        head="極蜂屋半首",
        body="マリグナスタバード",
        hands={ name="極望月手甲", augments={'Enh. "Ninja Tool Expertise" effect',}},
        legs="マリグナスタイツ",
        feet={ name="極望月脚絆", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
        neck="インカンタートルク",
        waist="エスカンストーン",
        left_ear="昏黄の耳飾り",
        right_ear="ディグニタリピアス",
        left_ring="王将の指輪",
        right_ring="スティキニリング+1",
        back={ name="アンダルタマント", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.magic_atk = {
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        -- head={ name="ニャメヘルム", augments={'Path: B',}},
        head={ name="極望月半首", augments={'Enhances "Yonin" and "Innin" effect',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="極望月脚絆", augments={'Enh. Ninj. Mag. Acc/Cast Time Red.',}},
        neck={ name="ウォーダチャーム+1", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear="フリオミシピアス",
        right_ear="ディグニタリピアス",
        left_ring="スティキニリング+1",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back={ name="アンダルタマント", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast['忍術'] = {hands={ name="望月手甲改", augments={'Enh. "Ninja Tool Expertise" effect',}}, waist="ニヌルタサッシュ",}
    sets.midcast['忍術'].Utsusemi = {
        hands={ name="望月手甲改", augments={'Enh. "Ninja Tool Expertise" effect',}},
        feet="服部脚絆改",
        waist="ニヌルタサッシュ",
    }
    sets.midcast['忍術'].ElementalNinjutsu = sets.midcast.magic_atk
    sets.midcast['忍術'].EnhancingNinjutsu = {hands={ name="望月手甲改", augments={'Enh. "Ninja Tool Expertise" effect',}}, waist="ニヌルタサッシュ",}
    sets.midcast['忍術'].EnfeeblingNinjutsu = sets.midcast.magic_acc


    sets.idle = {
    ammo="伊達手裏剣",
    head="マリグナスシャポー",
    body="マリグナスタバード",
    hands="マリグナスグローブ",
    legs="ムンムケックス+2",
    feet="マリグナスブーツ",
    neck={ name="バーシチョーカー+1", augments={'Path: A',}},
    waist="フルームベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="ＶＣリング+1",
    back={ name="アンダルタマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }

    sets.engaged = {
        ammo="伊達手裏剣",
        head="乾闥婆陣鉢改",
        body="乾闥婆作務衣改",
        hands={ name="アデマリスト+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="乾闥婆筒袴改",
        feet="乾闥婆脛当改",
        neck={ name="忍者の喉輪+2", augments={'Path: A',}},
        waist="ウィンバフベルト+1",
        left_ear="昏黄の耳飾り",
        right_ear="テロスピアス",
        left_ring="守りの指輪",
        right_ring="ゲリリング",
        back={ name="アンダルタマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }

    sets.engaged.DT = {
        ammo="伊達手裏剣",
    head="乾闥婆陣鉢改",
    body="乾闥婆作務衣改",
    hands={ name="アデマリスト+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="ムンムケックス+2",
    feet="乾闥婆脛当改",
    neck="サンクトネックレス",
    waist="セールフィベルト+1",
    left_ear="ブランデシュピアス",
    right_ear="ブレードボンピアス",
    left_ring="ゲリリング",
    right_ring="エポナリング",
    back={ name="アンダルタマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }
end

function job_precast(spell, action, spellMap, eventArgs)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
end

function job_aftercast(spell, action, spellMap, eventArgs)
end

function job_post_aftercast(spell, action, spellMap, eventArgs)
end

function customize_idle_set(idleSet)
    local weapons = sets.weapons
    idleSet = set_combine(idleSet, weapons[state.Weapons.value])

    if state.Buff['死の宣告'] then
        idleSet = set_combine(idleSet, {waist="ギジドゥバサッシュ",}, {left_ring={ name="ブレンモドリング+1", bag="wardrobe5",}}, { right_ring={ name="ブレンモドリング+1", bag="wardrobe6",}})
    end
    return idleSet
end

function customize_melee_set(meleeSet)
    local weapons = sets.weapons
    meleeSet = set_combine(meleeSet, weapons[state.Weapons.value])

    if state.Buff['死の宣告'] then
        meleeSet = set_combine(meleeSet, {waist="ギジドゥバサッシュ",}, {left_ring={ name="ブレンモドリング+1", bag="wardrobe5",}}, { right_ring={ name="ブレンモドリング+1", bag="wardrobe6",}})
    end
    return meleeSet
end

function job_buff_change(buff, gain)
end

function job_update(cmdParams, eventArgs)
    if state.DisplayMode.value then update_job_states() end
end

--function select_default_macro_book()
--    set_macro_page(1, 20)
--end

--function mogmaster(job)
--    send_command('input /si '..job..';')
--end