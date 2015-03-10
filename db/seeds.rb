# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restaurants = Restaurant.create([
  {
    name: "Steuben's",
    latitude: 39.743376,
    longitude: -104.980397,
    kid_friendly: true,
    kids_menu: true,
    address: "523 E 17th Ave",
    locality: "Denver",
    region: "CO",
    postcode: "80203",
    phone_number: "(303) 830-1001",
    website: "http://www.steubens.com/",
    cuisine: ["American","Traditional","Burgers","Sandwiches","Pub Food"]
  },
  {
    name: "Cherry Cricket",
    latitude: 39.719513,
    longitude: -104.956276,
    kid_friendly: true,
    kids_menu: true,
    address: "2641 E 2nd Ave",
    locality: "Denver",
    region: "CO",
    postcode: "80206",
    phone_number: "(303) 322-7666",
    website: "http://www.cherrycricket.com",
    cuisine: ["Burgers","American","Pub Food","Mexican","Traditional"]
  },
  {
    name: "Washington Park Grille",
    latitude: 39.696777,
    longitude: -104.96149,
    kid_friendly: true,
    kids_menu: false,
    address: "1096 S Gaylord St",
    locality: "Denver",
    region: "CO",
    postcode: "80209",
    phone_number: "",
    website: "",
    cuisine: ["American","Italian"]
  },
  {
    name: "Wynkoop Brewing Company",
    latitude: 39.753444,
    longitude: -104.998482,
    kid_friendly: true,
    kids_menu: false,
    address: "1634 18th St",
    locality: "Denver",
    region: "CO",
    postcode: "80202",
    phone_number: "(303) 297-2700",
    website: "http://www.wynkoop.com",
    cuisine: ["American","Pub Food"]
  },
  {
    name: "X Bar",
    latitude: 39.740223,
    longitude: -104.979047,
    kid_friendly: false,
    kids_menu: false,
    address: "629 E Colfax Ave",
    locality: "Denver",
    region: "CO",
    postcode: "80203",
    phone_number: "(303) 832-2687",
    website: "http://www.xbardenver.com",
    cuisine: ["American"]
  },
  {
    name: "Lola",
    latitude: 39.759169,
    longitude: -105.010826,
    kid_friendly: true,
    kids_menu: false,
    address: "1575 Boulder St",
    locality: "Denver",
    region: "CO",
    postcode: "80211",
    phone_number: "(720) 570-8686",
    website: "http://www.loladenver.com",
    cuisine: ["Mexican","Seafood"]
  },
  {
    name: "Root Down",
    latitude: 39.763101,
    longitude: -105.005626,
    kid_friendly: true,
    kids_menu: false,
    address: "1600 W 33rd Ave",
    locality: "Denver",
    region: "CO",
    postcode: "80211",
    phone_number: "(303) 993-4200",
    website: "http://www.rootdowndenver.com",
    cuisine: ["American","Vegetarian","International"]
  },
  {
    name: "City O' City",
    latitude: 39.736779,
    longitude: -104.984556,
    kid_friendly: false,
    kids_menu: false,
    address: "206 E 13th Ave",
    locality: "Denver",
    region: "CO",
    postcode: "80203",
    phone_number: "(303) 831-6443",
    website: "http://www.cityocitydenver.com",
    cuisine: ["Vegetarian","Coffee","Pizza","Vegan","American"]
  },
  {
    name: "Great Divide Brewing Co.",
    latitude: 39.753797,
    longitude: -104.988534,
    kid_friendly: false,
    kids_menu: false,
    address: "2201 Arapahoe St",
    locality: "Denver",
    region: "CO",
    postcode: "80205",
    phone_number: "(303) 296-9460",
    website: "http://www.greatdivide.com/",
    cuisine: ["Pub Food"]
  },
  {
    name: "The Lobby",
    latitude: 39.753483,
    longitude: -104.988863,
    kid_friendly: true,
    kids_menu: false,
    address: "2191 Arapahoe St",
    locality: "Denver",
    region: "CO",
    postcode: "80205",
    phone_number: "(303) 997-9911",
    website: "http://www.thelobbydenver.com",
    cuisine: ["American"]
  }
  ])
