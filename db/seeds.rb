Order.destroy_all
Domain.destroy_all

resorts = [
morzine = Domain.create(name: "Morzine", location: "26 Pl. du Baraty, 74110 Morzine", name_url: "morzine", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
val_disere = Domain.create(name: "Val d'Isère", location: "Place Jacques Mouflier, 73150 Val-d'Isère", name_url: "val-disere", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
chamonix = Domain.create(name: "Chamonix", location: "85 Place du Triangle de l'Amitié, 74400 Chamonix-Mont-Blanc", name_url: "chamonix", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_karellis = Domain.create(name: "Les Karellis", location: "Le Forum, Les Karellis, 73870 Montricher-Albanne", name_url: "les-karellis", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_menuires = Domain.create(name: "Les Menuires", location: "Immeuble Belledone, 73440 Saint-Martin-de-Belleville", name_url: "les-menuires", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
meribel = Domain.create(name: "Méribel", location: "Route du centre, 73550 Meribel", name_url: "meribel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
avoriaz = Domain.create(name: "Avoriaz", location: "44 Prom. du Festival, 74110 Avoriaz", name_url: "avoriaz", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
chatel = Domain.create(name: "Chatel", location: "14 Route de Thonon, 74390 Châtel", name_url: "chatel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_2_alpes = Domain.create(name: "les 2 Alpes", location: "4 Place des 2 Alpes, 38860 Mont-de-Lans", name_url: "les-2-alpes", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
alpe_dhuez = Domain.create(name: "Alpe d'Huez", location: "Centre Culturel Omnisports, 38750 Huez", name_url: "alpe-dhuez", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
courchevel = Domain.create(name: "Courchevel", location: "65 Rue du Rocher 73120 Saint-Bon-Tarentaise", name_url: "courchevel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_clusaz = Domain.create(name: "La Clusaz", location: "161 Place de l'Église, 74220 La Clusaz", name_url: "la-clusaz", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_arcs_bourg_st_maurice = Domain.create(name: "Les Arcs", location: "Centre Commercial Charvet 1800, 73700 Bourg-Saint-Maurice", name_url: "les-arcs-bourg-st-maurice", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
megeve = Domain.create(name: "Megève", location: "70 Rue Mgr Conseil, 74120 Megève", name_url: "megeve", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
tignes = Domain.create(name: "Tignes", location: "Place Centrale, 73320 Tignes", name_url: "tignes", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
val_cenis = Domain.create(name: "Val Cenis", location: "89 Rue du Mont-Cenis, 73480 Lanslebourg-Mont-Cenis", name_url: "val-cenis", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
val_thorens = Domain.create(name: "Val Thorens", location: "Maison de Thorens, Grande Rue, 73440 Val Thorens", name_url: "val-thorens", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
valloire = Domain.create(name: "Valloire", location: "Rue des Grandes Alpes, 73450 Valloire", name_url: "valloire", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
villard_de_lans = Domain.create(name: "Villard de Lans", location: "101 Place Mûre Ravaud, 38250 Villard-de-Lans", name_url: "villard-de-lans", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
flaine = Domain.create(name: "Flaine", location: "Gallerie Marchande Flaine-forum, 74300", name_url: "flaine", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_plagne = Domain.create(name: "La Plagne", location: "La Plagne, 73210 Mâcot-la-Plagne", name_url: "la-plagne", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_rosiere_1850 = Domain.create(name: "La Rosière 1850", location: "La Rosière 1850, 73700 La rosière - Montvalezan", name_url: "la-rosiere-1850", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_contamines_montjoie = Domain.create(name: "Les Contamines Montjoie", location: "18 Route de Notre Dame de la Gorge, 74170 Les Contamines-Montjoie", name_url: "les-contamines-montjoie", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_gets = Domain.create(name: "Les Gets", location: "89 Route du Front de Neige, 74260 Les Gets", name_url: "les-gets", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_saisies = Domain.create(name: "Les Saisies", location: "316 Avenue des Jeux Olympiques, 73620 Hauteluce", name_url: "les-saisies", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
saint_francois_longchamp = Domain.create(name: "Saint François Longchamp", location: "Maison du tourisme, 73130 Saint-François-Longchamp", name_url: "saint-francois-longchamp", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
combloux = Domain.create(name: "Combloux", location: "49 Chemin des Passerands, 74920 Combloux", name_url: "combloux", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_7_laux = Domain.create(name: "Les 7 Laux", location: "Centre des Cortillets, 38190 Prapoutel - Les 7 Laux", name_url: "les-7-laux", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_carroz = Domain.create(name: "Les Carroz", location: "9 Place de l'Ambiance, 74300 Arâches-la-Frasse", name_url: "les-carroz", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
saint_martin_de_belleville = Domain.create(name: "Saint Martin de Belleville", location: "Place de l'Église, 73440 Saint-Martin-de-Belleville", name_url: "saint-martin-de-belleville", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
valmorel = Domain.create(name: "Valmorel", location: "25 Bourg Morel, 73260 Les Avanchers-Valmorel", name_url: "valmorel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),

vars = Domain.create(name: "Vars", location: "Cours Fontanarosa, 05560 Vars", name_url: "vars", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
isola_2000 = Domain.create(name: "Isola 2000", location: "Immeuble Le Pélevos, 06420 Isola 2000", name_url: "isola-2000", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_grave_la_meije = Domain.create(name: "La Grave la Meije", location: "Place de l'Église 05320 La Grave", name_url: "la-grave-la-meije", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
sauze_supersauze = Domain.create(name: "Sauze Super Sauze", location: "Le Sauze, 04400 Le Sauze", name_url: "sauze-supersauze", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
montgenevre = Domain.create(name: "Montgenèvre", location: "Place du Bivouac Napoléon - Route d'Italie, 05100 Montgenèvre", name_url: "montgenevre", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
serre_chevalier = Domain.create(name: "Serre Chevalier", location: "Centre Commercial Prélong, 05240 La Salle-les-Alpes", name_url: "serre-chevalier", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
praloup = Domain.create(name: "Praloup", location: "31 Pra Loup, 04400 Uvernet-Fours", name_url: "praloup", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
puy_saint_vincent = Domain.create(name: "Puy Saint Vincent", location: "Station 1600, Clôt Peouilloux, 05290 Puy-Saint-Vincent", name_url: "puy-saint-vincent", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_orres = Domain.create(name: "Les Orres", location: "1 Place des Etoiles, 05200 Les Orres", name_url: "les-orres", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
risoul = Domain.create(name: "Risoul", location: "05600 RISOUL 1850", name_url: "risoul", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
superdevoluy_la_joue_du_loup = Domain.create(name: "Superdevoluy / La Joue du Loup", location: "Place des Boutiques, 05250 Le Dévoluy", name_url: "superdevoluy-la-joue-du-loup", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
orcieres = Domain.create(name: "Orcières Merlette", location: "Rue des Ecrins, 05170 Merlette, Orcières", name_url: "orcieres", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
auron = Domain.create(name: "Auron", location: "Grange Cossa, Avenue de Malhira, 06660 Saint-Étienne-de-Tinée", name_url: "auron", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)

la_mongie_bareges = Domain.create(name: "Grand Tourmalet (La Mongie / Barèges)", location: "Rue du Pic d'Espade, 65200 Mongie (La)", name_url: "la-mongie-bareges", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
peyragudes = Domain.create(name: "Peyragudes", location: "Résidence Royal Peyragudes, 65240 Germ", name_url: "peyragudes", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
saint_lary_soulan = Domain.create(name: "Saint Lary Soulan", location: "Rue de Soulan, 65170 Saint Lary Village", name_url: "saint-lary-soulan", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
piau_engaly = Domain.create(name: "Piau Engaly", location: "308 Montagne de Batsegure, 65170 Aragnouet", name_url: "piau-engaly", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
ax_3_domaines = Domain.create(name: "Ax 3 domaines", location: "Plateau de Bonascre, 09110 Ax-les-Thermes", name_url: "ax-3-domaines", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
eyne_cambre_daze = Domain.create(name: "Espace Cambre d’Aze", location: "Mairie, 66210 Saint-Pierre-dels-Forçats", name_url: "eyne-cambre-daze", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_angles = Domain.create(name: "Les Angles", location: "Avenue de l'Aude, 66210 Les Angles", name_url: "les-angles", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),

la_croix_de_bauzon = Domain.create(name: "La Croix de Bauzon", location: "Station de la Croix de Bauzon, Borne", name_url: "la-croix-de-bauzon", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
le_lioran = Domain.create(name: "Le Lioran", location: "Place du Téléphérique, 15300 Laveissière", name_url: "le-lioran", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
mont_aigoual = Domain.create(name: "Prat Peyrot - Mont Aigoual", location: "Prat Peyrot, 30570 Valleraugue", name_url: "mont-aigoual", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
besse_super_besse = Domain.create(name: "Besse Super Besse", location: "Rond-Point des Pistes, 63610 Besse-et-Saint-Anastaise", name_url: "besse-super-besse", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),

le_ballon_dalsace = Domain.create(name: "Le Ballon d'Alsace", location: "5 Gr Grand Rue, 68290 Sewen", name_url: "le-ballon-dalsace", mountain_chain: "vosges", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
gerardmer = Domain.create(name: "Gérardmer", location: "239 Chemin de la Rayée, 88400 Gérardmer", name_url: "gerardmer", mountain_chain: "vosges", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_bresse_hohneck = Domain.create(name: "La Bresse Hohneck", location: "88 Route de Vologne, 88250 La Bresse", name_url: "la-bresse-hohneck", mountain_chain: "vosges", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),

metabief_mont_dor = Domain.create(name: "Métabief Mont d'Or", location: "16 Rue du Village, 25370 Métabief", name_url: "metabief-mont-dor", mountain_chain: "jura", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_rousses = Domain.create(name: "Les Rousses", location: "parking de l'orbe, 39220 Les Rousses", name_url: "les-rousses", mountain_chain: "jura", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
monts_jura = Domain.create(name: "Monts Jura", location: "435 rue des Monts Jura, 01410 Lélex", name_url: "monts-jura", mountain_chain: "jura", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
]

puts "Seeds finished"







