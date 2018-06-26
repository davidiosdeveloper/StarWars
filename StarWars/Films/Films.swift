//
//  ViewController.swift
//  StarWars
//
//  Created by David Santiago on 26/06/18.
//  Copyright © 2018 David Santiago. All rights reserved.
//

import UIKit
import Foundation


class Films: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    var film_selected = 0
    var mysegue = "mysegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitialConfig()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.film_selected = indexPath.row
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: self.mysegue, sender: nil)
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.mysegue {
            let destination:FilmsDetails = segue.destination as! FilmsDetails
            destination.film_selected = self.film_selected
            for f in FilmsArray[self.film_selected].characters {
                for c in CharactersArray {
                    if f == c.url {
                        destination.charactersInMovie.append(c)
                    }
                }
            }
        }
    }
}

extension Films {
    func InitialConfig(){
        EsconderBarraNavegacion(nav: self.navigationController!)
        if FilmsArray.count == 0 {
            CargarFilms(completion: {
                (result)->() in
                CargarPersonajes(completion: {
                    (result)->() in
                    Do_Table_Refresh(table: self.tableView)
                })
            })
        }else {
            Do_Table_Refresh(table: self.tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FilmsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmsCell
        
        cell.director.text = "Director: \(FilmsArray[i].director)"
        cell.titulo.text = "Título: \(FilmsArray[i].title)"
        cell.productor.text = "Productor(es): \(FilmsArray[i].producer)"
        cell.fecha.text = "Lanzamiento: \(FilmsArray[i].release_date)"
        cell.cast.text = "\(ListaDePersonajes())"
        cell.filmImage.image = UIImage(named:"episode_\(FilmsArray[i].episode_id)")
        cell.filmImage.layer.cornerRadius = 8
        cell.filmImage.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -50, 0, 0)
        cell.layer.transform = transform
        let time:TimeInterval = 0.5
        UIView.animate(withDuration: time, animations: {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        })
    }
}


class FilmsCell:UITableViewCell {
    @IBOutlet weak var filmImage:UIImageView!
    @IBOutlet weak var titulo:UILabel!
    @IBOutlet weak var director:UILabel!
    @IBOutlet weak var productor:UILabel!
    @IBOutlet weak var fecha:UILabel!
    @IBOutlet weak var cast:UILabel!
}
