//
//  ViewController.swift
//  pokemon-by-Leon
//
//  Created by Chen Wang on 11/6/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!

    var pokemons = [Pokemon]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        parsePokemonCSV()
        
    }
    
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")
        
        do {
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]
                let poke = Pokemon(name: name!, pokedexId: pokeId)
                
                pokemons.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    //MARK: - Delegation methods
    //These methods make the collection view cells actually show
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        //if it can grab a pokecell successfully, return it.
        //important for dequeue: because two much (718) data in queue at the same time would crash the app
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
            
            
            let pokemon = pokemons[indexPath.row]
            
            cell.configCell(pokemon)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    //do things when you select a cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //number of itmes in one section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    

    //set the size of grid
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }
    

}

