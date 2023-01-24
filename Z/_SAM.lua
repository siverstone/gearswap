function get_sets()
    set_language('japanese')

    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    -- state.Buff['ラストリゾート'] = buffactive['ラストリゾート'] or false
    -- state.Buff['ダークシール'] = buffactive['ダークシール'] or false
    -- state.Buff['ネザーヴォイド'] = buffactive['ネザーヴォイド'] or false
    state.Buff['死の宣告'] = buffactive['死の宣告'] or false

    include('Mote-TreasureHunter')
    include('Mote-Display')

    include('auto_sam')
end

function user_setup()
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Normal', 'DmgLim')
    state.Weapons = M{['description']='Use Weapons', 'Umaru', 'ShiningOne'}

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
--    mogmaster('sam')
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
    sets.weapons.Umaru = {main={ name="鵜丸", augments={'Rng.Acc.+13','STR+12','DMG:+13',}},}
    sets.weapons.ShiningOne = {main="シャイニングワン",}

    sets.TreasureHunter = {
        head="白ララブキャップ+1",
        hands={ name="バロラスミトン", augments={'Pet: Haste+1','Rng.Acc.+16','"Treasure Hunter"+2','Accuracy+19 Attack+19','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        waist="チャークベルト",
    }

    sets.enmity = {
        ammo="サピエンスオーブ",
        head="ハリタスヘルム",
        body="エメットハーネス+1",
        hands="クーリスグローブ",
        neck="ロリケートトルク+1",
        waist="カシリベルト",
        left_ear="フリオミシピアス",
        right_ear="クリプティクピアス",
        left_ring="守りの指輪",
        right_ring="ＶＣリング+1",
        back="月光の羽衣",
    }

    sets.precast.FC = {
        ammo="サピエンスオーブ",
        body="サクロブレスト",
    hands={ name="レイライングローブ", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    neck="オルンミラトルク",
        waist="ニヌルタサッシュ",
        left_ear="エンチャンピアス+1",
        right_ear="ロケイシャスピアス",
        right_ring="ラハブリング",
    }

    sets.precast.WS = { -- Multi
    ammo="銀銭",
    head="フラマツッケット+2",
    body="フラマコラジン+2",
    hands="フラママノポラ+2",
    legs="フラマディル+2",
    feet="フラマガンビエラ+2",
    neck="フォシャゴルゲット",
    waist={ name="ケンタークベルト+1", augments={'Path: A',}},
    left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="スラッドピアス",
    left_ring="フラマリング",
    right_ring="シーリチリング",
    back={ name="スメルトリオマント", augments={'STR+3','"Dbl.Atk."+5',}},
    }

    sets.precast.WS.wsd = {
        ammo="ノブキエリ",
        head="ムパカキャップ",
        body={ name="極左近士胴丸", augments={'Enhances "Overwhelm" effect',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs="極脇戸板佩楯",
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="フォシャゴルゲット",
        -- waist={ name="セールフィベルト+1", augments={'Path: A',}},
        waist={ name="ケンタークベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="スラッドピアス",
        left_ring="王将の指輪",
        right_ring="ニックマドゥリング",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }

    
    sets.precast.WS.critical = {
        ammo="ノブキエリ",
        head="ムパカキャップ",
        body={ name="極左近士胴丸", augments={'Enhances "Overwhelm" effect',}},
        hands="フラママノポラ+2",
        legs="極脇戸板佩楯",
        feet="フラマガンビエラ+2",
        neck="フォシャゴルゲット",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="スラッドピアス",
        left_ring="王将の指輪",
        right_ring="ニックマドゥリング",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }

    sets.precast.WS.magic_acc = {
        ammo="ペムフレドタスラム",
        head="ムパカキャップ",
        body="フラマコラジン+2",
        hands="フラママノポラ+2",
        legs="フラマディル+2",
        feet="フラマガンビエラ+2",
        neck="サンクトネックレス",
        waist="エスカンストーン",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="ディグニタリピアス",
        left_ring="王将の指輪",
        right_ring="フラマリング",
        back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
    }

    sets.precast.WS.magic = {
    ammo="ノブキエリ",
    head="ニャメヘルム",
    body="ニャメメイル",
    hands="ニャメガントレ",
    legs="ニャメフランチャ",
    feet="ニャメソルレット",
    neck="サンクトネックレス",
    waist="イオスケハベルト+1",
    left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="フリオミシピアス",
    left_ring="エタナリング",
    right_ring="ニックマドゥリング",
    back="タカハマント",
    }

    -- 両手刀
    sets.precast.WS['壱之太刀・飛燕'] = sets.precast.WS
    sets.precast.WS['弐之太刀・鋒縛'] = sets.precast.WS.magic_acc
    sets.precast.WS['参之太刀・轟天'] = sets.precast.WS.magic
    sets.precast.WS['四之太刀・陽炎'] = sets.precast.WS.magic
    sets.precast.WS['五之太刀・陣風'] = sets.precast.WS.magic
    sets.precast.WS['六之太刀・光輝'] = sets.precast.WS.magic
    sets.precast.WS['七之太刀・雪風'] = sets.precast.WS.wsd
    sets.precast.WS['八之太刀・月光'] = sets.precast.WS.wsd
    sets.precast.WS['九之太刀・花車'] = sets.precast.WS.wsd
    sets.precast.WS['十一之太刀・鳳蝶'] = sets.precast.WS.magic_acc
    sets.precast.WS['祖之太刀・不動'] = sets.precast.WS.wsd
    sets.precast.WS['十二之太刀・照破'] = sets.precast.WS
    -- 両手槍
    sets.precast.WS['ダブルスラスト'] = sets.precast.WS
    sets.precast.WS['サンダースラスト'] = sets.precast.WS.wsd
    sets.precast.WS['ライデンスラスト'] = sets.precast.WS.wsd
    sets.precast.WS['足払い'] = sets.precast.WS.magic_acc
    sets.precast.WS['ペンタスラスト'] = sets.precast.WS
    sets.precast.WS['ボーパルスラスト'] = sets.precast.WS.critical
    sets.precast.WS['スキュアー'] = sets.precast.WS
    sets.precast.WS['大車輪'] = set_combine(sets.precast.WS.wsd, {right_ear="スラッドピアス",})
    sets.precast.WS['インパルスドライヴ'] = sets.precast.WS.critical
    sets.precast.WS['ソニックスラスト'] = sets.precast.WS.wsd
    sets.precast.WS['スターダイバー'] = sets.precast.WS

    -- sets.precast.WS.dmglim = {head={ name="スティンガヘルム+1", augments={'Path: A',}},}
    -- sets.precast.WS.DmgLim = set_combine(sets.precast.WS, sets.precast.WS.dmglim)

    sets.precast.JA['黙想'] =  {
        head="極脇戸桃形兜",
        hands="極左近士筒篭手",
        back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
    }

    sets.precast.JA['護摩の守護円'] = {head="極脇戸桃形兜",}
    
    -- サポ戦
    sets.precast.JA['挑発'] = sets.enmity
    -- サポ剣
    sets.precast.JA['ヴァレション'] = sets.enmity
    sets.precast.JA['ソードプレイ'] = sets.enmity
    sets.precast.JA['フルーグ'] = sets.enmity

    sets.idle = {
    ammo="昏黄の礫",
    head="クレパスクラヘルム",
    body="サクロブレスト",
    hands="ニャメガントレ",
    legs="ニャメフランチャ",
    feet="ニャメソルレット",
    neck="サンクトネックレス",
    waist="ギシドゥバサッシュ",
    left_ear="ブルタルピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="シーリチリング+1",
    right_ring="シーリチリング",
    back="月明の羽衣",
    }

    sets.engaged = {
    ammo="銀銭",
    head="ニャメヘルム",
    body="ニャメメイル",
    hands="ニャメガントレ",
    legs="ニャメフランチャ",
    feet="ニャメソルレット",
    neck="サンクトネックレス",
    waist="イオスケハベルト+1",
    left_ear="ブルタルピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="シーリチリング+1",
    right_ring="ニックマドゥリング",
    back="タカハマント",
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
    idleSet = set_combine(idleSet, weapons[state.Weapons.value], {sub=get_melee_set().sub})
    return idleSet
end

function customize_melee_set(meleeSet)
    local weapons = sets.weapons
    meleeSet = set_combine(meleeSet, weapons[state.Weapons.value])
    return meleeSet
end

function job_buff_change(buff, gain)
end

function job_update(cmdParams, eventArgs)
    if state.DisplayMode.value then update_job_states() end
end

--function select_default_macro_book()
--    set_macro_page(1, 9)
--end

--function mogmaster(job)
--    send_command('input /si '..job..';')
--end