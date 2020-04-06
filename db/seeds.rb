# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

User.create(username: "Aphro603", 
  email: "william.zero@gigkloud.com", 
  password_digest: "dkfjhsd837837438473", 
  image_url: "https://dwilliamzero.com/zero-cloud/bitter-logo.png", 
  blurb: "I'm one of the coolest people on earth")

  User.create(username: "Bonzai69", 
    email: "william@gigkloud.com", 
    password_digest: "dkfjhsd837837438473", 
    image_url: "https://dwilliamzero.com/zero-cloud/bitter-logo.png", 
    blurb: "I'm one of the smartest people on earth")

    User.create(username: "BumbleMuncher69", 
      email: "william1@gigkloud.com", 
      password_digest: "dkfjhsd8sdf37837438473", 
      image_url: "https://dwilliamzero.com/zero-cloud/bitter-logo.png", 
      blurb: "I'm one of the sexiest people on earth")