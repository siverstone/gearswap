function get_sets()
    set_language('japanese')
    
    sets.precast = {}
    sets.precast.ws = {}
    sets.midcast = {}
    sets.aftercast = {}
    
    is_doom = false
    
    sets.sa_na = T{'ポイゾナ', 'パラナ', 'ブライナ', 'サイレナ', 'カーズナ', 'ウィルナ', 'ストナ', 'イレース'}
    sets.addi = T{'アディバイト', 'アディマイン', 'アディカリス', 'アディアジル', 'アディスト', 'アディイン', 'アディデック'}
    sets.ba = T{'バストンラ', 'バウォタラ', 'バエアロラ', 'バファイラ', 'バブリザラ', 'バサンダラ','バストン', 'バウォタ', 'バエアロ', 'バファイ', 'バブリザ', 'バサンダ'}
    sets.bas = T{'バスリプラ', 'バポイゾラ', 'バパライラ', 'バブライラ', 'バサイレラ', 'バウィルラ','バブレクラ', 'バアムネジラ'}

--    sets.maneuvers = S{'ファイアマニューバ','アイスマニューバ', 'ウィンドマニューバ', 'アースマニューバ', 'サンダーマニューバ', 'ウォータマニューバ', 'ライトマニューバ', 'ダークマニューバ',}

    -- 女神の愛撫
    sets.caress = {
        hands="ＥＢミトン+2",
    back={ name="メンディングケープ", augments={'Healing magic skill +3','Enha.mag. skill +10','Mag. Acc.+6',}},
    }
    
    sets.precast.fc = {
    ammo="インカントストーン",
    head="ＥＢキャップ+2",
    body="インヤガジュバ+2",
    hands={ name="ＧＥゲージ+1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" spellcasting time -5%',}},
    legs="ピンガズボン",
    feet={ name="テルキネピガッシュ", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="クレリクトルク+1", augments={'Path: A',}},
    waist="エンブラサッシュ",
    left_ear="マリグナスピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.fc_cure = {
    ammo="インカントストーン",
    head="ＥＢキャップ+2",
    body="インヤガジュバ+2",
    hands={ name="ＧＥゲージ+1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" spellcasting time -5%',}},
        legs="ＥＢパンタロン+3",
    feet={ name="テルキネピガッシュ", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="クレリクトルク+1", augments={'Path: A',}},
    waist="エンブラサッシュ",
    left_ear="マリグナスピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
    
    sets.precast.na = {
    ammo="インカントストーン",
    head="ＥＢキャップ+2",
    body="インヤガジュバ+2",
    hands={ name="ＧＥゲージ+1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" spellcasting time -5%',}},
        legs="ＥＢパンタロン+3",
    feet={ name="テルキネピガッシュ", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="クレリクトルク+1", augments={'Path: A',}},
    waist="エンブラサッシュ",
    left_ear="マリグナスピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
    
    sets.precast.doom = {
    ammo="ヘイストピニオン+1",
    head={ name="ヴァニヤフード", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="ＥＢブリオー+2",
    hands={ name="ファナチクグローブ", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="ＴＥパンタロン+3",
    feet={ name="ヴァニヤクロッグ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="デビリスメダル",
    waist="ギシドゥバサッシュ",
    left_ear="メイリピアス",
    right_ear={ name="エーベルピアス", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring="メネロスリング",
    right_ring="ハオマリング",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
    
    sets.precast.ws.multi = {
        head="アヤモツッケット+2",
        body="アヤモコラッツァ+2",
        hands="アヤモマノポラ+2",
        legs="アヤモコッシャレ+2",
        feet="アヤモガンビエラ+2",
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="セサンスピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="守りの指輪",
        right_ring="イラブラットリング",
        back={ name="アラウナスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    sets.precast.ws.mnd = {
        head={ name="ＰＩキャップ+3", augments={'Enhances "Devotion" effect',}},
        body={ name="ＰＩブリオー+3", augments={'Enhances "Benediction" effect',}},
        hands={ name="ＰＩミトン+3", augments={'Enhances "Martyr" effect',}},
        legs={ name="ＰＩパンタロン+3", augments={'Enhances "Afflatus Misery" effect',}},
        feet={ name="ＰＩダックビル+3", augments={'Enhances "Afflatus Solace" effect',}},
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="王将の耳飾り",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring={ name="メタモルリング+1", augments={'Path: A',}},
        right_ring="イラブラットリング",
        back={ name="アラウナスケープ", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
    }

    sets.precast.ws["ミスティックブーン"] = set_combine(sets.precast.ws.mnd, {neck="クレリクトルク+1", waist="グルンフェルロープ",})

    sets.midcast.enhance_duration = {
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="テルキネシャジュブ", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="テルキネグローブ", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet="ＴＥダックビル+3",
        waist="ニヌルタサッシュ",
    }
    
    sets.midcast.cure = {
    ammo="プシロメン",
    head={ name="ＧＥカウビーン+1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','"Cure" potency +7%',}},
    body="ＥＢブリオー+2",
    hands={ name="ケカスカフス", augments={'MP+60','"Conserve MP"+6','"Fast Cast"+3',}},
    legs="ＥＢパンタロン+3",
    feet={ name="ケカスブーツ", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    neck={ name="クレリクトルク+1", augments={'Path: A',}},
    waist="光輪の帯",
    left_ear="朝露の耳飾",
    right_ear={ name="エーベルピアス", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.recast = {
    ammo="ヘイストピニオン+1",
    head="ＥＢキャップ+2",
    body="インヤガジュバ+2",
    hands={ name="ＧＥゲージ+1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Cure" spellcasting time -5%',}},
    legs="ピンガズボン",
    feet={ name="テルキネピガッシュ", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="クレリクトルク+1", augments={'Path: A',}},
    waist="エンブラサッシュ",
    left_ear="マリグナスピアス",
    right_ear="ロケイシャスピアス",
    left_ring="守りの指輪",
    right_ring="キシャールリング",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.protect = set_combine(sets.midcast.enhance_duration, {right_ear="ブラキュラピアス",})
    sets.midcast.shell = set_combine(sets.midcast.enhance_duration, {right_ear="ブラキュラピアス",})
    sets.midcast.auspice = set_combine(sets.midcast.enhance_duration, {feet="ＥＢダックビル+2",})
    sets.midcast.rejen = set_combine(sets.midcast.enhance_duration, {main="ボレラブンガ", head="インヤガティアラ+2", body="ＰＩブリオー+3", hands="ＥＢミトン+2", legs="ＴＥパンタロン+3",})
    sets.midcast.skin = set_combine(sets.midcast.enhance_duration, {legs="シェダルサラウィル", neck='ノデンズゴルゲット', left_ear='アースクライピアス', waist="ジーゲルサッシュ",})
    sets.midcast.aquaveil = set_combine(sets.midcast.enhance_duration, {main="バドースロッド", legs="シェダルサラウィル"})
    
    sets.midcast.ba = {
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
        body="ＥＢブリオー+2",
        hands="ダイナスティミトン",
        legs={ name="ＰＩパンタロン+3", augments={'Enhances "Afflatus Misery" effect',}},
        feet="ＴＥダックビル+3",
        neck="インカンタートルク",
        waist="オリンポスサッシュ",
        left_ear="エテオレートピアス",
        right_ear="ミミルピアス",
        left_ring="スティキニリング+1",
        right_ring="スティキニリング+1",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.bas = {
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
        body="ＥＢブリオー+2",
        hands="ダイナスティミトン",
        legs={ name="ＰＩパンタロン+3", augments={'Enhances "Afflatus Misery" effect',}},
        feet="ＴＥダックビル+3",
        neck="スローダネックレス",
        waist="オリンポスサッシュ",
        left_ear="エテオレートピアス",
        right_ear="ミミルピアス",
        left_ring="スティキニリング+1",
        right_ring="スティキニリング+1",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }

    sets.midcast.addi = {
        ammo="インカントストーン",
    head={ name="テルキネキャップ", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="テルキネシャジュブ", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
        hands="ダイナスティミトン",
    legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet="ＴＥダックビル+3",
        neck="インカンタートルク",
        waist="オリンポスサッシュ",
        left_ear="アンドアーピアス",
        right_ear="ミミルピアス",
        left_ring="スティキニリング+1",
        right_ring="スティキニリング+1",
    back={ name="メンディングケープ", augments={'Healing magic skill +3','Enha.mag. skill +10','Mag. Acc.+6',}},
    }
    
    sets.midcast.magic_acc = {
        head="ＴＥキャップ+2",
        body="ＴＥブリオー+3",
        hands="ＰＩミトン+3",
        legs={ name="カイロンホーズ", augments={'Mag. Acc.+30','"Fast Cast"+4','MND+15','"Mag.Atk.Bns."+6',}},
        feet="ＴＥダックビル+3",
        neck="エーラペンダント",
        waist="エスカンストーン",
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="スティキニリング+1",
        right_ring="スティキニリング+1",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
    
    sets.aftercast.idle = {
    main="ヤグルシュ",
    sub="アムラピシールド",
    ammo="ホミリアリ",
    head="ブンジハット",
    body="ＥＢブリオー+2",
    hands="ブンジグローブ",
    legs="ＥＢパンタロン+3",
    feet="ＥＢダックビル+2",
        neck="シビルスカーフ",
    waist="キャリアーサッシュ",
    left_ear="エテオレートピアス",
    right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
    left_ring="守りの指輪",
    right_ring="ＷＬリング+1",
    back={ name="アラウナスケープ", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
    
    sets.aftercast.melee = {
        ammo="アマークラスター",
        head="アヤモツッケット+2",
        body="アヤモコラッツァ+2",
        hands="アヤモマノポラ+2",
        legs="アヤモコッシャレ+2",
        feet="アヤモガンビエラ+2",
        neck="ロリケートトルク+1",
        waist="グルンフェルロープ",
        left_ear="セサンスピアス",
        right_ear="ブルタルピアス",
        left_ring="守りの指輪",
        right_ring="イラブラットリング",
        back={ name="アラウナスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Damage taken-5%',}},
    }
end

function precast(spell)
    local set_equip = nil
    
    -- windower.add_to_chat(123, spell.name)
    -- windower.add_to_chat(123, spell.type)
    -- windower.add_to_chat(123, spell.skill)
    
    if string.find(spell.name, 'ケアル') then
        set_equip = sets.precast.fc_cure
    elseif sets.sa_na:contains(spell.name) then
        if spell.name == 'カーズナ' then
            set_equip = sets.precast.doom
            if S{'忍','踊'}:contains(player.sub_job) then
                set_equip = set_combine(sets.precast.doom, {main="ヤグルシュ", sub="ガンバンテイン"})
            end
            is_doom = false
        else
            if buffactive['女神の愛撫'] then
                set_equip = set_combine(sets.precast.na, sets.caress)
            else
                set_equip = sets.precast.na
            end
        end
    elseif spell.skill == '回復魔法' then
        set_equip = set_combine(sets.precast.fc, {legs="ＥＢパンタロン+3",})
    elseif spell.skill == '強化魔法' then
        set_equip = set_combine(sets.precast.fc, {waist="ジーゲルサッシュ"})
    elseif string.find(spell.type, 'Magic') then
        set_equip = sets.precast.fc
    elseif spell.name == 'デヴォーション' then
        set_equip = {head="ＰＩキャップ+3"}
    elseif spell.name == 'マーター' then
        set_equip = {hands="ＰＩミトン+3"}
    elseif spell.name == '女神の祝福' then
        set_equip = {body="ＰＩブリオー+3"}
    elseif spell.type == 'WeaponSkill' then
        if sets.precast.ws[spell.name] then
            set_equip = sets.precast.ws[spell.name]
        else
            set_equip = sets.precast.ws.mnd
        end
    elseif spell.name == 'アイスマニューバ' then
        set_equip = {range="ストリンガー"}
    elseif spell.name == 'ダークマニューバ' then
        set_equip = {range="ストリンガー"}
    elseif spell.name == 'ライトマニューバ' then
        set_equip = {range="ストリンガー"}
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
    
    if string.find(spell.name, 'ケアルガ') or string.find(spell.name, 'ケアルラ')then
        if buffactive['極光の陣'] or buffactive['極光の陣II'] then
            set_equip = set_combine(sets.midcast.cure, {body="ＴＥブリオー+3", waist="光輪の帯"})
        else
            set_equip = set_combine(sets.midcast.cure, {body="ＴＥブリオー+3",})
        end
    elseif string.find(spell.name, 'ケアル') or spell.name == 'フルケア' then
        if buffactive['極光の陣'] or buffactive['極光の陣II'] then
            set_equip = set_combine(sets.midcast.cure, {waist="光輪の帯"})
        else
            set_equip = sets.midcast.cure
        end
    elseif string.find(spell.name, 'プロテ') then
        set_equip = sets.midcast.protect
    elseif string.find(spell.name, 'シェル') then
        set_equip = sets.midcast.shell
    elseif string.find(spell.name, 'リジェネ') then
        set_equip = sets.midcast.rejen
    elseif spell.name == 'オースピス' then
        set_equip = sets.midcast.auspice
    elseif spell.name == 'ストンスキン' then
        set_equip= sets.midcast.skin
    elseif spell.name == 'アクアベール' then
        set_equip = sets.midcast.aquaveil
    elseif sets.addi:contains(spell.name) then
        set_equip = sets.midcast.addi
    elseif sets.ba:contains(spell.name) then
        set_equip = sets.midcast.ba
    elseif sets.bas:contains(spell.name) then
        set_equip = sets.midcast.bas
    elseif string.find(spell.name, 'デジョン') or string.find(spell.name, 'テレポ') or string.find(spell.name, 'リコール') or spell.name == 'リトレース' or spell.name == 'エスケプ' then
        set_equip = {waist="ニヌルタサッシュ",}
    elseif string.find(spell.name, 'エスナ') or string.find(spell.name, 'レイズ') or spell.name == 'サクリファイス' then
        set_equip = sets.midcast.recast
    elseif spell.skill == '強化魔法' and spell.name ~= 'イレース' then
        set_equip = sets.midcast.enhance_duration
    elseif spell.skill == '弱体魔法' then
        set_equip = sets.midcast.magic_acc
    elseif spell.skill == '神聖魔法' then
        if spell.name == 'リポーズ' then
            set_equip = sets.midcast.magic_acc
        else
            set_equip = sets.midcast.magic_acc
        end
    end
    
    if set_equip then
        equip(set_equip)
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
    if command == 'doom' then
        is_doom = not is_doom
        windower.add_to_chat(122, '---> カーズナ+装備: '..tostring(is_doom))
    end
end

--[[
local is_auto_maneuvers = false
local maneuvers_id = {
    {id=141,en="Fire Maneuver",ja="ファイアマニューバ",command=S{"ファイアマニューバ", "炎"},},
    {id=142,en="Ice Maneuver",ja="アイスマニューバ",command=S{"アイスマニューバ", "氷"},},
    {id=143,en="Wind Maneuver",ja="ウィンドマニューバ",command=S{"ウィンドマニューバ", "風"},},
    {id=144,en="Earth Maneuver",ja="アースマニューバ",command=S{"アースマニューバ", "土"},},
    {id=145,en="Thunder Maneuver",ja="サンダーマニューバ",command=S{"サンダーマニューバ", "雷"},},
    {id=146,en="Water Maneuver",ja="ウォータマニューバ",command=S{"ウォータマニューバ", "水"},},
    {id=147,en="Light Maneuver",ja="ライトマニューバ",command=S{"ライトマニューバ", "光"},},
    {id=148,en="Dark Maneuver",ja="ダークマニューバ",command=S{"ダークマニューバ", "闇"},},
}
local auto_maneuvers = {}
function self_command(command)
    local args = command:split(' ')
    if args[1] == 'am' then
        if args[2] == 'off' then
            is_auto_maneuvers = false
            windower.add_to_chat(122,'Auto Maneuvers off')
        else
            local maneuver_1, maneuver_2, maneuver_3 = nil
            if args[2] then
                maneuver_1 = windower.convert_auto_trans(args[2])
            else
                windower.add_to_chat(122,'No Maneuver 1 given.')
                return
            end

            if args[3] then
                maneuver_2 = windower.convert_auto_trans(args[3])
            else
                windower.add_to_chat(122,'No Maneuver 2 given.')
                return
            end

            if args[4] then
                maneuver_3 = windower.convert_auto_trans(args[4])
            else
                windower.add_to_chat(122,'No Maneuver 3 given.')
                return
            end
            set_maneuvers(maneuver_1, maneuver_2, maneuver_3)
        end
    elseif args[1] == 'melee' then
        sets.aftercast.idle = set_combine(sets.aftercast.idle_melee, sets.animator[1])
        sets.aftercast.idle_speed = set_combine(sets.aftercast.idle, {neck="ロリケートトルク+1", right_ring="シュネデックリング",})
        send_command('gs c idle')
        windower.add_to_chat(122,'---> オートマトン MELEE')
    elseif args[1] == 'tankdt' then
        sets.aftercast.idle = set_combine(sets.aftercast.idle_tank_dt, sets.animator[1])
        sets.aftercast.idle_speed = set_combine(sets.aftercast.idle, {neck="ロリケートトルク+1", right_ring="シュネデックリング",})
        send_command('gs c idle')
        windower.add_to_chat(122,'---> オートマトン TANK DT')
    elseif args[1] == 'tankmelee' then
        sets.aftercast.idle = set_combine(sets.aftercast.idle_tank_melee, sets.animator[1])
        sets.aftercast.idle_speed = set_combine(sets.aftercast.idle, {neck="ロリケートトルク+1", right_ring="シュネデックリング",})
        send_command('gs c idle')
        windower.add_to_chat(122,'---> オートマトン TANK MELEE')
    elseif args[1] == 'tankhp' then
        sets.aftercast.idle = set_combine(sets.aftercast.idle_tank_hp, sets.animator[1])
        sets.aftercast.idle_speed = set_combine(sets.aftercast.idle, {neck="ロリケートトルク+1", right_ring="シュネデックリング",})
        send_command('gs c idle')
        windower.add_to_chat(122,'---> オートマトン TANK HP')
    elseif args[1] == 'tankenm' then
        sets.aftercast.idle = set_combine(sets.aftercast.idle_tank_enmity, sets.animator[1])
        sets.aftercast.idle_speed = set_combine(sets.aftercast.idle, {neck="ロリケートトルク+1", right_ring="シュネデックリング",})
        send_command('gs c idle')
        windower.add_to_chat(122,'---> オートマトン TANK ENMITH')
    elseif args[1] == 'tankdthp' then
        sets.aftercast.idle = set_combine(sets.aftercast.idle_tank_dt_and_hp, sets.animator[1])
        sets.aftercast.idle_speed = set_combine(sets.aftercast.idle, {neck="ロリケートトルク+1", right_ring="シュネデックリング",})
        send_command('gs c idle')
        windower.add_to_chat(122,'---> オートマトン TANK DT and HP')
    elseif args[1] == 'magic' then
        sets.aftercast.idle = set_combine(sets.aftercast.idle_magic, sets.animator[2])
        sets.aftercast.idle_speed = set_combine(sets.aftercast.idle, {neck="ロリケートトルク+1", right_ring="シュネデックリング",})
        send_command('gs c idle')
        windower.add_to_chat(122,'---> オートマトン MAGIC')
    elseif args[1] == 'mane' then
        if args[2] == 'high' then
            sets.precast.ability.maneuvers = sets.precast.ability.maneuvers_high_strain
            windower.add_to_chat(122,'---> マニューバ　オーバーロード確率 -100%')
        elseif args[2] == 'mid' then
            sets.precast.ability.maneuvers = sets.precast.ability.maneuvers_mid_strain
            windower.add_to_chat(122,'---> マニューバ　オーバーロード確率 -60%')
        elseif args[2] == 'low' then
            sets.precast.ability.maneuvers = sets.precast.ability.maneuvers_low_strain
            windower.add_to_chat(122,'---> マニューバ　オーバーロード確率 -15%')
        elseif args[2] == 'status' then
            sets.precast.ability.maneuvers = set_combine(sets.precast.ability.maneuvers, sets.precast.ability.maneuvers_status)
            windower.add_to_chat(122,'---> マニューバ　ステータス + 10')
        else
            sets.precast.ability.maneuvers = sets.precast.ability.maneuvers_mid_strain
            windower.add_to_chat(122,'---> マニューバ　オーバーロード確率 -60%')
        end
    elseif args[1] == 'idle' then
        if pet.status == 'Engaged' then
            equip(sets.aftercast.idle)
            windower.add_to_chat(122,'---> オートマトン IDLE')
        else
            equip(sets.aftercast.idle_speed)
            windower.add_to_chat(122,'---> オートマトン SPEED')
        end
    elseif args[1] == 'animator' then
        if args[2] == '1' then
            sets.aftercast.idle = set_combine(sets.aftercast.idle, sets.animator[1])
            sets.aftercast.idle_speed = set_combine(sets.aftercast.idle_speed, sets.animator[1])
            send_command('gs c idle')
            windower.add_to_chat(122,'---> オートマトン ['..sets.animator[1].range..']')
        elseif args[2] == '2' then
            sets.aftercast.idle = set_combine(sets.aftercast.idle, sets.animator[2])
            sets.aftercast.idle_speed = set_combine(sets.aftercast.idle_speed, sets.animator[2])
            send_command('gs c idle')
            windower.add_to_chat(122,'---> オートマトン ['..sets.animator[2].range..']')
        else
            windower.add_to_chat(122,'---> ERROR ストリンガー')
        end
    end
end

update_time = 0
update_interval = 1
-- windower.register_event('prerender', function()
--     local curr = os.clock()
--     if curr > frame_time + update_interval then
--         frame_time = curr
--         exec_maneuver()
--     end
-- end)

windower.raw_register_event('time change', function(new, old)
    local curr = os.clock()
    if curr > update_time + update_interval then
        update_time = curr
        if not buffactive['アムネジア'] and not buffactive['睡眠'] then
            exec_maneuver()
            -- windower.ffxi.cancel_buff(40)
            -- windower.ffxi.cancel_buff(41)
            -- windower.ffxi.cancel_buff(116)
            -- windower.ffxi.cancel_buff(37)
        end
    end
end)

function set_maneuvers(maneuver_1, maneuver_2, maneuver_3)
    -- auto_maneuvers[1] = maneuver_1
    -- auto_maneuvers[2] = maneuver_2
    -- auto_maneuvers[3] = maneuver_3

    auto_maneuvers = {}

    for i, v in ipairs(maneuvers_id) do
        if v.command:contains(maneuver_1) then
            auto_maneuvers[1] = {name=v.ja, id=v.id}
        end

        if v.command:contains(maneuver_2) then
            auto_maneuvers[2] = {name=v.ja, id=v.id}
        end

        if v.command:contains(maneuver_3) then
            auto_maneuvers[3] = {name=v.ja, id=v.id}
        end
    end

    if  auto_maneuvers[1] and auto_maneuvers[2] and  auto_maneuvers[3] then
        is_auto_maneuvers = true
        windower.add_to_chat(122,'M1: '..auto_maneuvers[1].name..', M2: '..auto_maneuvers[2].name..', M3: '..auto_maneuvers[3].name)
    else
        windower.add_to_chat(122,'Invalid Maneuvers.')
        is_auto_maneuvers = false
    end

end

local maneuver_time = 60

function exec_maneuver()
    -- local os_time = os.time()
    local buffs = player.buff_details
    local recasts = windower.ffxi.get_ability_recasts()

    if not pet.isvalid then
        maneuver_time = 60
        return
    end

    for i = 1, #buffs do
        if buffs[i] and sets.maneuvers:contains(buffs[i].name) then
            -- local buff_time = math.floor(buffs[i].time - os_time)
            if buffs[i].duration > maneuver_time then
                maneuver_time = buffs[i].duration
                -- windower.add_to_chat(122, 'UPDATE MANUEVER TIME: '..maneuver_time..' sec ('..math.floor(maneuver_time*0.2)..' sec)')
                break
            end
        end
    end

    if is_auto_maneuvers then

        local maneuvers_exists = {[1] = false, [2] = false, [3] = false}

        -- Chcek exists manevers in buffs
        for i = #buffs, 1, -1 do
            if buffs[i] and buffs[i].name == auto_maneuvers[1].name and not maneuvers_exists[1] then
                maneuvers_exists[1] = true
            elseif buffs[i] and buffs[i].name == auto_maneuvers[2].name and not maneuvers_exists[2] then
                maneuvers_exists[2] = true
            elseif buffs[i] and buffs[i].name == auto_maneuvers[3].name and not maneuvers_exists[3] then
                maneuvers_exists[3] = true
            end
        end

        for i, exists in ipairs(maneuvers_exists) do
            if not exists then
                if recasts[210] == 0 then
                    -- windower.add_to_chat(122, 'NEW MANUEVER: '..auto_maneuvers[i].name)
                    send_command('input /pet '..windower.to_shift_jis(auto_maneuvers[i].name)..' <me>;')
                end
                return
            end
        end

        -- Check updates manevers
        for i = #buffs, 1, -1 do
            if buffs[i] then
                if buffs[i] and buffs[i].name == auto_maneuvers[1].name then
                    -- local buff_time = buffs[i].time - os_time
                    if buffs[i].duration < maneuver_time * 0.2 then
                        if recasts[210] == 0 then
                            -- windower.add_to_chat(122, 'UPDATE MANUEVER: '..auto_maneuvers[1].name)
                            send_command('input /pet '..windower.to_shift_jis(auto_maneuvers[1].name)..' <me>;')
                        end
                        return
                    end
                elseif buffs[i] and buffs[i].name == auto_maneuvers[2].name then
                    if buffs[i].duration < maneuver_time * 0.2 then
                        if recasts[210] == 0 then
                            -- windower.add_to_chat(122, 'UPDATE MANUEVER: '..auto_maneuvers[2].name)
                            send_command('input /pet '..windower.to_shift_jis(auto_maneuvers[2].name)..' <me>;')
                        end
                        return
                    end
                elseif buffs[i] and buffs[i].name == auto_maneuvers[3].name then
                    if buffs[i].duration < maneuver_time * 0.2 then
                        if recasts[210] == 0 then
                            -- windower.add_to_chat(122, 'UPDATE MANUEVER: '..auto_maneuvers[3].name)
                            send_command('input /pet '..windower.to_shift_jis(auto_maneuvers[3].name)..' <me>;')
                        end
                        return
                    end
                end
            end
        end
    end
end
]]
