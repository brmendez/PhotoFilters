//
//  GalleryViewController.swift
//  PhotoFilters
//
//  Created by Brian Mendez on 10/13/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

import UIKit


protocol GalleryDelegate {
    func didTapOnPicture(image : UIImage)
}

class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //the collection view gets an outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate : GalleryDelegate? // The delegate that I made under UIKit!
    
    var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        var image1 = UIImage(named: "photo1.jpeg")
        var image2 = UIImage(named: "photo2.jpeg")
        var image3 = UIImage(named: "photo3.jpeg")
        var image4 = UIImage(named: "photo4.jpeg")
        var image5 = UIImage(named: "photo5.jpeg")
        var image6 = UIImage(named: "photo6.jpeg")
        
        self.images.append(image1!)
        self.images.append(image2!)
        self.images.append(image3!)
        self.images.append(image4!)
        self.images.append(image5!)
        self.images.append(image6!)
        
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HEADER", forIndexPath: indexPath) as HeaderView
                view.headerTitleLabel.text = "Photo Album"
            println(kind)
            return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "FOOTER", forIndexPath: indexPath) as FooterView
            view.footerCountLabel.text = "\(images.count.description) Photos"
            println(kind)
            println(view)
            return view
        }
    }

    //App still runs without function below.
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GALLERY_CELL", forIndexPath: indexPath) as GalleryCell

        cell.imageView.image = images[indexPath.row]
        
        return cell
        
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.didTapOnPicture(self.images[indexPath.row])
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
