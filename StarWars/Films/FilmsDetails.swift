//
//  FilmsDetails.swift
//  StarWars
//
//  Created by David Santiago on 26/06/18.
//  Copyright © 2018 David Santiago. All rights reserved.
//

import Foundation
import UIKit

class FilmsDetails:UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var cabecera:UILabel!
    @IBOutlet weak var popView:UIView!

    @IBOutlet weak var char_name:UILabel!
    @IBOutlet weak var char_height:UILabel!
    @IBOutlet weak var char_mass:UILabel!
    @IBOutlet weak var char_hair_color:UILabel!
    @IBOutlet weak var char_skin_color:UILabel!
    @IBOutlet weak var char_eye_color:UILabel!
    @IBOutlet weak var char_birth_year:UILabel!
    @IBOutlet weak var char_gender:UILabel!
    @IBOutlet weak var imagenFondo:UIImageView!
    var popBeingShown = false
    
    var charactersInMovie:[(name:String, height:String, mass:String, hair_color:String, skin_color:String, eye_colors:String, birth_year:String, gender:String, homeworld:String, films:[String], species:[String], vehicles:[String], starships:[String], created:String, edited:String, url:String)] = []
    var film_selected = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitialConfig()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let i = indexPath.row
        if indexPath.section == 1 {
            self.char_name.text = "Nombre: \(self.charactersInMovie[i].name)"
            self.char_height.text = "Estatura: \(self.charactersInMovie[i].height)"
            self.char_mass.text = "Peso: \(self.charactersInMovie[i].mass)"
            self.char_hair_color.text = "Color de cabello: \(self.charactersInMovie[i].hair_color)"
            self.char_skin_color.text = "Color de piel: \(self.charactersInMovie[i].skin_color)"
            self.char_eye_color.text = "Color de ojos: \(self.charactersInMovie[i].eye_colors)"
            self.char_birth_year.text = "Año de nacimiento: \(self.charactersInMovie[i].birth_year)"
            self.char_gender.text = "Genero: \(self.charactersInMovie[i].gender)"
            
            self.popView.alpha = 0.0
            let transform = CATransform3DTranslate(CATransform3DIdentity, -80, 0, 0)
            self.popView.layer.transform = transform
            let time:TimeInterval = 0.5
            
            UIView.animate(withDuration: time, animations: {
                self.popView.alpha = 1.0
                self.popView.layer.transform = CATransform3DIdentity
                self.popBeingShown = true
            })
        }
    }
    
    @IBAction func hiddePopView(sender:UIButton){
        self.hiddePop()
    }
    @objc func hiddePop(){
        if self.popBeingShown {
            self.popView.alpha = 1.0
            self.popView.layer.transform = CATransform3DIdentity
            let time:TimeInterval = 0.5
            UIView.animate(withDuration: time, animations: {
                self.popView.alpha = 0.0
                let transform = CATransform3DTranslate(CATransform3DIdentity, -80, 0, 0)
                self.popView.layer.transform = transform
                self.popBeingShown = false
            })
        }
    }
}

extension FilmsDetails {
    func InitialConfig(){
        self.cabecera.text = "Star Wars: \(FilmsArray[self.film_selected].title)"
        self.popView.alpha = 0.0
        self.popView.layer.cornerRadius = 12
        self.imagenFondo.layer.cornerRadius = 12
        self.imagenFondo.clipsToBounds = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmsDetailsCell
            cell.director.text = "Director: \(FilmsArray[self.film_selected].director)"
            cell.titulo.text = "Título: \(FilmsArray[self.film_selected].title)"
            cell.productor.text = "Productor(es): \(FilmsArray[self.film_selected].producer)"
            cell.fecha.text = "Lanzamiento: \(FilmsArray[self.film_selected].release_date)"
            cell.cast.text = "Editado: \(FilmsArray[self.film_selected].edited)"
            cell.filmImage.image = UIImage(named:"episode_\(FilmsArray[self.film_selected].episode_id)")
            cell.filmImage.layer.cornerRadius = 8
            cell.filmImage.clipsToBounds = true
            return cell
        }else if indexPath.section == 1 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellReparto", for: indexPath) as! FilmsDetailsCell
            if i > 0 {
                cell.titulo.text = ""
            }
            cell.cast.text = self.charactersInMovie[i].name
            return cell
        }else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellOpening", for: indexPath) as! FilmsDetailsCell
            cell.opening.text = FilmsArray[self.film_selected].opening_crawl
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return  160.0
        }else if indexPath.section == 1 {
            return 25.0
        }else if indexPath.section == 2 {
            let tamano = self.tamanoDeCampo(texto: FilmsArray[self.film_selected].opening_crawl, width: self.tableView.frame.width - 40)
            return tamano
        }
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return self.charactersInMovie.count
        }
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    @IBAction func irAtras(sender: UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    func tamanoDeCampo(texto:String,width: CGFloat) -> CGFloat {
        let font = UIFont(name: "KohinoorBangla-Regular", size: 12)!
        let labelSize = texto.boundingRect(with: CGSize(width: CGFloat(width), height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil).size
        return CGFloat(labelSize.height)
    }
}


class FilmsDetailsCell:UITableViewCell {
    @IBOutlet weak var filmImage:UIImageView!
    @IBOutlet weak var titulo:UILabel!
    @IBOutlet weak var director:UILabel!
    @IBOutlet weak var productor:UILabel!
    @IBOutlet weak var fecha:UILabel!
    @IBOutlet weak var cast:UILabel!
    @IBOutlet weak var opening:UILabel!
}
