function get_sets()
    set_language('japanese')

    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['エンボルド'] = buffactive['エンボルド'] or false
    state.Buff['ファストキャスト'] = buffactive['ファストキャスト'] or false
    state.Buff['死の宣告'] = buffactive['死の宣告'] or false
    state.Buff['睡眠'] = buffactive['睡眠'] or false

    include('Mote-TreasureHunter')
    include('Mote-Display')

    include('auto_run')

--    include('spell_catcher')

--    spell_catcher_detect_spell.phalanx_2.begin_cmd = 'gs c phalanx'
--    spell_catcher_detect_spell.phalanx_2.finish_cmd = 'gs c update user'
--    spell_catcher_detect_spell_accession.phalanx.begin_cmd = 'gs c phalanx'
--    spell_catcher_detect_spell_accession.phalanx.finish_cmd = 'gs c update user'
end

function user_setup()
    state.OffenseMode:options('Normal', 'MagicEvasion', 'Evasion','Stp')
    state.HybridMode:options('Normal', 'KnockBack')
    state.WeaponskillMode:options('Normal')
    state.IdleMode:options('Normal', 'Evasion','Stp')
    state.Weapons = M{['description']='Use Weapons', 'Epeolatry', 'Lycurgos'}

    init_auto_mode()

    state.SIRD = M(false, "SIRD")

    bool_state = {
        {label='SIRD', mode='SIRD'},
        {label='AutoWS', mode='AutoWS'}
    }

    mode_state = {
        {label='Auto', mode='AutoMode'},
        {label='Offense', mode='OffenseMode'},
        {label='Hybrid', mode='HybridMode'},
--        {label='WS', mode='WeaponskillMode'},
        {label='Weapon', mode='Weapons'},
        {label='Rune', mode='AutoRune'},
        }
    init_job_states(bool_state, mode_state)
--    select_default_macro_book()
--    mogmaster('run')
end

function binds_on_load()
    send_command('bind f1 gs c cycle OffenseMode; gs c cycle IdleMode')
    send_command('bind ^f1 gs c cycle HybridMode')
    send_command('bind f2 gs c cycle WeaponskillMode')
    send_command('bind ^f2 gs c cycle Weapons')
    send_command('bind f3 gs c cycle AutoMode')
    send_command('bind ^f3 gs c cycle AutoRune')
    send_command('bind f4 gs c update user')
    send_command('bind ^f4 gs c cycle TreasureMode')
    send_command('bind f5 gs c cycle AutoWS')

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
    send_command('unbind ^f3')
    send_command('unbind f4')
    send_command('unbind ^f4')
    send_command('unbind f5')

    -- send_command('unbind ^-')
    -- send_command('unbind ^=')
end

function user_unload()
end

function init_gear_sets()
    sets.weapons = {}
    sets.weapons.Epeolatry = {main="エピオラトリー",}
    sets.weapons.Lycurgos = {main="ライカーゴス",}

    sets.TreasureHunter = {
        ammo="完璧な幸運の卵",
--        head="白ララブキャップ+1",
    hands={ name="ヘルクリアグローブ", augments={'Attack+13','Weapon skill damage +2%','"Treasure Hunter"+2','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
        waist="チャークベルト",
    }

    sets.EnmityBoost = {
        ammo="サピエンスオーブ",
        head={ name="ハリタスヘルム", hp=88,},
        body={ name="エメットハーネス+1", augments={'Path: A',}, hp=61,},
        hands={ name="クーリスグローブ", hp=25,},
        legs={ name="ＥＲレグガード+3", hp=100,},
        feet={ name="ＥＲグリーヴ+3", hp=48,},
        neck={ name="アンムーヴカラー+1", augments={'Path: A',}, hp=200,},
        waist={ name="トランスベルト", hp=14,},
        left_ear={ name="クリプティクピアス", hp=40,},
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}, hp=110,},
        left_ring="プロボカレリング",
        right_ring={ name="アイワツリング", hp=70,},
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}, hp=80,},
    }

    sets.precast.FC = {
        ammo={ name="サピエンスオーブ", fc=0.02,},
        head={ name="ＲＮバンド+3", fc=0.14, hp=109,},
        body={ name="ＥＲサーコート+3", fc=0.13, hp=143,},
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}, fc=0.08, hp=25,},
    legs={ name="ＦＵトラウザ+3", augments={'Enhances "Inspire" effect',}, fc=0.15, hp=107,},
        feet={ name="カマイングリーヴ+1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}, fc=0.08, hp=95,},
    neck={ name="アンムーヴカラー+1", augments={'Path: A',}, hp=200,},
        waist={ name="ジーゲルサッシュ", fc=0.08,},
    left_ear={ name="ロケイシャスピアス", fc=0.02,},
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}, hp=110,},
        left_ring={ name="キシャールリング", fc=0.04,},
        right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}, hp=110,},
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Phys. dmg. taken-10%',}, fc=0.1, hp=60,},
    }

    sets.precast.FC['ファストキャスト'] = {
        head={ name="ＲＮバンド+3", fc=0.14, hp=109,},
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}, fc=0.08, hp=25,},
    }

    sets.precast.WS = { -- Multi
    ammo="ノブキエリ",
    head="アヤモツッケット+2",
    body="アヤモコラッツァ+2",
    hands={ name="アデマリスト", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs="メガナダショウス+2",
    feet={ name="ヘルクリアブーツ", augments={'Accuracy+30','"Triple Atk."+3','AGI+7',}},
    neck="フォシャゴルゲット",
    waist="ケンタークベルト+1",
    left_ear="シェリダピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="ペトロフリング",
    right_ring="エポナリング",
    back={ name="ディバートケープ", augments={'Enmity+4','"Embolden"+15','"Dbl.Atk."+3','Damage taken-1%',}},
    }

    sets.precast.WS.dex = {
        ammo="ノブキエリ",
        head={ name="アヤモツッケット+2", hp=45},
        body={ name="アヤモコラッツァ+2", hp=57},
        hands={ name="アヤモマノポラ+2", hp=22},
        legs={ name="アヤモコッシャレ+2", hp=45},
        feet={ name="アヤモガンビエラ+2", hp=11},
    neck={ name="アンムーヴカラー+1", augments={'Path: A',}, hp=200,},
        waist="フォシャベルト",
        left_ear={ name="クリプティクピアス", hp=40,},
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}, hp=110,},
    left_ring={ name="月明の指輪", hp=100,},
        right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}, hp=110,},
        back={ name="オーグマケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    sets.precast.WS.acc = {
        ammo="ヤメラング",
        head={ name="ＥＲガレア+3", hp=111,},
        body={ name="ＥＲサーコート+3", hp=143,},
    hands={ name="ＥＲガントレ+2", hp=49,},
        legs={ name="ＥＲレグガード+3", hp=100,},
        feet={ name="ＥＲグリーヴ+3", hp=48,},
    neck="月明の首飾り",
        waist={ name="エスカンストーン", hp=20,},
        left_ear="ディグニタリピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring={ name="月明の指輪", hp=100,},
        right_ring={ name="エタナリング", hp=60,},
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}, hp=80,},
    }

    -- 両手剣
    sets.precast.WS['デミディエーション'] = sets.precast.WS.dex 
    sets.precast.WS['レゾルーション'] = sets.precast.WS
    sets.precast.WS['グラウンドストライク'] = sets.precast.WS.dex
    sets.precast.WS['スピンスラッシュ'] = sets.precast.WS.dex
    sets.precast.WS['ショックウェーブ'] = sets.precast.WS.acc

    -- 両手斧
    sets.precast.WS['アーマーブレイク'] = sets.precast.WS.acc
    sets.precast.WS['ウェポンブレイク'] = sets.precast.WS.acc
    sets.precast.WS['フルグレイク'] = sets.precast.WS.acc

    sets.precast.JA['ヴァレション'] = set_combine(
        sets.EnmityBoost,
        {
            body={ name="ＲＮコート+3", hp=218,},
            legs={ name="ＦＵトラウザ+3", augments={'Enhances "Inspire" effect',}, hp=107,},
            back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}, hp=80,},
        })
    sets.precast.JA['ヴァリエンス'] = sets.precast.JA['ヴァレション']
    sets.precast.JA['リエモン'] = set_combine(sets.precast.JA['ヴァレション'], {body={ name="ＦＵコート+3", augments={'Enhances "Elemental Sforzo" effect',}, hp=119,},})
    sets.precast.JA['エンボルド'] = {back={ name="ディバートケープ", augments={'Enmity+4','"Embolden"+15','"Dbl.Atk."+3','Damage taken-1%',}},}
    sets.precast.JA['ビベイシャス'] = {head={ name="ＥＲガレア+3", hp=111,}}
    sets.precast.JA['ガンビット'] = set_combine(sets.EnmityBoost, {hands={ name="ＲＮミトン+3", hp=85,}})
    sets.precast.JA['レイク'] = set_combine(sets.EnmityBoost, {feet={ name="ＦＵブーツ+1", augments={'Enhances "Rayke" effect',}, hp=13,}})
    sets.precast.JA['バットゥタ'] = set_combine(sets.EnmityBoost, {head={ name="ＦＵバンド+3", augments={'Enhances "Battuta" effect',}, hp=56,}})
    sets.precast.JA['ワンフォアオール'] = {
        ammo="ストンチタスラム+1",
        head={ name="ＲＮバンド+3", hp=111,},
        body={ name="ＲＮコート+3", hp=218,},
        hands={ name="ＲＮミトン+3", hp=85,},
        legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}, hp=130,},
        feet={ name="カマイングリーヴ+1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}, hp=95,},
        neck={ name="アンムーヴカラー+1", augments={'Path: A',}, hp=200,},
    waist={ name="エスカンストーン", hp=20,},
    left_ear={ name="クリプティクピアス", hp=40,},
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}, hp=110,},
    left_ring={ name="月明の指輪", hp=100,},
        right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}, hp=110,},
    back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}, hp=80,},
    }
    sets.precast.JA['フルーグ'] = set_combine(sets.EnmityBoost, {feet={ name="ＲＮブーツ+2", hp=64,}})
    sets.precast.JA['ソードプレイ'] = sets.EnmityBoost
    sets.precast.JA['E.スフォルツォ'] = set_combine(sets.EnmityBoost, {body={ name="ＦＵコート+3", augments={'Enhances "Elemental Sforzo" effect',}, hp=119,},})

    -- sub war
    sets.precast.JA['挑発'] = sets.EnmityBoost
    sets.precast.JA['ウォークライ'] = sets.EnmityBoost

    -- sub pld
    sets.precast.JA['センチネル'] = sets.EnmityBoost

    -- sub drk
    sets.precast.JA['ラストリゾート'] = sets.EnmityBoost
    
    sets.midcast.enhance_duration = {
        head={ name="ＥＲガレア+3", hp=111,},
        legs={ name="ＦＵトラウザ+3", augments={'Enhances "Inspire" effect',}, hp=107},
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}, fc=0.1, hp=80},
    }

    sets.midcast['強化魔法'] = sets.midcast.enhance_duration

    sets.midcast.enhancing_skill = {
    ammo="ストンチタスラム",
    head={ name="カマインマスク", augments={'HP+60','STR+10','INT+10',}},
        body={ name="ＦＵコート+3", augments={'Enhances "Elemental Sforzo" effect',}, hp=119,},
    hands="ＲＮミトン+3",
    legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
        feet={ name="ＥＲグリーヴ+3", hp=48,},
    neck={ name="バーシチョーカー+1", augments={'Path: A',}},
    waist="ギシドゥバサッシュ",
    left_ear="アンドアーピアス",
    right_ear="ミミルピアス",
    left_ring="守りの指輪",
    right_ring="ＶＣリング+1",
    back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},
    }

    sets.midcast['強化魔法']['ファランクス'] = {
        ammo="ストンチタスラム",
    head={ head={ name="ＦＵバンド+3", augments={'Enhances "Battuta" effect',}, hp=56,}},
        body={ name="ヘルクリアベスト", augments={'Pet: STR+3','Haste+1','Phalanx +5','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    hands={ name="ヘルクリアグローブ", augments={'INT+4','Pet: "Regen"+1','Phalanx +4',}},
    legs={ name="ヘルクリアトラウザ", augments={'Mag. Acc.+11','Pet: Attack+15 Pet: Rng.Atk.+15','Phalanx +4','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    feet={ name="ヘルクリアブーツ", augments={'STR+11','Crit. hit damage +3%','Phalanx +4','Accuracy+14 Attack+14','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
        neck={ name="フサルクトルク+2", hp=60,},
        waist="オリンポスサッシュ",
        left_ear={ name="トゥイストピアス", hp=150,},
        right_ear={ name="エテオレートピアス", hp=50,},
        left_ring="守りの指輪",
        right_ring="ＶＣリング+1",
        back={ name="月光の羽衣", hp=275,},
    }

    sets.midcast.sird = {
        ammo="ストンチタスラム+1",
        head={ name="ＥＲガレア+3", hp=111,},
        body={ name="ＦＵコート+3", augments={'Enhances "Elemental Sforzo" effect',}, hp=119,},
    hands={ name="ローハイドグローブ", augments={'HP+50','Accuracy+15','Evasion+20',}, hp=75,},
        legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}, hp=130},
        feet={ name="ＥＲグリーヴ+3", hp=48,},
    neck="月明の首飾り",
        waist="オドンブラサッシュ",
        left_ear="磁界の耳",
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}, hp=110,},
        left_ring="守りの指輪",
        right_ring="ＶＣリング+1",
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Spell interruption rate down-10%',}, hp=60,},
    }

    sets.midcast['強化魔法']['ストンスキン']  = {
        body={ name="ＦＵコート+3", augments={'Enhances "Elemental Sforzo" effect',}, hp=119,},
        neck="ストーンゴルゲット",
        waist="ジーゲルサッシュ",
        left_ear="アースクライピアス",
        right_ring={ name="月光の指輪", hp=110,},
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}, fc=0.1, hp=80},
    }

    sets.midcast['強化魔法'].Regen = set_combine(sets.midcast.enhance_duration, {head="ＲＮバンド+3", neck="サクロゴルゲット", waist="スローダベルト",right_ear="エリラズピアス+1",})
    sets.midcast['強化魔法'].Refresh = set_combine(sets.midcast.enhance_duration, {waist="ギシドゥバサッシュ",})
    sets.midcast['強化魔法']['ストライ'] = sets.midcast.enhancing_skill
    sets.midcast['強化魔法'].BarElement = sets.midcast.enhancing_skill
    sets.midcast['強化魔法']['エンボルド'] = {back={ name="ディバートケープ", augments={'Enmity+4','"Embolden"+15','"Dbl.Atk."+3','Damage taken-1%',}},}
    sets.midcast['強化魔法']['フォイル'] = sets.EnmityBoost
    sets.midcast['強化魔法']['アクアベール'] = sets.midcast.sird

    sets.midcast['神聖魔法'] = {
        ['フラッシュ'] = sets.EnmityBoost
    }

    sets.midcast['暗黒魔法'] ={
        ['スタン'] = sets.EnmityBoost
    }

    sets.midcast['回復魔法'] = {}
    sets.midcast['回復魔法'].Cure = {
        neck="サクロゴルゲット",
        waist="スローダベルト",
        left_ear="メンデカントピアス",
        right_ring="ＶＣリング+1",
    }

    sets.midcast['青魔法'] = {
        ['ブランクゲイス'] = sets.EnmityBoost,
        ['ガイストウォール'] = sets.EnmityBoost,
        ['シープソング'] = sets.EnmityBoost,
        ['サペリフィック'] = sets.EnmityBoost,
        ['スティンキングガス'] = sets.EnmityBoost,
        ['ブラッドセイバー'] = sets.EnmityBoost,
        ['ジェタチュラ'] = sets.EnmityBoost,
        ['フライトフルロア'] = sets.EnmityBoost,
        ['コクーン'] = sets.EnmityBoost,
        ['いやしの風'] = sets.midcast['回復魔法'].Cure,
        ['マジックフルーツ'] = sets.midcast['回復魔法'].Cure,
    }

    sets.idle = {
        sub="メンシストラップ+1",
        ammo="ストンチタスラム+1",
        head={ name="ＥＲガレア+3", hp=111,},
        body={ name="ＲＮコート+3", hp=218,},
        hands={ name="トゥルムミトン+1", hp=74,},
        legs={ name="ＥＲレグガード+3", hp=100,},
        feet={ name="ＥＲグリーヴ+3", hp=48,},
        neck={ name="アンムーヴカラー+1", augments={'Path: A',}, hp=200,},
        waist="エングレイブベルト",
        left_ear={ name="トゥイストピアス", hp=150,},
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}, hp=110,},
    left_ring={ name="月明の指輪", hp=100,},
        right_ring="ＶＣリング+1",
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}, hp=80,},
    }

    sets.idle.MagicEvasion = {
    sub="メンシストラップ+1",
    ammo="ストンチタスラム+1",
    head="ニャメヘルム",
    body="ニャメメイル",
    hands="ニャメガントレ",
    legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
    feet={ name="ヒポメネソックス+1", augments={'Path: A',}},
    neck="サンクトネックレス",
    waist="エングレイブベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="シーリチリング+1",
    back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
    }
    
    sets.idle.Evasion = {
    sub="メンシストラップ+1",
    ammo="ストンチタスラム+1",
    head="ニャメヘルム",
    body="ニャメメイル",
    hands="ニャメガントレ",
    legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
    feet={ name="ヒポメネソックス+1", augments={'Path: A',}},
    neck="サンクトネックレス",
    waist="エングレイブベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="シーリチリング+1",
    back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
    }
    
    sets.idle.Stp = {
        sub="ウトゥグリップ",
        ammo="ストンチタスラム+1",
        head={ head={ name="ＦＵバンド+3", augments={'Enhances "Battuta" effect',}, hp=56,}},
        body="ＲＮコート+3",
        hands={ name="トゥルムミトン+1", hp=74,},
        legs={ name="ＥＲレグガード+3", hp=100,},
        feet={ name="ＥＲグリーヴ+3", hp=48,},
    neck={ name="バーシチョーカー+1", augments={'Path: A',}},
    waist="フルームベルト",
    left_ear="幽界の耳",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="シーリチリング+1",
    back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged = {
        sub="メンシストラップ+1",
        ammo="ストンチタスラム+1",
        head={ name="ＥＲガレア+3", hp=111,},
        body={ name="ＥＲサーコート+3", hp=143,},
        hands={ name="トゥルムミトン+1", hp=74,},
        legs={ name="ＥＲレグガード+3", hp=100,},
        feet={ name="ＥＲグリーヴ+3", hp=48,},
        neck={ name="アンムーヴカラー+1", augments={'Path: A',}, hp=200,},
        waist="エングレイブベルト",
        left_ear={ name="トゥイストピアス", hp=150,},
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}, hp=110,},
    left_ring={ name="月明の指輪", hp=100,},
        right_ring="ＶＣリング+1",
        back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}, hp=80,},
    }

    sets.engaged.MagicEvasion = {
    sub="メンシストラップ+1",
    ammo="ストンチタスラム+1",
    head="ニャメヘルム",
    body="ニャメメイル",
    hands="ニャメガントレ",
    legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
    feet={ name="ヒポメネソックス+1", augments={'Path: A',}},
    neck="ウォーダチャーム+1",
    waist="エングレイブベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="ＶＣリング+1",
    back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Evasion = {
    sub="メンシストラップ+1",
    ammo="ストンチタスラム+1",
    head="ニャメヘルム",
    body="ニャメメイル",
    hands="ニャメガントレ",
    legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
    feet={ name="ヒポメネソックス+1", augments={'Path: A',}},
    neck="ウォーダチャーム+1",
    waist="フルームベルト",
    left_ear="トゥイストピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="ＶＣリング+1",
    back={ name="オーグマケープ", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Stp = {
    sub="ウトゥグリップ",
    ammo="ヤメラング",
    head={ name="ブリスタサリット+1", augments={'Path: A',}},
    body="アヤモコラッツァ+2",
    hands={ name="アデマリスト+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="メガナダショウス+2",
        feet={ name="カマイングリーヴ+1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}, fc=0.08, hp=95,},
    neck={ name="ウォーダチャーム+1", augments={'Path: A',}},
    waist={ name="セールフィベルト+1", augments={'Path: A',}},
    left_ear="シェリダピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="ニックマドゥリング",
    right_ring="シーリチリング+1",
    back={ name="オーグマケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
end

function job_precast(spell, action, spellMap, eventArgs)
    if state.Buff['ファストキャスト'] then
        classes.CustomClass = 'ファストキャスト'
    end
    custom_aftermath_timers_precast(spell)
end

function job_post_precast(spell, action, spellMap, eventArgs)
    set_priorities_by_hp()
end

function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if (player.status == 'Idle' or player.status == '') and player.hp > 0 then
            equip(get_idle_set())
        elseif player.status == 'Engaged' then
            equip(get_melee_set())
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)

    if state.SIRD.current == 'on' then
        state.SIRD:set('off')
        equip(sets.midcast.sird)
    end

    if spell.skill == '強化魔法' and state.Buff['エンボルド'] then
        equip(sets.midcast['強化魔法']['エンボルド'])
    end

    set_priorities_by_hp()
end

function job_aftercast(spell, action, spellMap, eventArgs)
    custom_aftermath_timers_aftercast(spell)
end

function job_post_aftercast(spell, action, spellMap, eventArgs)
    set_priorities_by_hp()
end

function customize_idle_set(idleSet)
    local weapons = sets.weapons
    idleSet = set_combine(idleSet, weapons[state.Weapons.value], {sub=get_melee_set().sub})

    if state.Buff['死の宣告'] then
        idleSet = set_combine(idleSet, {neck="ニカンダネックレス",}, {waist="ギジドゥバサッシュ",}, {left_ring={ name="ブレンモドリング+1", bag="wardrobe5",}}, { right_ring={ name="ブレンモドリング+1", bag="wardrobe6",}})
    end
    return idleSet
end

function customize_melee_set(meleeSet)
    local weapons = sets.weapons
    meleeSet = set_combine(meleeSet, weapons[state.Weapons.value])

    if state.Buff['死の宣告'] then
        meleeSet = set_combine(meleeSet, {neck="ニカンダネックレス",}, {waist="ギジドゥバサッシュ",}, {left_ring={ name="ブレンモドリング+1", bag="wardrobe5",}}, { right_ring={ name="ブレンモドリング+1", bag="wardrobe6",}})
    elseif state.Buff['睡眠'] then
        meleeSet = set_combine(meleeSet, {head="フレンジーサリット",})
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
    if cmdParams[1] == 'rune' then
        windower.chat.input('/ja "'..windower.to_shift_jis(state.AutoRune.value) ..'" <me>')
    elseif cmdParams[1] == 'phalanx' then
        local set_equip = nil
        set_equip = sets.midcast['強化魔法']['ファランクス'] 
        if buffactive['エンボルド'] then
            set_equip = set_combine(set_equip, {back={ name="ディバートケープ", augments={'Enmity+4','"Embolden"+15','"Dbl.Atk."+3','Damage taken-1%',}},})
        end
        equip(set_equip)
        set_priorities_by_hp()
    end
end

--function select_default_macro_book()
--    set_macro_page(1, 17)
--end

--function mogmaster(job)
--    send_command('input /si '..job..';')
--end

function set_priorities_by_hp()
    local future,current = gearswap.equip_list,gearswap.equip_list_history
    function get_hp(piece)
        if piece and type(piece)=='table' and piece.hp and type(piece.hp)=='number' then
            return piece.hp
        end
        return 0
    end
    local diff = {}
    for i,v in pairs(future) do
        local priority = get_hp(future[i]) - get_hp(current[i])
        if type(v) == 'table' then
            future[i].priority = priority
        else
            future[i] = {name=v,priority=priority}
        end
        -- windower.add_to_chat(123,future[i].name.." priority="..future[i].priority)
    end
end