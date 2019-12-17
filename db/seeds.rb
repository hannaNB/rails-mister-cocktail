# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'json'
require 'open-uri'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating cocktails, ingredients...'

cocktails_attributes = [
    {
    name: "Martini",
    picture_url: 'https://images.unsplash.com/photo-1571577556441-cd4af9c209f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Margarita",
    picture_url: 'https://images.unsplash.com/photo-1461823385004-d7660947a7c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Cuba Libre",
    picture_url: 'https://images.unsplash.com/photo-1575650772417-e6b418b0d106?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Gin tonic",
    picture_url: 'https://images.unsplash.com/photo-1563556812239-013bf57d6aeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    }, 
    {
    name: "Cosmopolitan",
    picture_url: 'https://images.unsplash.com/photo-1575650772417-e6b418b0d106?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Caïpirinha",
    picture_url: 'https://images.unsplash.com/photo-1570813092574-b4cccfc58f9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Pink Love",
    picture_url: 'https://images.unsplash.com/photo-1549987024-8f2248d5514c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Gin fizz",
    picture_url: 'https://images.unsplash.com/photo-1514447199254-1417a6fcbed2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "White Lady",
    picture_url: 'https://images.unsplash.com/photo-1570821574759-c104ca40f7b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Singapore sling",
    picture_url: 'https://images.unsplash.com/photo-1563223771-375783ee91ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Piña colada",
    picture_url: 'https://images.unsplash.com/photo-1490324120634-0fa86c62d6c1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Ti-punch",
    picture_url: 'https://images.unsplash.com/photo-1544145945-f90425340c7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Blue Hawaii",
    picture_url: 'https://images.unsplash.com/photo-1562708294-4df93280352d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Blody Mary",
    picture_url: 'https://images.unsplash.com/photo-1486947799489-3fabdd7d32a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Sex on the beach",
    picture_url: 'https://images.unsplash.com/photo-1550583429-ef06ff4d5a10?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Blue Lagoon",
    picture_url: 'https://images.unsplash.com/photo-1550555179-309357935820?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Blue Hawaii",
    picture_url: 'https://images.unsplash.com/photo-1567671899076-51a64ddb7c5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Manhattan",
    picture_url: 'https://images.unsplash.com/photo-1542847890-8c4210389b23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
    {
    name: "Old Fashioned",
    picture_url: 'https://images.unsplash.com/photo-1550426735-c33c7ce414ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'
    },
]
Cocktail.create!(cocktails_attributes)
ingredients_attributes = [
  {
  name: "Light rum"
  },
  {
  name: "Applejack"
  },
  {
  name: "Gin"
  },
  {
  name: "Dark rum"
  },
  {
  name: "Sweet Vermouth"
  },
  {
  name: "Strawberry schnapps"
  },
  {
  name: "Scotch"
  },
  {
  name: "Apricot brandy"
  },
  {
  name: "Triple sec"
  },
  {
  name: "Southern Comfort"
  },
  {
  name: "Orange bitters"
  },
  {
  name: "Brandy"
  },
  {
  name: "Lemon vodka"
  },
  {
  name: "Blended whiskey"
  },
  {
  name: "Dry Vermouth"
  },
  {
  name: "Amaretto"
  },
  {
  name: "Tea"
  },
  {
  name: "Champagne"
  },
  {
  name: "Coffee liqueur"
  },
  {
  name: "Bourbon"
  },
  {
  name: "Tequila"
  },
  {
  name: "Vodka"
  },
  {
  name: "Añejo rum"
  },
  {
  name: "Bitters"
  },
  {
  name: "Sugar"
  },
  {
  name: "Kahlua"
  },
  {
  name: "demerara Sugar"
  },
  {
  name: "Dubonnet Rouge"
  },
  {
  name: "Lime juice"
  },
  {
  name: "Irish whiskey"
  },
  {
  name: "Apple brandy"
  },
  {
  name: "Carbonated water"
  },
  {
  name: "Cherry brandy"
  },
  {
  name: "Creme de Cacao"
  },
  {
  name: "Grenadine"
  },
  {
  name: "Port"
  },
  {
  name: "Coffee brandy"
  },
  {
  name: "Red wine"
  },
  {
  name: "Rum"
  },
  {
  name: "Grapefruit juice"
  },
  {
  name: "Ricard"
  },
  {
  name: "Sherry"
  },
  {
  name: "Cognac"
  },
  {
  name: "Sloe gin"
  },
  {
  name: "Apple juice"
  },
  {
  name: "Pineapple juice"
  },
  {
  name: "Lemon juice"
  },
  {
  name: "Sugar syrup"
  },
  {
  name: "Milk"
  },
  {
  name: "Strawberries"
  },
  {
  name: "Chocolate syrup"
  },
  {
  name: "Yoghurt"
  },
  {
  name: "Mango"
  },
  {
  name: "Ginger"
  },
  {
  name: "Lime"
  },
  {
  name: "Cantaloupe"
  },
  {
  name: "Berries"
  },
  {
  name: "Grapes"
  },
  {
  name: "Kiwi"
  },
  {
  name: "Tomato juice"
  },
  {
  name: "Cocoa powder"
  },
  {
  name: "Chocolate"
  },
  {
  name: "Heavy cream"
  },
  {
  name: "Galliano"
  },
  {
  name: "Peach Vodka"
  },
  {
  name: "Ouzo"
  },
  {
  name: "Coffee"
  },
  {
  name: "Spiced rum"
  },
  {
  name: "Water"
  },
  {
  name: "Espresso"
  },
  {
  name: "Angelica root"
  },
  {
  name: "Orange"
  },
  {
  name: "Cranberries"
  },
  {
  name: "Johnnie Walker"
  },
  {
  name: "Apple cider"
  },
  {
  name: "Everclear"
  },
  {
  name: "Cranberry juice"
  },
  {
  name: "Egg yolk"
  },
  {
  name: "Egg"
  },
  {
  name: "Grape juice"
  },
  {
  name: "Peach nectar"
  },
  {
  name: "Lemon"
  },
  {
  name: "Firewater"
  },
  {
  name: "Lemonade"
  },
  {
  name: "Lager"
  },
  {
  name: "Whiskey"
  },
  {
  name: "Absolut Citron"
  },
  {
  name: "Pisco"
  },
  {
  name: "Irish cream"
  },
  {
  name: "Ale"
  },
  {
  name: "Chocolate liqueur"
  },
  {
  name: "Midori melon liqueur"
  },
  {
  name: "Sambuca"
  },
  {
  name: "Cider"
  },
  {
  name: "Sprite"
  },
  {
  name: "7-Up"
  },
  {
  name: "Blackberry brandy"
  },
  {
  name: "Peppermint schnapps"
  },
  {
  name: "Creme de Cassis"
  },
  {
  name: "Jack Daniels"
  }
]
Ingredient.create!(ingredients_attributes)
puts 'Finished!'