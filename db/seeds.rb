# db/seeds.rb

Season.find_or_create_by!(
  name: "Spira League Season 1",
  year: 2024,
  active: true
)

aurochs = Team.find_or_create_by!(name: "Besaid Aurochs") do |t|
  t.city = "Besaid"
  t.color = "#00b4d8"
end

goers = Team.find_or_create_by!(name: "Luca Goers") do |t|
  t.city = "Luca"
  t.color = "#C0392B"
end

psyches = Team.find_or_create_by!(name: "Al Bhed Psyches") do |t|
  t.city = "Home"
  t.color = "#E67E22"
end

fangs = Team.find_or_create_by!(name: "Ronso Fangs") do |t|
  t.city = "Mt Gagazet"
  t.color = "#8E44AD"
end

glories = Team.find_or_create_by!(name: "Guado Glories") do |t|
  t.city = "Guadosalam"
  t.color = "#1ABC9C"
end

beasts = Team.find_or_create_by!(name: "Kilika Beasts") do |t|
  t.city = "Kilika"
  t.color = "#F39C12"
end

players = [
  # Besaid Aurochs
  { name: "Tidus", team: aurochs, sh: 13, pa: 6, bl: 3, en: 4, sp: 70, at: 5, level: 1 },
  { name: "Wakka", team: aurochs, sh: 17, pa: 5, bl: 4, en: 5, sp: 50, at: 6, level: 1 },
  { name: "Datto", team: aurochs, sh: 5, pa: 9, bl: 5, en: 6, sp: 40, at: 4, level: 1 },
  { name: "Letty", team: aurochs, sh: 4, pa: 4, bl: 8, en: 7, sp: 35, at: 7, level: 1 },
  { name: "Jassu", team: aurochs, sh: 3, pa: 7, bl: 6, en: 5, sp: 42, at: 5, level: 1 },
  { name: "Botta", team: aurochs, sh: 6, pa: 8, bl: 5, en: 6, sp: 38, at: 6, level: 1 },
  { name: "Keepa", team: aurochs, sh: 2, pa: 3, bl: 10, en: 12, sp: 25, at: 3, level: 1 },

  # Luca Goers
  { name: "Bickson", team: goers, sh: 14, pa: 7, bl: 5, en: 6, sp: 55, at: 7, level: 1 },
  { name: "Abus", team: goers, sh: 10, pa: 8, bl: 6, en: 7, sp: 48, at: 6, level: 1 },
  { name: "Graav", team: goers, sh: 8, pa: 10, bl: 7, en: 8, sp: 44, at: 8, level: 1 },
  { name: "Doram", team: goers, sh: 6, pa: 9, bl: 8, en: 9, sp: 40, at: 9, level: 1 },
  { name: "Balgerda", team: goers, sh: 5, pa: 5, bl: 11, en: 13, sp: 28, at: 10, level: 1 },
  { name: "Raudy", team: goers, sh: 3, pa: 4, bl: 12, en: 15, sp: 22, at: 5, level: 1 },

  # Al Bhed Psyches
  { name: "Eigaar", team: psyches, sh: 11, pa: 9, bl: 4, en: 5, sp: 60, at: 5, level: 1 },
  { name: "Blappa", team: psyches, sh: 9, pa: 11, bl: 5, en: 6, sp: 55, at: 4, level: 1 },
  { name: "Berrik", team: psyches, sh: 7, pa: 8, bl: 7, en: 7, sp: 50, at: 6, level: 1 },
  { name: "Judda", team: psyches, sh: 5, pa: 7, bl: 9, en: 8, sp: 45, at: 7, level: 1 },
  { name: "Lakkam", team: psyches, sh: 4, pa: 5, bl: 11, en: 10, sp: 35, at: 8, level: 1 },
  { name: "Nimrook", team: psyches, sh: 2, pa: 3, bl: 14, en: 16, sp: 20, at: 4, level: 1 },

  # Ronso Fangs
  { name: "Basik Ronso", team: fangs, sh: 10, pa: 6, bl: 8, en: 12, sp: 35, at: 14, level: 1 },
  { name: "Argai Ronso", team: fangs, sh: 8, pa: 5, bl: 10, en: 14, sp: 30, at: 15, level: 1 },
  { name: "Gazna Ronso", team: fangs, sh: 6, pa: 7, bl: 9, en: 13, sp: 32, at: 13, level: 1 },
  { name: "Nuvy Ronso", team: fangs, sh: 5, pa: 8, bl: 7, en: 11, sp: 36, at: 12, level: 1 },
  { name: "Irga Ronso", team: fangs, sh: 4, pa: 4, bl: 13, en: 15, sp: 25, at: 16, level: 1 },
  { name: "Zamzi Ronso", team: fangs, sh: 3, pa: 3, bl: 15, en: 17, sp: 20, at: 11, level: 1 },

  # Guado Glories
  { name: "Giera Guado", team: glories, sh: 12, pa: 11, bl: 6, en: 5, sp: 52, at: 6, level: 1 },
  { name: "Zazi Guado", team: glories, sh: 10, pa: 13, bl: 7, en: 6, sp: 48, at: 5, level: 1 },
  { name: "Navara Guado", team: glories, sh: 8, pa: 12, bl: 8, en: 7, sp: 45, at: 7, level: 1 },
  { name: "Auda Guado", team: glories, sh: 6, pa: 10, bl: 9, en: 8, sp: 42, at: 8, level: 1 },
  { name: "Pah Guado", team: glories, sh: 4, pa: 8, bl: 11, en: 10, sp: 36, at: 9, level: 1 },
  { name: "Noy Guado", team: glories, sh: 3, pa: 6, bl: 13, en: 14, sp: 28, at: 7, level: 1 },

  # Kilika Beasts
  { name: "Larbeight", team: beasts, sh: 15, pa: 5, bl: 3, en: 4, sp: 65, at: 4, level: 1 },
  { name: "Isken", team: beasts, sh: 11, pa: 7, bl: 5, en: 5, sp: 58, at: 5, level: 1 },
  { name: "Vuroja", team: beasts, sh: 9, pa: 9, bl: 6, en: 6, sp: 50, at: 6, level: 1 },
  { name: "Kulukan", team: beasts, sh: 7, pa: 8, bl: 7, en: 7, sp: 46, at: 7, level: 1 },
  { name: "Deim", team: beasts, sh: 5, pa: 6, bl: 9, en: 9, sp: 38, at: 8, level: 1 },
  { name: "Nizarut", team: beasts, sh: 3, pa: 4, bl: 12, en: 14, sp: 26, at: 6, level: 1 },

  # Free Agents
  { name: "Nedus", sh: 12, pa: 7, bl: 4, en: 8, sp: 75, at: 5, level: 1 },
  { name: "Zev Ronso", sh: 8, pa: 5, bl: 10, en: 13, sp: 33, at: 14, level: 1 },
  { name: "Zalitz", sh: 6, pa: 6, bl: 11, en: 10, sp: 38, at: 15, level: 1 },
  { name: "Vilucha", sh: 7, pa: 9, bl: 6, en: 7, sp: 48, at: 7, level: 1 },
  { name: "Brother", sh: 5, pa: 8, bl: 5, en: 6, sp: 80, at: 5, level: 1 }
]

players.each do |attrs|
  player = Player.find_or_initialize_by(name: attrs[:name])
  player.update!(attrs)
end

puts "Seeded #{Team.count} teams and #{Player.count} players."
