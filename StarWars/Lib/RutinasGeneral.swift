//
//  RutinasFilm.swift
//  StarWars
//
//  Created by David Santiago on 26/06/18.
//  Copyright © 2018 David Santiago. All rights reserved.
//

import Foundation
import SwiftyJSON

func CargarFilms(completion: @escaping (_ result: Bool)->()) {
    CargarDatosJSON(cadena:"\(GlbUrl)/films/?format=json", completion: {
        (result)->() in
        for (_,sub):(String, JSON) in result["results"] {
            FilmsArray.append((
                episode_id:sub["episode_id"].stringValue,
                vehicles: sub["vehicles"].arrayObject as! [String],
                producer:sub["producer"].stringValue,
                planets: sub["planets"].arrayObject as! [String],
                characters:sub["characters"].arrayObject as! [String],
                release_date:sub["release_date"].stringValue,
                edited:sub["edited"].stringValue,
                director:sub["director"].stringValue,
                opening_crawl:sub["opening_crawl"].stringValue,
                created:sub["created"].stringValue,
                title:sub["title"].stringValue,
                starships:sub["starships"].arrayObject as! [String],
                url:sub["url"].stringValue,
                species:sub["species"].arrayObject as! [String]))
        }
        completion(true)
    })
}

func CargarPersonajes(completion: @escaping (_ result: Bool)->()) {
    CargarDatosJSON(cadena:"\(GlbUrl)/people/?format=json", completion: {
        (result)->() in
        for (_,sub):(String, JSON) in result["results"] {
            CharactersArray.append((
                name: sub["name"].stringValue,
                height:sub["height"].stringValue,
                mass:sub["mass"].stringValue,
                hair_color:sub["hair_color"].stringValue,
                skin_color:sub["skin_color"].stringValue,
                eye_colors:sub["eye_color"].stringValue,
                birth_year:sub["birth_year"].stringValue,
                gender:sub["gender"].stringValue,
                homeworld:sub["homeworld"].stringValue,
                films: sub["films"].arrayObject as! [String],
                species:sub["species"].arrayObject as! [String],
                vehicles:sub["vehicles"].arrayObject as! [String],
                starships:sub["starships"].arrayObject as! [String],
                created:sub["created"].stringValue,
                edited:sub["edited"].stringValue,
                url:sub["url"].stringValue))
        }
        completion(true)
    })
}

func CargarVehiculos(completion: @escaping (_ result: Bool)->()) {
    CargarDatosJSON(cadena:"\(GlbUrl)/vehicles/?format=json", completion: {
        (result)->() in
        for (_,sub):(String, JSON) in result["results"] {
            VehiclesArray.append((
                name:sub["name"].stringValue,
                model:sub["model"].stringValue,
                manufacturer:sub["manufacturer"].stringValue,
                cost_in_credits:sub["cost_in_credits"].stringValue,
                length:sub["length"].stringValue,
                max_atmosphering_speed: sub["max_atmosphering_speed"].stringValue,
                crew:sub["crew"].stringValue,
                passengers:sub["passengers"].stringValue,
                cargo_capacity:sub["cargo_capacity"].stringValue,
                consumables:sub["consumables"].stringValue,
                vehicle_class:sub["vehicle_class"].stringValue,
                pilots:sub["pilots"].arrayObject as! [String],
                created:sub["created"].stringValue,
                edited:sub["edited"].stringValue,
                url:sub["url"].stringValue
            ))
        }
        completion(true)
    })
}

func CargarStarships(completion: @escaping (_ result: Bool)->()) {
    CargarDatosJSON(cadena:"\(GlbUrl)/starships/?format=json", completion: {
        (result)->() in
        for (_,sub):(String, JSON) in result["results"] {
            StarshipsArray.append((
                name:sub["name"].stringValue,
                model:sub["model"].stringValue,
                manufacturer:sub["manufacturer"].stringValue,
                cost_in_credits:sub["cost_in_credits"].stringValue,
                length:sub["length"].stringValue,
                max_atmosphering_speed: sub["max_atmosphering_speed"].stringValue,
                crew:sub["crew"].stringValue,
                passengers:sub["passengers"].stringValue,
                cargo_capacity:sub["cargo_capacity"].stringValue,
                consumables:sub["consumables"].stringValue,
                hyperdrive_rating:sub["hyperdrive_rating"].stringValue,
                MGLT:sub["MGLT"].stringValue,
                starship_class:sub["vehicle_class"].stringValue,
                pilots:sub["pilots"].arrayObject as! [String],
                films:sub["films"].arrayObject as! [String],
                created:sub["created"].stringValue,
                edited:sub["edited"].stringValue,
                url:sub["url"].stringValue
            ))
        }
        completion(true)
    })
}


func ListaDePersonajes()->String {
    var lista = ""
    for C in CharactersArray {
        if lista == "" {
            lista = C.name
        }else {
            lista = "\(lista), \(C.name)"
        }
    }
    return lista
}

