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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
    }
    
    
    //MARK: - Delegation methods
    //These methods make the collection view cells actually show
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        //if it can grab a pokecell successfully, return it.
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
            
            let pokemon = Pokemon(name: "Test", pokedexId: (indexPath.row+1))
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
        return 30
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    

    //set the size of grid
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }
    

}

