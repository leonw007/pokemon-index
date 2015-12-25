//
//  Pokemon.swift
//  pokemon-by-Leon
//
//  Created by Chen Wang on 11/7/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import Foundation
import Alamofire


class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    
    //"/api/v1/pokemon/1/"
    
    init (name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete ) {
        let url = NSURL(string: _pokemonUrl)
        Alamofire.request(.GET, url!).responseJSON { response in
            let result = response.result
            
            print(result.value.debugDescription)
        }
        
    
    }
    
    
}