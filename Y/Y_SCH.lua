include('weather_obi')

function get_sets()
    set_language('japanese')

    sets.precast = {}
    sets.precast.ws = {}
    sets.midcast = {}
    sets.aftercast = {}

    init_elemental_obi()
    set_elemental_obi("火輪の帯")
    set_elemental_obi("氷輪の帯")
    set_elemental_obi("風輪の帯")
    set_elemental_obi("土輪の帯")
    set_elemental_obi("雷輪の帯")
    set_elemental_obi("水輪の帯")
    set_elemental_obi("光輪の帯")
    set_elemental_obi("闇輪の帯")

    is_cp = false
    is_immanence = false
    is_stromsureg = false
    is_vagary_task = false

    sets.magic_enhance_skill = T{'バストンラ', 'バウォタラ', 'バエアロラ', 'バファイラ', 'バブリザラ', 'バサンダラ','バストン', 'バウォタ', 'バエアロ', 'バファイ', 'バブリザ', 'バサンダ', 'オーラ', 'ファランクス'}
    sets.storm = T{'熱波の陣', '吹雪の陣', '烈風の陣', '砂塵の陣', '疾雷の陣', '豪雨の陣', '極光の陣', '妖霧の陣', '熱波の陣II', '吹雪の陣II', '烈風の陣II', '砂塵の陣II', '疾雷の陣II', '豪雨の陣II', '極光の陣II', '妖霧の陣II'}
    sets.helix = T{'火門の計', '氷門の計', '風門の計', '土門の計', '雷門の計', '水門の計', '光門の計', '闇門の計', '火門の計II', '氷門の計II', '風門の計II', '土門の計II', '雷門の計II', '水門の計II', '光門の計II', '闇門の計II'}
    aspir = T{"アスピル", "アスピルII",}

    sets.cp = {}

sets.precast.fc={
    ammo="インカントストーン",
    head={ name="マーリンフード", augments={'Mag. Acc.+29','"Fast Cast"+7','"Mag.Atk.Bns."+3',}},
    body="ピンガチュニック",
    hands="ＡＣブレーサー+3",
    legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="ＡＣローファー+3",
    neck="オルンミラトルク",
    waist="エンブラサッシュ",
    left_ear="マリグナスピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="フィフォレケープ+1", augments={'Path: A',}},
}

    sets.precast.cure_fc = {
    ammo="プシロメン",
    head={ name="マーリンフード", augments={'Mag. Acc.+29','"Fast Cast"+7','"Mag.Atk.Bns."+3',}},
    body="ピンガチュニック",
    hands="ＡＣブレーサー+3",
    legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="ヴァニヤクロッグ", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="オルンミラトルク",
    waist="エンブラサッシュ",
    left_ear="メンデカントピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="ルッフケープ", augments={'HP+60','HP+20','Haste+10',}},
    }

    sets.precast.stun_fc = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ＡＣボード+3",
    body="ＡＣガウン+3",
    hands="ＡＣブレーサー+3",
    legs="ＡＣパンツ+3",
    feet={ name="ＰＤローファー+3", augments={'Enhances "Stormsurge" effect',}},
    neck="エーラペンダント",
    waist="雷輪の帯",
    left_ear="マリグナスピアス",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
    left_ring="スティキニリング",
    right_ring={ name="メタモルリング+1", augments={'Path: A',}},
    back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }

    sets.precast.magic_skill_chain = {
    main="マリグナスポール",
    sub="アンブラストラップ",
    ammo="インカントストーン",
    head={ name="ヴァニヤフード", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="ピンガチュニック",
    hands="ＡＣブレーサー+3",
    legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="ＡＣローファー+3",
    neck="オルンミラトルク",
    waist="エンブラサッシュ",
    left_ear="エテオレートピアス",
    right_ear="ロケイシャスピアス",
    left_ring="ナジの包帯",
    right_ring="キシャールリング",
    back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

 --[  ]インパクト装備
sets.precast.impact_fc = {
    ammo="インカントストーン",
    body="トワイライトプリス",
    hands="ＡＣブレーサー+3",
    legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="ＡＣローファー+3",
    neck="オルンミラトルク",
    waist="エンブラサッシュ",
    left_ear="マリグナスピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="フィフォレケープ+1", augments={'Path: A',}},
}

    sets.precast.ws.mp = {
        ammo="プシロメン",
        head={ name="ＡＭコイフ+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        body={ name="ウェーザーローブ+1", augments={'MP+120',}},
        hands={ name="オトミグローブ", augments={'HP+30','MP+30','MP+30',}},
        legs={ name="ＡＭスロップス+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet={ name="ＡＭネール+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck="サンクトネックレス",
        waist="神術帯+1",
        left_ear="エテオレートピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="メフィタスリング",
        right_ring="メフィタスリング+1",
        back="フィフォレケープ+1",
    }

    sets.precast.ws.magic = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="妖蟲の髪飾り+1",
    body="ＡＢガウン+3",
    hands="ＡＢブレーサー+2",
    legs="ＡＢパンツ+2",
    feet="ＡＢローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
    waist="闇輪の帯",
    left_ear="マリグナスピアス",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
    left_ring="スティキニリング",
    right_ring={ name="メタモルリング+1", augments={'Path: A',}},
    back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }

    sets.precast.ws['ミルキル'] = sets.precast.ws.mp
    sets.precast.ws['オムニシエンス'] = sets.precast.ws.magic

 --------------------< midcast >--------------------

sets.midcast.cure={
    head={ name="ヴァニヤフード", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="ケカスブリオー+1",
    hands={ name="ＰＤブレーサー+3", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs="ＡＣパンツ+3",
    feet={ name="ヴァニヤクロッグ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="ヘニックトルク",
    waist="ギシドゥバサッシュ",
    left_ear="メンデカントピアス",
    right_ring="レベッチェリング",
}

sets.midcast.magic_mb = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ＡＢボネット+3",
    body="ＡＢガウン+3",
    hands="ＡＢブレーサー+2",
    legs={ name="ＰＤパンツ+3", augments={'Enhances "Tabula Rasa" effect',}},
    feet="ＡＢローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
    waist="サクロコード",
    left_ear="マリグナスピアス",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
    left_ring="女王の指輪+1",
    right_ring={ name="メタモルリング+1", augments={'Path: A',}},
    back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast.magic_mb_dark = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="妖蟲の髪飾り+1",
    body="ＡＢガウン+3",
    hands="ＡＢブレーサー+2",
   legs={ name="ＰＤパンツ+3", augments={'Enhances "Tabula Rasa" effect',}},
    feet="ＡＢローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
    waist="サクロコード",
    left_ear="マリグナスピアス",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
    left_ring="女王の指輪+1",
    right_ring={ name="メタモルリング+1", augments={'Path: A',}},
    back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }

 --[ ]計略装備
    sets.midcast.helix_mb = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ＡＢボネット+3",
    body="ＡＢガウン+3",
    hands="ＡＢブレーサー+2",
    legs={ name="ＰＤパンツ+3", augments={'Enhances "Tabula Rasa" effect',}},
    feet="ＡＢローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
    waist="サクロコード",
    left_ear="マリグナスピアス",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
    left_ring="女王の指輪+1",
    right_ring={ name="メタモルリング+1", augments={'Path: A',}},
    back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    }

 --[65]弱体装備
sets.midcast.magic_acc = {
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    head="ＡＣボード+3",
    body="ＡＣガウン+3",
    hands="ＡＣブレーサー+3",
    legs="ＡＣパンツ+3",
    feet="ＡＣローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
    waist="サクロコード",
    left_ear="ヴォルピアス",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
    left_ring={ name="メタモルリング+1", augments={'Path: A',}},
    right_ring="キシャールリング",
    back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast.aspir = {
        ammo="ペムフレドタスラム",
        head="妖蟲の髪飾り+1",
        body={ name="ＡＭダブレット+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        hands="王将の袖飾り",
        legs={ name="ＰＤパンツ+3", augments={'Enhances "Tabula Rasa" effect',}},
        feet="ＡＣローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
        waist="風鳥の帯",
        left_ear="王将の耳飾り",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
        left_ring="アルコンリング",
        right_ring="エバネセンスリング",
        back={ name="ルッフケープ", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
    }

 --[  ]インパクト装備
sets.midcast.inpact={
    ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
    body="トワイライトプリス",
    hands="ＡＣブレーサー+3",
    legs="ＡＣパンツ+3",
    feet="ＡＣローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
    waist="闇輪の帯",
    left_ear="マリグナスピアス",
    right_ear={ name="アバテルピアス+2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Enmity-6','INT+7 MND+7',}},
    left_ring="スティキニリング",
    right_ring={ name="メタモルリング+1", augments={'Path: A',}},
    back={ name="ルッフケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}, 
}

sets.midcast.enhance_duration = {
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="ＰＤガウン+3", augments={'Enhances "Enlightenment" effect',}},
    hands="ＡＢブレーサー+2",
    legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
    feet={ name="テルキネピガッシュ", augments={'Enh. Mag. eff. dur. +10',}},
    neck="イボドラネックレス",
    waist="エンブラサッシュ",
    left_ear="アンドアーピアス",
    right_ear="ロケイシャスピアス",
    back={ name="ブックワームケープ", augments={'INT+3','Helix eff. dur. +12','"Regen" potency+10',}},
}

    sets.midcast.rejen = set_combine(sets.midcast.enhance_duration,
        {
            head="ＡＢボネット+3",
            body={ name="テルキネシャジュブ", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
        }
    )

    sets.midcast.skin = set_combine(sets.midcast.enhance_duration, {neck='ストーンゴルゲット', left_ear='アースクライピアス', waist="ジーゲルサッシュ",})
    
    sets.midcast.aquaveil = set_combine(sets.midcast.enhance_duration, {head={ name="ＡＭコイフ+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, hands="王将の袖飾り",})

    sets.midcast.refresh = set_combine(sets.midcast.enhance_duration, {head={ name="ＡＭコイフ+1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, waist="ギシドゥバサッシュ",})


 --[63]強化装備
sets.midcast.enhance_skill = {
    ammo="カルボロンストーン",
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="ＰＤガウン+3", augments={'Enhances "Enlightenment" effect',}},
    hands="ＡＢブレーサー+2",
    legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
    feet={ name="テルキネピガッシュ", augments={'Enh. Mag. eff. dur. +10',}},
    neck="イボドラネックレス",
    waist="エンブラサッシュ",
    left_ear="アンドアーピアス",
    right_ear="ロケイシャスピアス",
    back={ name="ブックワームケープ", augments={'INT+3','Helix eff. dur. +12','"Regen" potency+10',}},
}

    sets.midcast.vagary_task = {
    ammo="インカントストーン",
    head={ name="マーリンフード", augments={'Mag. Acc.+29','"Fast Cast"+7','"Mag.Atk.Bns."+3',}},
    body="ピンガチュニック",
    hands="ＡＣブレーサー+3",
    legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="ＡＣローファー+3",
    neck="オルンミラトルク",
    waist="エンブラサッシュ",
    left_ear="マリグナスピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    sets.midcast.sc_mid = {
        ammo="ストンチタスラム+1",
        head={ name="ヴァニヤフード", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
        body="オンカスーツ",
        neck="ロリケートトルク+1",
        waist="ニヌルタサッシュ",
        left_ear="エテオレートピアス",
        right_ear="ルガルバンダピアス",
        left_ring="守りの指輪",
        right_ring="ＶＣリング+1",
        back="月光の羽衣",
    }

 --------------------< aftercast >--------------------
 
 --[61]待機装備
sets.aftercast.idle={
    main={ name="アカデモス", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="エンキストラップ",
    ammo="ホミリアリ",
    head="ＡＢボネット+3",
    body="ＡＢガウン+3",
    hands={ name="カイロングローブ", augments={'Pet: Mag. Acc.+9','CHR+1','"Refresh"+2',}},
    legs={ name="アシドゥイズボン+1", augments={'Path: A',}},
    feet="ＡＢローファー+3",
        neck="シビルスカーフ",
    waist="風鳥の帯",
    left_ear="エテオレートピアス",
    right_ear="ハーティーピアス",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="ルッフケープ", augments={'HP+60','HP+20','Haste+10',}},
}

    sets.aftercast.idle_sublimation = {
    main={ name="アカデモス", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
    sub="エンキストラップ",
    ammo="ホミリアリ",
    head="ＡＣボード+3",
    body={ name="ＰＤガウン+3", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="カイロングローブ", augments={'Pet: Mag. Acc.+9','CHR+1','"Refresh"+2',}},
    legs={ name="アシドゥイズボン+1", augments={'Path: A',}},
    feet={ name="カイロンスリッパー", augments={'"Mag.Atk.Bns."+13','Mag. Acc.+11 "Mag.Atk.Bns."+11','"Refresh"+1','Accuracy+9 Attack+9',}},
        neck="シビルスカーフ",
    waist="エンブラサッシュ",
    left_ear="エテオレートピアス",
    right_ear="サバントピアス",
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="ルッフケープ", augments={'HP+60','HP+20','Haste+10',}},
    }

    sets.aftercast.melee = {
    ammo="アマークラスター",
    head={ name="ブリスタサリット+1", augments={'Path: A',}},
    body="ＡＢガウン+3",
    hands={ name="ガズブレスレット+1", augments={'Path: A',}},
    legs="ＡＢパンツ+2",
    feet="ＡＢローファー+3",
        neck={ name="アギュトストール+2", augments={'Path: A',}},
    waist="エスカンストーン",
    left_ear="ハートシーカピアス",
    right_ear="マーケピアス+1",
    left_ring="カコエシクリング",
    right_ring="ヴァラールリング+1",
    back={ name="ルッフケープ", augments={'HP+60','HP+20','Haste+10',}},
    }
end

 -------------------------------------------------

function pretarget(spell)
    local set_equip = nil

    if spell.name == 'インパクト' then
        set_equip = {body="トワイライトプリス",}
    end

    if set_equip then
        equip(set_equip)
    end
end


function precast(spell)
    local set_equip = nil
    
    -- windower.add_to_chat(122,'spell.type: '..spell.type)
    -- windower.add_to_chat(122,'spell.name: '..spell.name)
    -- windower.add_to_chat(122,'spell.element: '..spell.element)
    -- windower.add_to_chat(122,'world.day_element: '..world.day_element)
    -- windower.add_to_chat(122,'world.weather_element: '..world.weather_element)

    if spell.type == 'WhiteMagic' then
        if string.find(spell.name, 'ケアル') then
            set_equip = sets.precast.cure_fc
        else
            set_equip = sets.precast.fc
        end
    elseif spell.name == 'スタン' then
            set_equip = sets.precast.stun_fc
    elseif spell.type == 'BlackMagic' then
        if is_immanence then
            set_equip = sets.precast.magic_skill_chain
        else
            if spell.skill == '精霊魔法' then
                if spell.name == 'インパクト' then
                    set_equip = sets.precast.impact_fc
                else
                    set_equip = sets.precast.fc
                end
            else
                set_equip = sets.precast.fc
            end
        end
    elseif spell.type == 'JobAbility' then
        if spell.name == '連環計' then
            set_equip = {legs={ name="ＰＤパンツ+3", augments={'Enhances "Tabula Rasa" effect',}},}
        elseif spell.name == '大悟徹底' then
            set_equip = {body={ name="ＰＤガウン+3", augments={'Enhances "Enlightenment" effect',}},}
        end
    elseif spell.type == 'Scholar' then
        if spell.name == '震天動地の章' then
            is_immanence = true
        end
    elseif spell.type == 'WeaponSkill' then
        if sets.precast.ws[spell.name] then
            set_equip = sets.precast.ws[spell.name]
        end
    elseif spell.type == 'Trust' then
        set_equip = sets.precast.fc
    end
    
    if set_equip then
        equip(set_equip)
    end
end

function midcast(spell)
    local set_equip = nil
    
    if string.find(spell.name, 'ケアル') then
        set_equip = set_combine(sets.midcast.cure, get_hachirin(spell.element))
    elseif spell.name == 'スタン' then
            set_equip = sets.precast.stun_fc
    elseif spell.skill == '強化魔法' then
        if spell.name == 'ストンスキン' then
            if buffactive['ストンスキン'] then
                send_command("cancel 37")
            end
            set_equip = sets.midcast.skin
        elseif string.find(spell.name, 'リジェネ') then
            set_equip = sets.midcast.rejen
        elseif sets.magic_enhance_skill:contains(spell.name) then
            set_equip = sets.midcast.enhance_skill
        elseif sets.storm:contains(spell.name) then
            if is_stromsureg then
                set_equip = set_combine(sets.midcast.enhance_duration, {feet={ name="ＰＤローファー+3", augments={'Enhances "Stormsurge" effect',}},})
            else
                set_equip = sets.midcast.enhance_duration
            end
        elseif spell.name == 'アクアベール'then
            set_equip = sets.midcast.aquaveil
        elseif spell.name == 'リフレシュ' then
            set_equip = sets.midcast.refresh
        else
            set_equip = sets.midcast.enhance_duration
        end
    elseif spell.skill == '弱体魔法' then
        set_equip = sets.midcast.magic_acc
    elseif spell.skill == '暗黒魔法' then
        if spell.name == 'メルトン' then
            set_equip = sets.midcast.magic_mb_dark
        elseif aspir:contains(spell.name) then
            set_equip = sets.midcast.aspir
        else
            set_equip = sets.midcast.magic_acc
        end
    elseif spell.skill == '精霊魔法' then
        if is_immanence then
            if spell.name == 'サンダーV' then -- オーメン課題 MBなし15,000ダメージ用
                set_equip = sets.midcast.magic_mb
            else
                -- if spell.name == 'ストーン' or spell.name == '土門の計' then
                --     set_equip = set_combine(sets.precast.magic_skill_chain, {main="プルートスタッフ",})
                --     -- set_equip = sets.precast.magic_skill_chain
                -- else
                    set_equip = sets.precast.magic_skill_chain
                    -- set_equip = sets.midcast.sc_mid
                -- end
            end
            is_immanence = false
        else
            if sets.helix:contains(spell.name) then
                set_equip = sets.midcast.helix_mb
            elseif spell.name == 'インパクト' then
                set_equip = set_combine(sets.midcast.impact, get_hachirin(spell.element))
            else
                if is_vagary_task then
                    set_equip = sets.midcast.vagary_task
                else
                    set_equip = set_combine(sets.midcast.magic_mb, get_hachirin(spell.element))
                end
            end
        end
    end
    
    if buffactive['令狸執鼠の章'] then
        set_equip = set_combine(set_equip, {hands='ＡＢブレーサー+2',})
    end
    
    if buffactive['気炎万丈の章'] then
        set_equip = set_combine(set_equip, {head="ＡＢボネット+3",})
    end
    
    if set_equip then
        equip(set_equip)
    end
end

function idle()
    if buffactive['机上演習:蓄積中'] then
        return sets.aftercast.idle_sublimation
    else
        return sets.aftercast.idle
    end
end

function aftercast(spell)
    local set_equip = nil
    
    if player.status == 'Engaged' then
        set_equip = sets.aftercast.melee
    else
        set_equip = sets.aftercast.idle
    end
    
    if set_equip then
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
    
    if set_equip then
        equip(set_equip)
    end
end

function self_command(command)
    if command == 'cp' then
        if is_cp then
            is_cp = false
            enable('back')
            windower.add_to_chat(122,'--- キャパポ装備 OFF ---')
        else
            is_cp = true
            equip(sets.cp)
            disable('back')
            windower.add_to_chat(122,'+++ キャパポ装備 ON +++')
        end
    elseif command =='stormsurge' then
        is_stromsureg = not is_stromsureg
        windower.add_to_chat(122,'陣頭指揮: '..tostring(is_stromsureg))
    elseif command == 'vagary' then
        is_vagary_task = not is_vagary_task
        windower.add_to_chat(122,'ベガリーお題: '..tostring(is_vagary_task))
    elseif command == '1p' then
        send_command('input /macro book 4; wait 0.5; input /macro set 10')
    elseif command == '2p' then
        send_command('input /macro book 5; wait 0.5; input /macro set 10')
    elseif command == 'aspir' then
        local recasts = windower.ffxi.get_spell_recasts()
        local recast_time_a2 = recasts[248]/60
        local recast_time_a = recasts[247]/60

        if recast_time_a2 == 0 then
            send_command('input /magic '..windower.to_shift_jis('アスピルII')..' <t>')
        elseif recast_time_a == 0 then
            send_command('input /magic '..windower.to_shift_jis('アスピル')..' <t>')
        else
            windower.add_to_chat(30, 'アスピル リキャスト---> II: %.1fs, I: %.1fs':format(recast_time_a2, recast_time_a))
        end
    end
end
