# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create(email: "kogi@McKogi.com", password: "password12345")
Training.create(name: "Applied Data Science", description: "Du blabla pour dire qu'on fait de la statistique", credit: 0)
Course.create!(name: "mathematics000", description: "un ptit pied laurier bien charge de fleur", code: "MATH000", credit: 12, teacher_id:User.first.id)
Course.create!(name: "mathematics001", description: "un ptit pied laurier bien charge de fleur", code: "MATH001", credit: 13, teacher_id:User.first.id)
Course.create!(name: "mathematics002", description: "un ptit pied laurier bien charge de fleur", code: "MATH002", credit: 15, teacher_id:User.first.id)
Training.create(name: "Applied Computer Science", description: "CodingDu blabla pour dire qu'on fait du coding", credit: 0)
