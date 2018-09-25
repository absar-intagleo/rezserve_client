# == Schema Information
#
# Table name: categories
#
#  id                 :bigint(8)        not null, primary key
#  name               :string
#  parent_category_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Category < ApplicationRecord
	has_many :additional_beds, dependent: :destroy
	has_many :sub_categories, class_name: "Category",
                          foreign_key: "parent_category_id"
 
  belongs_to :parent_category, class_name: "Category", optional: true

  CATEGORIES = ["Bar","Dining","Exterior","Fitness","Guestroom","Interior","Lobby","Pool","Property Amenity","Spa","Sports Facility","View"]
  BARSUBCATEGORY = ["Hotel Bar","Hotel Lounge","Nightclub","Poolside Bar","Sports Bar"]
  DININGSUBCATEGORY = ["Breakfast Area","Buffet","Cafe","Coffee Service","Coffee Shop","Couples Dining","Delicatessen","Dining","Family Dining","Food and Drink","Food Court","Restaurant","Snack Bar"]
  EXTERIORSUBCATEGORY = ["Airport Shuttle","BBQ/Picnic Area","Beach","City Shuttle","Courtyard","Dock","Exterior","Exterior detail","Fountain","Garden","Gazebo","Hotel Entrance","Hotel Front","Hotel Front - Evening/Night","Lake","Marina","Outdoor Banquet Area","Outdoor Dining","Outdoor Wedding Area","Parking","Porch","Property Grounds","SundeckTerrace/Patio"]
  FITNESSSUBCATEGORY = ["Aerobics Facility","Exercise/Lap Pool","Fitness Facility","Fitness Studio","Gym","Pilates","Rock Climbing Wall - IndoorYoga"]
  GUESTROOMSUBCATEGORY = ["Balcony","Bathroom","Bathroom Amenities","Bathroom Shower","Bathroom Sink","Childrens Theme Room","Deep Soaking Bathtub","Guestroom","Guestroom View","In-Room Amenity","In-Room Business Center","In-Room Coffee","In-Room Dining","In-Room Kitchen","In-Room Kitchenette","In-Room Safe","Jetted Tub","Living Area","Living Room","Microwave","Mini-Refrigerator","Minibar","Room Service - Dining","Terrace/Patio"]
  INTERIORSUBCATEGORY = ["Ballroom","Banquet Hall","Business Center","Chapel","Executive Lounge","Fireplace","Hallway","Hotel Interior","Indoor Wedding","Interior Detail","Library","Meeting Facility","Reception Hall","Staircase"]
  LOBBYSUBCATEGORY = ["Check-in/Check-out Kiosk","Concierge Desk","Interior Entrance","Lobby","Lobby Lounge","Lobby Sitting Area","Reception"]
  POOLSUBCATEGORY = ["Aqua Center","Childrens Pool","Indoor Pool","Indoor Spa Tub","Indoor/Outdoor Pool","Infinity Pool","Natural Pool","Outdoor Pool","Outdoor Spa Tub","Pool","Pool Waterfall","Rooftop Pool","Water Park","Waterslide"]
  PROPERTYAMENITYSUBCATEGORY = ["ArcadeATM/Banking On site","Billiards","Birthday Party Area","Casino","Childrens Activities","Childrens Area","Childrens Play Area - Indoor","Childrens Play Area - Outdoor","Day Care","Game Room","Gift Shop","Karaoke Room","Laundry Room","Miscellaneous","Pet-Friendly","Property Amenity","RV or Truck Parking","Theater Show","Vending Machine"]
  SPASUBCATEGORY = ["Facial","Hair Salon","Massage","Nail Salon","Sauna","Spa","Spa Reception","Spa Treatment","Steam Room","Treatment Room","Turkish Bath","Vichy Shower"]
  SPORTSFACILITYSUBCATEGORY = ["Archery","Basketball Court","Bicycling","Boating","Equipment Storage","Fishing","Golf","Golf Cart","Hiking","Hunting","Indoor Golf Driving Range","Mini-Golf","Outdoor Rock Climbing","Pro Shop","Ropes Course (Team Building)","Ski Hill","Skiing","Snow and Ski Sports","Snowboarding","Sport Court","Sports Facility","Tennis Court"]
  VIEWSUBCATEGORY = ["Aerial View","Balcony View","Beach/Ocean View","City View","Courtyard View","Garden View","Lake View","Mountain View","Street View","View from Hotel"]
end
