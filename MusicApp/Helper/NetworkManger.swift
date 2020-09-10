
import Foundation

let genreData = """

{

    "Hip Hop" : [
        {
            "name" : "Nas",
            "song" : "If I Rule The World",
            "photo" : "nas"
        },

        {
            "name" : "Tupac Shakur",
            "song" : "Changes",
            "photo" : "pac"
        },

        {
            "name" : "Big Sean",
            "song" : "I Feel Bless",
            "photo" : "sean",
        },

    ],

    "Jazz" : [
        {
        "name" : "Mile Davis",
        "song" : "Its About That Time",
        "photo" : "miles"
        },

        {
        "name" : "Ella Fitsgeral",
        "song" : "Summertime",
        "photo" : "ella"
        }
    ],

    "Country" : [
        {
            "name" : "Luke Combs",
            "song" : "When It Rain It Pours",
            "photo" : "luke"
        },

        {
            "name" : "Kane Brown",
            "song" : "Cool Again",
            "photo" : "kane"
        }
    ],

    "r&b" : [
        {
            "name" : "Mary J Blig",
            "song" : "Too Strong For Too Long",
            "photo" : "mary"
        },

        {
            "name" : "Lauryn Hill",
            "song" : "Killing Me Softly",
            "photo" : "hill"
        },

        {
            "name" : "Macy Gray",
            "song" : "I Try",
            "photo" : "macy"
        }
    ],

}

"""





class NetworkManager {
    
    private class func getDataArtist(completion:@escaping(_ json:Data?)->()) {
        //guard let genreData = Bundle.main.path(forResource: "GenreData", ofType: "json") else { return }
        completion(Data(genreData.utf8))
    }
    
    static func loadArtist(for genre:Genre?,completion:@escaping([Artist])->())  {
        var artists : [Artist] = []
        
        getDataArtist { jsonData in
            guard let data = jsonData else { return }
             guard let genreName = genre?.name else { return }
            

             do {
                 let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                 
                 guard let genres = json?[genreName] as? Array<Dictionary<String,String>> else { return }
                 
                 for genre in genres {
                     
                    let name = genre["name"] ?? ""
                    let photo = genre["photo"] ?? ""
                    let song = genre["song"] ?? ""
                    
                    
                    let artist = Artist(name: name, photo: photo, song: song)
                    artists.append(artist)
                    
                 }
            
                completion(artists)
                
             } catch let err {
                 print(err.localizedDescription)
             }
            
        }
         
    }
    

}
