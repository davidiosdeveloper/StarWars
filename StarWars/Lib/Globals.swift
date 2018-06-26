//
//  Globals.swift
//  StarWars
//
//  Created by David Santiago on 26/06/18.
//  Copyright © 2018 David Santiago. All rights reserved.
//

import Foundation



var GlbUrl = "https://swapi.co/api"
var GlbAppName = "Star Wars"



var FilmsArray:[(episode_id:String, vehicles:[String], producer:String, planets:[String], characters:[String], release_date:String, edited:String, director:String, opening_crawl:String, created:String, title:String, starships:[String], url:String, species:[String])] = []
var CharactersArray:[(name:String, height:String, mass:String, hair_color:String, skin_color:String, eye_colors:String, birth_year:String, gender:String, homeworld:String, films:[String], species:[String], vehicles:[String], starships:[String], created:String, edited:String, url:String)] = []
var VehiclesArray:[(name:String, model:String, manufacturer:String, cost_in_credits:String, length:String, max_atmosphering_speed:String, crew:String, passengers:String, cargo_capacity:String, consumables:String, vehicle_class:String, pilots:[String], created:String, edited:String, url:String)] = []
var StarshipsArray:[(name:String, model:String, manufacturer:String, cost_in_credits:String, length:String, max_atmosphering_speed:String, crew:String, passengers:String, cargo_capacity:String, consumables:String, hyperdrive_rating:String,MGLT:String, starship_class:String, pilots:[String],films:[String], created:String, edited:String, url:String)] = []



