//
//  datosTodosJuegos.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 15/2/23.
//

import Foundation
struct TodosJuegos: Codable
{
    var id_producto: Int = 0
    var nombre_juego: String = ""
    var id_vendedor: Int = 0
    var descripcion_juego: String = ""
    var url_imagen: String = ""
    var genero: String = ""
    var precio: Double = 0.0
}
