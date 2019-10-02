//
//  ViewController.swift
//  informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contactos : [Contacto] = []
    
    @IBOutlet weak var tvContacto: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactos.append((Contacto(nombre: "Jose Trejo", telefono: "1231543", direccion: "calle 2", correo: "josetrejo@hotmail.com", foto: "images")))
        contactos.append((Contacto(nombre: "Luis Juares", telefono: "153215", direccion: "calle 2", correo: "josetrejo@hotmail.com", foto: "images (1)")))
        contactos.append((Contacto(nombre: "Fer Lopez", telefono: "123153", direccion: "calle 2", correo: "josetrejo@hotmail.com", foto: "images (2)")))
        contactos.append((Contacto(nombre: "Ana Ruiz", telefono: "6652315", direccion: "calle 2", correo: "josetrejo@hotmail.com", foto: "images (3)")))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre
        if (contactos[indexPath.row].telefono != nil){
        celda?.lblTelefono.text = contactos[indexPath.row].telefono
        } else{
            celda?.lblTelefono.text = ""
        }
        
        
        return celda!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 182
    }
    
    func recargarTabla () {
        tvContacto.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar" {
            let destino = segue.destination as? EditarContactoController
            destino?.contacto = contactos [tvContacto.indexPathForSelectedRow!.row]
            destino?.callbackActualizarTabla = recargarTabla
            
        }
    }
    

}

