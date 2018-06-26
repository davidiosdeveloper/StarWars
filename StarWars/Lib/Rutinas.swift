//
//  Rutinas.swift
//  StarWars
//
//  Created by David Santiago on 26/06/18.
//  Copyright © 2018 David Santiago. All rights reserved.
//
import Foundation
import UIKit
import SwiftyJSON


func PromptActionSheet(view:UIViewController, items:[String], titulo:String, completion: @escaping (_ result: Int)->()) {
    var miAux:[(id:Int, texto:String)] = []
    var aux = 1
    for i in items {
        miAux.append((id:aux, texto:i))
        aux = aux + 1
    }
    DispatchQueue.main.async(execute: {
        let miActionSheet = UIAlertController(title: GlbAppName, message: titulo, preferredStyle: UIAlertControllerStyle.actionSheet)
        for i in miAux {
            let nuevoItem = UIAlertAction(title: i.texto, style: UIAlertActionStyle.default, handler: { void in
                completion(i.id)
            })
            miActionSheet.addAction(nuevoItem)
        }
        let cancelar = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: { void in
            completion(0)
        })
        miActionSheet.addAction(cancelar)
        view.present(miActionSheet, animated: true, completion: nil)
    })
}


func CargarDatosJSON(cadena:String, completion: @escaping (_ result: JSON)->()) {
    print("Se envio \(cadena)")
    let myUrl = NSURL(string: "\(cadena)");
    let request = NSMutableURLRequest(url:myUrl! as URL);
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        if error != nil {
            DispatchQueue.main.async(execute: {
                print("Hay un error aca");
                return
            })
        }
        if let safeData = data {
            let json = JSON(safeData)
            completion (json)
        }else {
            //AlertErrorConexion(vista: self)
        }
    }
    task.resume()
    return
}


func EsconderBarraNavegacion(nav:UINavigationController){
    nav.isNavigationBarHidden = true
}

func Do_Table_Refresh(table:UITableView){
    DispatchQueue.main.async(execute: {
        table.reloadData()
    })
}
