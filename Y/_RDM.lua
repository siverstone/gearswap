function get_sets()
    set_language('japanese')

    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['サボトゥール'] = buffactive['サボトゥール'] or false
    state.Buff['コンポージャー'] = buffactive['コンポージャー'] or false

    enfeeble_spell_maps = {
        ['パライズ']='MND', ['パライズII']='MND', ['スロウ']='MND', ['スロウII']='MND', ['アドル']='MND', ['アドルII']='MND',
        ['ディストラ']='MND_Skill', ['ディストラII']='MND_Skill', ['ディストラIII']='MND_Skill', ['フラズルIII']='MND_Skill',
        ['ディア']='MND_Acc', ['ディアII']='MND_Acc', ['ディアIII']='MND_Acc', ['サイレス']='MND_Acc', ['フラズル']='MND_Acc', ['フラズルII']='MND_Acc',
        ['ブライン']='INT', ['ブラインII']='INT', ['グラビデ']='INT', ['グラビデII']='INT',
        ['ポイズン']='INT_Skill', ['ポイズンII']='INT_Skill',
        ['スリプル']='INT_Acc', ['スリプルII']='INT_Acc', ['スリプガ']='INT_Acc', ['バインド']='INT_Acc', ['ブレイク']='INT_Acc',
    }

    enfeeble_spell_maps_saboteur = {
        ['スリプル']='Saboteur', ['スリプルII']='Saboteur', ['スリプガ']='Saboteur',
        ['バインド']='Saboteur', ['ブレイク']='Saboteur', ['サイレス']='Saboteur',
        ['ディア']='Saboteur', ['ディアII']='Saboteur', ['ディアIII']='Saboteur',['ポイズン']='Saboteur', ['ポイズンII']='Saboteur',
    }

    include('Mote-TreasureHunter')
    include('Mote-Display')
    include('weather_obi')
--    include('lockstyle')
    include('auto_rdm')
--    include('mystyle')
end

function user_setup()
    state.OffenseMode:options('Normal', 'SubtleBlow', 'DW31', 'EnSpell')
    state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Normal')
    state.CastingMode:options('MB', 'Normal')
    state.IdleMode:options('Normal', 'Refresh')
    state.Weapons = M{
        ['description']='Use Weapons', 
--        'Crocea_C',
--        'Crocea_B',
        'Naegling',
        'Tauret',
--        'Mandau',
--        'Crocea_C_DayBreak',
        'D1',
        'Club',
--        'Crocea_C_Levante',
    }

    init_auto_mode()

    state.Hi_EnSpell = M(false, 'High EnSpell')
    state.Immunobreak = M(false, "Immunobreak")

    bool_state = {
        {label='Hi-EnSpell', mode='Hi_EnSpell', alys_disp=false},
        {label='Immunobreak', mode='Immunobreak', alys_disp=false},
        {label='AutoWS', mode='AutoWS'},
        }
    mode_state = {
        {label='Auto', mode='AutoMode'},
        {label='Offense', mode='OffenseMode'},
        {label='Cast', mode='CastingMode'},
        {label='Idle', mode='IdleMode'},
        {label='Weapon', mode='Weapons'},
        }
    init_job_states(bool_state, mode_state)
--    select_default_macro_book()
--    mogmaster('rdm')
end

function binds_on_load()
    send_command('bind f1 gs c cycle OffenseMode')
    send_command('bind ^f1 gs c cycle HybridMode')
    send_command('bind f2 gs c cycle WeaponskillMode')
    send_command('bind ^f2 gs c cycle Weapons')
    send_command('bind f3 gs c cycle IdleMode')
    send_command('bind ^f3 gs c cycle CastingMode')
    send_command('bind f4 gs c update user')
    send_command('bind ^f4 gs c cycle TreasureMode')
    send_command('bind f5 gs c toggle Hi_EnSpell')
    send_command('bind ^f5 gs c cycle AutoWS')

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
    send_command('unbind ^f5')
end

function user_unload()
end

function init_gear_sets()
    sets.weapons = {}
    -- sets.weapons.Crocea_C_DW = {main={ name="クロセアモース", augments={'Path: C',}}, sub="トーレット",}
--    crocea_c_dw = {main={ name="クロセアモース", augments={'Path: C',}}, sub="ターニオンダガー+1",}
--    crocea_b_dw = {main={ name="クロセアモース", augments={'Path: B',}}, sub="ターニオンダガー+1",}
--    crocea_c_daybreak_dw = {main={ name="クロセアモース", augments={'Path: C',}}, sub="デイブレイクワンド",}
--    crocea_c_levante_dw = {main={ name="クロセアモース", augments={'Path: C',}}, sub="レヴァンテダガー",}
    Club_dw = {main="マクセンチアス", sub="トーレット"}
    Naegling_dw = {main="ネイグリング", sub="シブロン"}
    tauret_dw = {main="トーレット", sub="マレヴォレンス"}
--    mandau_dw = {main="マンダウ", sub="ターニオンダガー+1"}
    d1_dw = {main="クトゥルブナイフ", sub="ノルギッシュダガー",}

    crocea_c = {main={ name="クロセアモース", augments={'Path: C',}}, sub="サクロバルワーク",}
    crocea_b = {main={ name="クロセアモース", augments={'Path: B',}}, sub="サクロバルワーク",}
    crocea_c_daybreak = {main={ name="クロセアモース", augments={'Path: C',}}, sub="サクロバルワーク",}
    crocea_c_levante = {main={ name="クロセアモース", augments={'Path: C',}}, sub="サクロバルワーク",}
    Club = {main="マクセンチアス", sub="サクロバルワーク"}
    Naegling = {main="ネイグリング", sub={ name="フォフェンド+1", augments={'Path: A',}}}
    tauret = {main="トーレット", sub="サクロバルワーク"}
    mandau = {main="マンダウ", sub="サクロバルワーク"}
    d1 = {main="クトゥルブナイフ", sub="サクロバルワーク",}

--    sets.weapons.Enfeeble_MND = {main="デイブレイクワンド", sub="アムラピシールド",}
--    sets.weapons.Enfeeble_MND_DW = {main="マクセンチアス", sub="デイブレイクワンド",}

--    sets.weapons.Enfeeble_dispelga = {main="デイブレイクワンド", sub="アムラピシールド",}
--    sets.weapons.Enfeeble_dispelga_DW = {main="デイブレイクワンド", sub="マクセンチアス",}

--    sets.weapons.Enfeeble_INT = {main="ネイグリング", sub="アムラピシールド",}
--    sets.weapons.Enfeeble_INT_DW = {main="ネイグリング", sub="マクセンチアス",}

--    sets.weapons.Enfeeble_Acc = {main="クロセアモース", sub="アムラピシールド",}
--    sets.weapons.Enfeeble_Acc_DW = {main="クロセアモース", sub="マクセンチアス",}

    sets.TreasureHunter = {
        head="ヴォルトキャップ",
        legs={ name="マーリンシャルワ", augments={'CHR+9','MND+2','"Treasure Hunter"+2',}},
        waist="チャークベルト",
    }

    sets.precast.FC = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head="ＡＴシャポー+2",
    body="ロゼトジャズラン+1",
    hands={ name="レイライングローブ", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="マリグナスブーツ",
    neck="オルンミラトルク",
    waist="サクロコード",
    left_ear="ロケイシャスピアス",
    right_ear="マリグナスピアス",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.precast.FC.Phalanx = {
        back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.precast.FC['インパクト'] = {
        head=empty,
        body="トワイライトプリス",
    hands={ name="レイライングローブ", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
        legs="アヤモコッシャレ+2",
        feet={ name="マーリンクラッコー", augments={'Mag. Acc.+10 "Mag.Atk.Bns."+10','"Fast Cast"+7',}},
        waist="エンブラサッシュ",
        left_ear="エテオレートピアス",
        back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.precast.FC['ディスペガ'] = set_combine(sets.precast.FC, {main="デイブレイクワンド",})

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {waist="ニヌルタサッシュ",})

    sets.precast.WS = { -- Multi
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ブリスタサリット+1",
    body="マリグナスタバード",
    hands="マリグナスグローブ",
    legs="マリグナスタイツ",
    feet="マリグナスブーツ",
    neck="フォシャゴルゲット",
    waist="セールフィベルト+1",
    left_ear="シェリダピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="カコエシクリング",
    right_ring="エタナリング",
    back="ヴェスピッドマント",
    }

    sets.precast.WS.magic = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ＬＴシャペル+2",
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs="ＬＴフュゾー+2",
    feet="ＬＴウゾー+2",
    neck="シビルスカーフ",
    waist="サクロコード",
    left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="女王の指輪+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.precast.WS.magic_dark = {
        ammo="ペムフレドタスラム",
        head="妖蟲の髪飾り+1",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands="ジャリカフス+2",
        legs={ name="ＡＭスロップス+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet={ name="ＡＭネール+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck="水影の首飾り",
        waist="オルペウスサッシュ",
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="フレキリング",
        right_ring="アルコンリング",
        back={ name="スセロスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},
    }

    sets.precast.WS.critical = {
    ammo="ホミリアリ",
    head="ブリスタサリット+1",
    body="マリグナスタバード",
    hands="マリグナスグローブ",
    legs="マリグナスタイツ",
    feet="マリグナスブーツ",
    neck="フォシャゴルゲット",
    waist="セールフィベルト+1",
    left_ear="シェリダピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="カコエシクリング",
    right_ring="アヤモリング",
    back="ヴェスピッドマント",
    }

    sets.precast.WS.wsd = {
    ammo="オシャシャの原論文",
    head="ＬＴシャペル+2",
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs="ＬＴフュゾー+2",
    feet="ＬＴウゾー+2",
    neck="フォシャゴルゲット",
    waist="フォシャベルト",
    left_ear="シェリダピアス",
    right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="イラブラットリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.precast.WS['ガストスラッシュ'] = sets.precast.WS.magic
    sets.precast.WS['サイクロン'] = sets.precast.WS.magic
    sets.precast.WS['エナジースティール'] = sets.precast.WS.magic
    sets.precast.WS['エナジードレイン'] = sets.precast.WS.magic
    sets.precast.WS['イオリアンエッジ'] = sets.precast.WS.magic
    sets.precast.WS['エヴィサレーション'] = sets.precast.WS.critical
    sets.precast.WS['マーシーストローク'] = sets.precast.WS.wsd
    
    sets.precast.WS['バーニングブレード'] = sets.precast.WS.magic
    sets.precast.WS['レッドロータス'] = sets.precast.WS.magic
    sets.precast.WS['シャインブレード'] = sets.precast.WS.magic
    sets.precast.WS['セラフブレード'] = sets.precast.WS.magic
    sets.precast.WS['サンギンブレード'] = sets.precast.WS.magic_dark
    sets.precast.WS['サベッジブレード'] = sets.precast.WS.wsd
    sets.precast.WS['シャンデュシニュ'] = sets.precast.WS.critical
    sets.precast.WS['レクイエスカット'] = sets.precast.WS
    sets.precast.WS['サークルブレード'] = sets.precast.WS.wsd

    sets.precast.JA['連続魔'] =  {body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},}

    sets.midcast['強化魔法'] = {
    ammo="ホミリアリ",
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="テルキネシャジュブ", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="ＶＩグローブ+1", augments={'Enhancing Magic duration',}},
    legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
    feet="ＬＴウゾー+2",
    neck="デュエルトルク",
    waist="エンブラサッシュ",
    left_ear="アンドアーピアス",
    right_ear="ミミルピアス",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    -- sets.midcast.Enhancing_Others = {
    sets.midcast['強化魔法'].Others = {
    ammo="ホミリアリ",
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="テルキネシャジュブ", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="ＶＩグローブ+1", augments={'Enhancing Magic duration',}},
    legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
    feet="ＬＴウゾー+2",
    neck="デュエルトルク",
    waist="エンブラサッシュ",
    left_ear="アンドアーピアス",
    right_ear="ミミルピアス",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast.enhancing_skill = {
--    main="プクラトムージュ+1",
--    sub={ name="フォフェンド+1", augments={'Path: A',}},
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="ＶＩタバード+1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="ＶＩグローブ+1", augments={'Enhancing Magic duration',}},
    legs="ＡＴタイツ+2",
    feet="ＬＴウゾー+2",
    neck="メリックトルク",
    waist="オリンポスサッシュ",
    left_ear="ミミルピアス",
    right_ear="アンドアーピアス",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +6','Enha.mag. skill +8','Enh. Mag. eff. dur. +20',}},
    }

    sets.midcast.enhancing_skill_500 = {
    ammo="ホミリアリ",
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="テルキネシャジュブ", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="ＶＩグローブ+1", augments={'Enhancing Magic duration',}},
    legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
    feet="ＬＴウゾー+2",
    neck="デュエルトルク",
    waist="エンブラサッシュ",
    left_ear="アンドアーピアス",
    right_ear="ミミルピアス",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['強化魔法'].EnSpell = sets.midcast.enhancing_skill
    sets.midcast['強化魔法'].Temper = sets.midcast.enhancing_skill
    sets.midcast['強化魔法'].BarElement = set_combine(sets.midcast.enhancing_skill_500, {legs="シェダルサラウィル",})
    sets.midcast['強化魔法'].BoostStat = set_combine(sets.midcast.enhancing_skill_500, {hands="ＶＩグローブ+3",})

    -- 強化スキル 500, 被ファランクス 17 (35+17=52)
    sets.midcast.phalanx_self = {
--        main="エグキング",
--        sub="アムラピシールド",
        head={ name="テーオンシャポー", augments={'Phalanx +3',}},
        body={ name="テーオンタバード", augments={'Phalanx +3',}},
        hands={ name="テーオングローブ", augments={'Phalanx +3',}},
        legs={ name="テーオンタイツ", augments={'Phalanx +3',}},
        feet={ name="テーオンブーツ", augments={'Phalanx +3',}},
        neck="インカンタートルク",
        waist="エンブラサッシュ",
        left_ear="アンドアーピアス",
        right_ear="ミミルピアス",
        left_ring={name="スティキニリング+1", bag="Wardrobe 2"},
        right_ring={name="スティキニリング+1", bag="Wardrobe 3"},
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+1','Enh. Mag. eff. dur. +19',}},
    }

    sets.midcast.phalanx_self_DW = {
--        main="プクラトムージュ+1",
--        sub="エグキング",
        head={ name="テーオンシャポー", augments={'Phalanx +3',}},
        body={ name="テーオンタバード", augments={'Phalanx +3',}},
        hands={ name="テーオングローブ", augments={'Phalanx +3',}},
        legs={ name="テーオンタイツ", augments={'Phalanx +3',}},
        feet={ name="テーオンブーツ", augments={'Phalanx +3',}},
        neck="デュエルトルク+2",
        waist="エンブラサッシュ",
        left_ear="アンドアーピアス",
        right_ear="ミミルピアス",
        left_ring={name="スティキニリング+1", bag="Wardrobe 2"},
        right_ring={name="スティキニリング+1", bag="Wardrobe 3"},
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+1','Enh. Mag. eff. dur. +19',}},
    }

    sets.midcast['強化魔法'].Phalanx = sets.midcast.phalanx_self

    sets.midcast['強化魔法'].Phalanx_Others = set_combine(sets.midcast['強化魔法'].Others, {left_ear="アンドアーピアス", right_ring="スティキニリング+1",})

    sets.midcast['強化魔法']['ストンスキン'] = set_combine(sets.midcast['強化魔法'], {legs="シェダルサラウィル", neck='ノデンズゴルゲット', left_ear='アースクライピアス', waist="ジーゲルサッシュ",})
    sets.midcast['強化魔法']['アクアベール'] = set_combine(sets.midcast['強化魔法'], {head="ＡＭコイフ+1", legs="シェダルサラウィル",})
    sets.midcast['強化魔法'].Refresh = set_combine(sets.midcast['強化魔法'], {head="ＡＭコイフ+1", body="ＡＴタバード+3",legs="ＬＴフュゾー+2",})
    sets.midcast['強化魔法'].Refresh_Others = set_combine(sets.midcast['強化魔法'].Others, {head="ＡＭコイフ+1", body="ＡＴタバード+3",legs="ＬＴフュゾー+2",})
    sets.midcast['強化魔法'].Regen = set_combine(sets.midcast['強化魔法'], {main="ボレラブンガ", sub="アムラピシールド",})
    sets.midcast['強化魔法'].Regen_Others = set_combine(sets.midcast['強化魔法'].Others, {main="ボレラブンガ", sub="アムラピシールド",})
    sets.midcast['強化魔法'].Protect = set_combine(sets.midcast['強化魔法'], {right_ear="ブラキュラピアス",})
    sets.midcast['強化魔法'].Protect_Others = sets.midcast['強化魔法'].Others
    sets.midcast['強化魔法'].Shell = set_combine(sets.midcast['強化魔法'], {right_ear="ブラキュラピアス",})
    sets.midcast['強化魔法'].Shell_Others = sets.midcast['強化魔法'].Others

    sets.midcast['回復魔法'] = sets.midcast.FastRecast
    sets.midcast['回復魔法'].Cure = {
    ammo="ホミリアリ",
    head="ケカスミトラ",
    body="ケカスブリオー",
    hands={ name="ケカスカフス", augments={'MP+60','MND+10','Mag. Acc.+15',}},
    legs="ケカスタイツ",
    feet="ケカスブーツ",
    neck="サンクトネックレス",
    waist="ルミネートサッシュ",
    left_ear="磁界の耳",
    right_ear="オノワイヤリング",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['回復魔法'].Cure_Others = {
    ammo="ホミリアリ",
    head="ケカスミトラ",
    body="ケカスブリオー",
    hands={ name="ケカスカフス", augments={'MP+60','MND+10','Mag. Acc.+15',}},
    legs="ケカスタイツ",
    feet="ケカスブーツ",
    neck="サンクトネックレス",
    waist="ルミネートサッシュ",
    left_ear="磁界の耳",
    right_ear="オノワイヤリング",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['回復魔法'].Curaga = {
        ammo="プシロメン",
        head={ name="ＧＥカウビーン+1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','"Cure" potency +8%',}},
        body="ヴリコダラジュポン",
        hands={ name="ブレムテグローブ", augments={'HP+30','MP+30','HP+30',}},
        legs="ＡＴタイツ+3",
        feet={ name="ヴァニヤクロッグ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="デュアルカラー+1",
        waist="ギシドゥバサッシュ",
        left_ear="エテオレートピアス",
        right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        left_ring="クナジリング",
        right_ring="メネロスリング",
        back="月光の羽衣",
    }

    sets.midcast.magic_acc = {
    ammo="カルボロンストーン",
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="ルミネートサッシュ",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['弱体魔法'] = sets.midcast.magic_acc

    sets.midcast['暗黒魔法'] = sets.midcast.magic_acc

    sets.midcast.enfeeble_skill = {
    ammo="カルボロンストーン",
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＡＴタバード+1",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="ルミネートサッシュ",
    left_ear="スノトラピアス",
    right_ear="ヴォルピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['弱体魔法'].Immunobreak = sets.midcast.enfeeble_skill

    sets.midcast['弱体魔法'].MND = {
    ammo="カルボロンストーン",
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="ルミネートサッシュ",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['弱体魔法'].MND_Skill = {
    ammo="カルボロンストーン",
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="ルミネートサッシュ",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['弱体魔法'].MND_Acc = {
    ammo="カルボロンストーン",
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＡＴタバード+1",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="ルミネートサッシュ",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }
    
    sets.midcast['弱体魔法'].INT = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="サクロコード",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['弱体魔法'].INT_Skill = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="サクロコード",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['弱体魔法'].INT_Acc = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＡＴタバード+1",
    hands="ＬＴガントロ+2",
    legs={ name="カイロンホーズ", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+3','Mag. Acc.+5',}},
    feet={ name="ＶＩブーツ+1", augments={'Immunobreak Chance',}},
    neck="デュエルトルク",
    waist="ルミネートサッシュ",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['弱体魔法'].Saboteur = {
    ammo="カルボロンストーン",
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs="ＬＴフュゾー+2",
    feet="ＬＴウゾー+2",
    neck="デュエルトルク",
    waist="ルミネートサッシュ",
    left_ear="スノトラピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="タマスリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['ディスペガ'] = {
        range="ウルル",
        head="ＶＩシャポー+3",
        body="ＬＴサヨン+2",
        hands="ＬＴガントロ+2",
        legs={ name="カイロンホーズ", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +2','INT+14','Mag. Acc.+13',}},
        feet="ＶＩブーツ+3",
        neck="デュエルトルク+2",
        waist="ルーミネリサッシュ",
        left_ear="スノトラピアス",
        right_ear="マリグナスピアス",
        left_ring="スティキニリング+1",
        right_ring="キシャールリング",
        back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
    }

    sets.midcast['インパクト'] = {
        range="ウルル",
        head=empty,
        body="トワイライトプリス",
        hands="ジャリカフス+2",
        legs={ name="カイロンホーズ", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +2','INT+14','Mag. Acc.+13',}},
        feet={ name="ＶＩブーツ+3", augments={'Immunobreak Chance',}},
        neck={ name="デュエルトルク+2", augments={'Path: A',}},
        waist={ name="アキュイテベルト+1", augments={'Path: A',}},
        left_ear="スノトラピアス",
        right_ear="マリグナスピアス",
        left_ring="スティキニリング+1",
        right_ring="スティキニリング+1",
        back={ name="スセロスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},
    }

    sets.midcast['精霊魔法'] = {
--    main="マランスタッフ",
--    sub="エンキストラップ",
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ＬＴシャペル+2",
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs="ＬＴフュゾー+2",
    feet="ＬＴウゾー+2",
    neck="サンクトネックレス",
    waist="サクロコード",
    left_ear="ヘカテーピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="女王の指輪+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.midcast['精霊魔法'].MB = {
--    main="マランスタッフ",
--    sub="エンキストラップ",
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ＬＴシャペル+2",
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs="ＬＴフュゾー+2",
    feet="ＬＴウゾー+2",
    neck="水影の首飾り",
    waist="サクロコード",
    left_ear="ヘカテーピアス",
    right_ear="マリグナスピアス",
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="夢神の指輪",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.idle = {
        range=empty,
    ammo="ホミリアリ",
    head={ name="ＶＩシャポー+1", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="ＬＴサヨン+2",
    hands="ＬＴガントロ+2",
    legs="マリグナスタイツ",
    feet="ブンジサボ",
    neck="サンクトネックレス",
    waist="キャリアーサッシュ",
    left_ear="エテオレートピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="エタナリング",
    right_ring="ＷＬリング+1",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.idle.Refresh = set_combine(sets.idle, {body="シャマシュローブ",})

    sets.engaged = {
        range=empty,
    ammo="ヘイストピニオン+1",
    head="マリグナスシャポー",
    body="マリグナスタバード",
    hands="マリグナスグローブ",
    legs="マリグナスタイツ",
    feet="マリグナスブーツ",
    neck="サンクトネックレス",
    waist="ケンタークベルト",
    left_ear="ダッジョンピアス",
    right_ear="ハートシーカピアス",
    left_ring="エタナリング",
    right_ring="イラブラットリング",
    back={ name="スセロスケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+2','"Fast Cast"+3','"Regen"+2',}},
    }

    sets.engaged.SubtleBlow = {
        range=empty,
        ammo="オゲルミルオーブ+1",
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="霊亀腰帯",
        left_ear="シェリダピアス",
        right_ear="エアバニピアス",
        left_ring="守りの指輪",
        right_ring="シーリチリング+1",
        back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged['DW31'] = {
        range=empty,
        ammo="オゲルミルオーブ+1",
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet={ name="テーオンブーツ", augments={'Accuracy+25','"Dual Wield"+5','DEX+10',}},
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="霊亀腰帯",
        left_ear="シェリダピアス",
        right_ear="素破の耳",
        left_ring="守りの指輪",
        right_ring="シーリチリング+1",
        back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }

    sets.melee_enspell = {
        range=empty,
    ammo="ホミリアリ",
    head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="アヤモコラッツァ+2",
    hands="アヤモマノポラ+2",
    legs="マリグナスタイツ",
    feet="マリグナスブーツ",
    neck="アスパーネックレス",
    waist="セールフィベルト+1",
    left_ear="シェリダピアス",
    right_ear="オノワイヤリング",
    left_ring="守りの指輪",
    right_ring="エタナリング",
    back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +6','Enha.mag. skill +8','Enh. Mag. eff. dur. +20',}},
    }

    sets.melee_hi_enspell = {
        range="ウルル",
        ammo=empty,
        head="ウムシクハット",
        body="アヤモコラッツァ+2",
        hands="アヤモマノポラ+2",
        legs="ＶＩタイツ+3",
        feet={ name="テーオンブーツ", augments={'Accuracy+25','"Dual Wield"+5','DEX+10',}},
        neck="デュエルトルク+2",
        waist="オルペウスサッシュ",
        left_ear="シェリダピアス",
        right_ear="ブルタルピアス",
        left_ring={name="スティキニリング+1", bag="Wardrobe 2"},
        right_ring="ヘタイロイリング",
        back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.EnSpell = sets.melee_enspell

    set_equip_by_sub_job(player.sub_job)
end

function job_precast(spell, action, spellMap, eventArgs)
end

function job_post_precast(spell, action, spellMap, eventArgs)
end

function job_midcast(spell, action, spellMap, eventArgs)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '精霊魔法' then
        equip(get_hachirin(spell.element))
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
end

function job_post_aftercast(spell, action, spellMap, eventArgs)

    if  spell.skill == '弱体魔法' and state.Immunobreak.value and not spell.interrupted then
        state.Immunobreak:unset()
    end
    
    if state.DisplayMode.value then update_job_states() end
end

function customize_idle_set(idleSet)
    local weapons = sets.weapons
    idleSet = set_combine(idleSet, weapons[state.Weapons.value])
    return idleSet
end

function customize_melee_set(meleeSet)
    local weapons = sets.weapons
    meleeSet = set_combine(meleeSet, weapons[state.Weapons.value])
    return meleeSet
end

function job_buff_change(buff, gain)
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == state.Hi_EnSpell.description then
        if newValue then
            sets.engaged.EnSpell = sets.melee_hi_enspell
        else
            sets.engaged.EnSpell = sets.melee_enspell
        end
    end
end

function job_update(cmdParams, eventArgs)
    if state.DisplayMode.value then update_job_states() end
end

function set_equip_weapon(equipSet, weaponSet)
    equipSet.main = weaponSet.main
    equipSet.sub = weaponSet.sub
end

function set_equip_by_sub_job(subJob)
    state.Weapons:reset()
    sub_job_suffix = S{'忍', '踊'}:contains(subJob) and '_DW' or ''

    if S{'忍', '踊'}:contains(subJob) then
          sets.weapons.Naegling = Naegling_dw
--        sets.weapons.Crocea_C = crocea_c_dw
--        sets.weapons.Crocea_B = crocea_b_dw
        sets.weapons.Tauret = tauret_dw
--        sets.weapons.Mandau = mandau_dw
--        sets.weapons.Crocea_C_DayBreak = crocea_c_daybreak_dw
        sets.weapons.D1 = d1_dw
        sets.weapons.Club = Club_dw
--        sets.weapons.Crocea_C_Levante = crocea_c_levante_dw
    else
        sets.weapons.Naegling = Naegling
        sets.weapons.Crocea_C = crocea_c
        sets.weapons.Crocea_B = crocea_b
        sets.weapons.Tauret = tauret
        sets.weapons.Mandau = mandau
        sets.weapons.Crocea_C_DayBreak = crocea_c_daybreak
        sets.weapons.D1 = d1
        sets.weapons.Club = Club
        sets.weapons.Crocea_C_Levante = crocea_c_levante
    end

--    set_equip_weapon(sets.midcast['弱体魔法'].MND, sets.weapons['Enfeeble_MND'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['弱体魔法'].MND_Skill, sets.weapons['Enfeeble_MND'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['弱体魔法'].MND_Acc, sets.weapons['Enfeeble_MND'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['弱体魔法'].INT, sets.weapons['Enfeeble_INT'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['弱体魔法'].INT_Skill, sets.weapons['Enfeeble_INT'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['弱体魔法'].INT_Acc, sets.weapons['Enfeeble_INT'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['弱体魔法'], sets.weapons['Enfeeble_Acc'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['暗黒魔法'], sets.weapons['Enfeeble_Acc'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['ディスペガ'], sets.weapons['Enfeeble_dispelga'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['インパクト'], sets.weapons['Enfeeble_Acc'..sub_job_suffix])
--    set_equip_weapon(sets.midcast['弱体魔法'].Saboteur, sets.weapons['Enfeeble_MND'..sub_job_suffix])
--    sets.midcast.Phalanx_Self = sets.midcast['phalanx_self'..sub_job_suffix]

    if state.DisplayMode.value then update_job_states() end

--    send_command('wait 1; input /lockstyle on; wait 1; gs c ls;')
end

function job_sub_job_change(newSubjob, oldSubjob)
    set_equip_by_sub_job(newSubjob)
end

--function job_self_command(cmdParams, eventArgs)
--    if cmdParams[1] == 'lockstyle' or cmdParams[1] == 'ls' then
--        mystyle('赤', player.sub_job)
--    end
--end

function job_get_spell_map(spell, default_spell_map)
    if _global.current_event ~= 'midcast' then return default_spell_map end

    local new_spell_map = default_spell_map
    if spell.skill == '弱体魔法' then
        new_spell_map = enfeeble_spell_maps[spell.name]
        if state.Immunobreak.value then
            new_spell_map = 'Immunobreak'
        elseif state.Buff['サボトゥール'] then
            new_spell_map = enfeeble_spell_maps_saboteur[spell.name] or enfeeble_spell_maps[spell.name]
        end
    elseif spell.skill == '強化魔法' then
        if spell.target.type ~= 'SELF' and state.Buff['コンポージャー'] then
            new_spell_map = 'Others'
            if S{'Phalanx', 'Refresh', 'Regen', 'Protect', 'Shell'}:contains(default_spell_map) then
                new_spell_map = default_spell_map..'_'..new_spell_map
            end
        end
    elseif spell.skill == '回復魔法' then
        if default_spell_map == 'Cure' then
            if spell.target.type ~= 'SELF' then
                new_spell_map = default_spell_map..'_Others'
            end
        end
    end

    return new_spell_map
end

--function select_default_macro_book()
--    set_macro_page(1, 8)
--end

--function mogmaster(job)
--    send_command('input /si '..job..';')
--end