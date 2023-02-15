//
//  datosJuegoUsuario.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 15/2/23.
//

import Foundation
struct Datos: Codable
{
    struct Commit: Codable
    {
        struct Author: Codable
        {
            var name: String
            var email: String
            var date: String
        }
        var author: Author
    }
    var url: String
    var commit: Commit
    
}
