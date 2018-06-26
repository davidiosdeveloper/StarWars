//
//  Starships.swift
//  StarWars
//
//  Created by David Santiago on 26/06/18.
//  Copyright © 2018 David Santiago. All rights reserved.
//

import Foundation
import UIKit

class Starships: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitialConfig()
    }
    func InitialConfig(){
        EsconderBarraNavegacion(nav: self.navigationController!)
        if StarshipsArray.count == 0 {
            CargarStarships(completion: {
                (result)->() in
                Do_Table_Refresh(table: self.tableView)
            })
        }else {
            Do_Table_Refresh(table: self.tableView)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StarshipsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StarshipsCell
        
        cell.nombre.text = "Nombre: \(StarshipsArray[i].name)"
        cell.modelo.text = "Modelo: \(StarshipsArray[i].model)"
        cell.manufacturador.text = "Manufacturador: \(StarshipsArray[i].manufacturer)"
        cell.cost.text = "Costo: \(StarshipsArray[i].cost_in_credits)"
        cell.lenght.text = "Tamaño: \(StarshipsArray[i].length)"
        cell.crew.text = "Tripulación: \(StarshipsArray[i].crew)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
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


class StarshipsCell:UITableViewCell {
    @IBOutlet weak var nombre:UILabel!
    @IBOutlet weak var modelo:UILabel!
    @IBOutlet weak var manufacturador:UILabel!
    @IBOutlet weak var cost:UILabel!
    @IBOutlet weak var lenght:UILabel!
    @IBOutlet weak var crew:UILabel!
}
