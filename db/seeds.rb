# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Domain.destroy_all

resorts = [
morzine = Domain.create(name: "Morzine", name_url: "morzine", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
val_disere = Domain.create(name: "Val d'Isère", name_url: "val-disere", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
chamonix = Domain.create(name: "Chamonix", name_url: "chamonix", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_karellis = Domain.create(name: "Les Karellis", name_url: "les-karellis", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_menuires = Domain.create(name: "Les Menuires", name_url: "les-menuires", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
meribel = Domain.create(name: "Méribel", name_url: "meribel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
avoriaz = Domain.create(name: "Avoriaz", name_url: "avoriaz", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
chatel = Domain.create(name: "Chatel", name_url: "chatel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_2_alpes = Domain.create(name: "les 2 Alpes", name_url: "les-2-alpes", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
alpe_dhuez = Domain.create(name: "Alpe d'Huez", name_url: "alpe-dhuez", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
courchevel = Domain.create(name: "Courchevel", name_url: "courchevel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_clusaz = Domain.create(name: "La Clusaz", name_url: "la-clusaz", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_arcs_bourg_st_maurice = Domain.create(name: "Les Arcs", name_url: "les-arcs-bourg-st-maurice", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
megeve = Domain.create(name: "Megève", name_url: "megeve", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
tignes = Domain.create(name: "Tignes", name_url: "tignes", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
val_cenis = Domain.create(name: "Val Cenis", name_url: "val-cenis", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
val_thorens = Domain.create(name: "Val Thorens", name_url: "val-thorens", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
valloire = Domain.create(name: "Valloire", name_url: "valloire", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
villard_de_lans = Domain.create(name: "Villard de Lans", name_url: "villard-de-lans", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
flaine = Domain.create(name: "Flaine", name_url: "flaine", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_plagne = Domain.create(name: "La Plagne", name_url: "la-plagne", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
la_rosiere_1850 = Domain.create(name: "La Rosière 1850", name_url: "la-rosiere-1850", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_contamines_montjoie = Domain.create(name: "Les Contamines Montjoie", name_url: "les-contamines-montjoie", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_gets = Domain.create(name: "Les Gets", name_url: "les-gets", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_saisies = Domain.create(name: "Les Saisies", name_url: "les-saisies", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
saint_francois_longchamp = Domain.create(name: "Saint François Longchamp", name_url: "saint-francois-longchamp", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
combloux = Domain.create(name: "Combloux", name_url: "combloux", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_7_laux = Domain.create(name: "Les 7 Laux", name_url: "les-7-laux", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
les_carroz = Domain.create(name: "Les Carroz", name_url: "les-carroz", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
saint_martin_de_belleville = Domain.create(name: "Saint Martin de Belleville", name_url: "saint-martin-de-belleville", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil),
valmorel = Domain.create(name: "Valmorel", name_url: "valmorel", mountain_chain: "alpes-du-nord", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
]


# vars = Domain.create(name: "Vars", name_url: "vars", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# isola_2000 = Domain.create(name: "Isola 2000", name_url: "isola-2000", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# la_grave_la_meije = Domain.create(name: "La Grave la Meije", name_url: "la-grave-la-meije", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# sauze_supersauze = Domain.create(name: "Sauze Super Sauze", name_url: "sauze-supersauze", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# montgenevre = Domain.create(name: "Montgenèvre", name_url: "montgenevre", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# serre_chevalier = Domain.create(name: "Serre Chevalier", name_url: "serre-chevalier", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# praloup = Domain.create(name: "Praloup", name_url: "praloup", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# puy_saint_vincent = Domain.create(name: "Puy Saint Vincent", name_url: "puy-saint-vincent", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# les_orres = Domain.create(name: "Les Orres", name_url: "les-orres", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# risoul = Domain.create(name: "Risoul", name_url: "risoul", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# superdevoluy_la_joue_du_loup = Domain.create(name: "Superdevoluy / La Joue du Loup", name_url: "superdevoluy-la-joue-du-loup", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# orcieres = Domain.create(name: "Orcières Merlette", name_url: "orcieres", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# auron = Domain.create(name: "Auron", name_url: "auron", mountain_chain: "alpes-du-sud", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)


# la_mongie_bareges = Domain.create(name: "Grand Tourmalet (La Mongie / Barèges)", name_url: "la-mongie-bareges", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# peyragudes = Domain.create(name: "Peyragudes", name_url: "peyragudes", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# saint_lary_soulan = Domain.create(name: "Saint Lary Soulan", name_url: "saint-lary-soulan", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# piau_engaly = Domain.create(name: "Piau Engaly", name_url: "piau-engaly", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# ax_3_domaines = Domain.create(name: "Ax 3 domaines", name_url: "ax-3-domaines", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# eyne_cambre_daze = Domain.create(name: "Espace Cambre d’Aze", name_url: "eyne-cambre-daze", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# les_angles = Domain.create(name: "Les Angles", name_url: "les-angles", mountain_chain: "pyrenees", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)

# la_croix_de_bauzon = Domain.create(name: "La Croix de Bauzon", name_url: "la-croix-de-bauzon", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# le_bleymard = Domain.create(name: "Le Bleymard - Mont Lozère", name_url: "le-bleymard", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# le_lioran = Domain.create(name: "Le Lioran", name_url: "le-lioran", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# mont_aigoual = Domain.create(name: "Prat Peyrot - Mont Aigoual", name_url: "mont-aigoual", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# besse_super_besse = Domain.create(name: "Besse Super Besse", name_url: "besse-super-besse", mountain_chain: "massif-central", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)

# le_ballon_dalsace = Domain.create(name: "Le Ballon d'Alsace", name_url: "le-ballon-dalsace", mountain_chain: "vosges", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# gerardmer = Domain.create(name: "Gérardmer", name_url: "gerardmer", mountain_chain: "vosges", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
# la_bresse_hohneck = Domain.create(name: "La Bresse Hohneck", name_url: "la-bresse-hohneck", mountain_chain: "vosges", is_sunny: nil, forecast_data: nil, snow_depth_low: nil, snow_depth_high: nil)
