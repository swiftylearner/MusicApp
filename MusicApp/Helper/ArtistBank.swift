//
//  Data.swift
//  MusicApp
//
//  Created by MacBook on 9/7/20.
//  Copyright © 2020 Apptive. All rights reserved.
//

import UIKit

class GenreData {
    
    static func loadGenre() -> [Genre]{
        let HipHop = Genre(logo: "hip hop", name: "Hip Hop")
        let country = Genre(logo: "country", name: "Country")
        let jazz = Genre(logo: "jazz", name: "Jazz")
        let rnb = Genre(logo: "r&b", name: "r&b")
        
        let genre = [HipHop,jazz,country,rnb]
        
        return genre
    }
    
}
