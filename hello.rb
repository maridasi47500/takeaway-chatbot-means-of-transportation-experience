# app/models/user.rb
class User < ApplicationRecord
  has_many :experiences
  has_many :reflections
  has_many :takeaways
end

# app/models/experience.rb
class Experience < ApplicationRecord
  belongs_to :user
end

# app/models/reflection.rb
class Reflection < ApplicationRecord
  belongs_to :user
end

# app/models/delivery_vehicle.rb
class DeliveryVehicle < ApplicationRecord
  has_many :takeaways
end

# app/models/takeaway.rb
class Takeaway < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_vehicle
end
# Créer un takeaway pour un utilisateur
user = User.find_by(name: "Léa")
vehicle = DeliveryVehicle.find_by(name: "Train du Souvenir")

Takeaway.create!(
  user: user,
  message: "Ne pas courir après le bonheur, marcher avec lui.",
  summary: "le bonheur au quotidien",
  delivery_vehicle: vehicle
)
# Créer des utilisateurs
lea = User.create!(name: "Léa", mood: "curieuse", location: "Paris")
alex = User.create!(name: "Alex", mood: "rêveur", location: "Lyon")

# Créer des expériences
Experience.create!([
  { user: lea, category: "voyage", description: "Road trip en Écosse avec ma sœur", date: "2025-06-12" },
  { user: lea, category: "indoor_fun", description: "Soirée karaoké entre amis", date: "2025-07-01" },
  { user: alex, category: "sport", description: "Course de 10 km au bord du Rhône", date: "2025-06-20" }
])

# Créer des réflexions
Reflection.create!([
  { user: lea, content: "Parfois les silences en disent long…", date: "2025-07-03" },
  { user: alex, content: "Je me sens plus vivant quand je pédale sans but.", date: "2025-07-05" }
])

# Créer des véhicules de livraison
train = DeliveryVehicle.create!(name: "Train du Souvenir", vehicle_type: "imaginaire", description: "Transmet les souvenirs forts du passé")
bus = DeliveryVehicle.create!(name: "Bus des Bonnes Nouvelles", vehicle_type: "imaginaire", description: "Fait circuler les pensées positives")
scooter = DeliveryVehicle.create!(name: "Scooter des Pensées Urgentes", vehicle_type: "imaginaire", description: "Livreur express d’émotions brûlantes")
cloud = DeliveryVehicle.create!(name: "Cloud-car", vehicle_type: "numérique", description: "Envoie des messages lumineux dans le ciel virtuel")

# Créer des takeaways
Takeaway.create!([
  {
    user: lea,
    message: "Ne pas courir après le bonheur, marcher avec lui.",
    summary: "le bonheur au quotidien",
    delivery_vehicle: bus
  },
  {
    user: alex,
    message: "Les souvenirs sont des bagages légers mais puissants.",
    summary: "mémoire et émotion",
    delivery_vehicle: train
  }
])

