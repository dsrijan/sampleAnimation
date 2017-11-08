//
//  CustomCollectionViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 29/06/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit
import Photos

class CustomCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    var collectionView : UICollectionView!
    
    var imageArray = [UIImage]()
    
    func grabPhotos() {
        let imgManager = PHImageManager.default()
        
        let requestOption = PHImageRequestOptions()
        requestOption.isSynchronous = true
        requestOption.deliveryMode = .highQualityFormat
        
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        if let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOption) as? PHFetchResult{
            if fetchResult.count > 0 {
                for i in 0...fetchResult.count {
                    
                    imgManager.requestImage(for: fetchResult.object(at: i), targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: requestOption, resultHandler: { (image, error) in
                        self.imageArray.append(image!)
                    })
                }
                
                self.collectionView?.reloadData()
            }else{
                self.collectionView?.reloadData()
                print("no photos")
            }
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = self.view.frame.width / 2 - 8
        
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.itemSize = CGSize(width: width, height: width)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .action, target:self, action:  #selector(self.changeLayout))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func changeLayout() {
        
        
        UIView.animate(withDuration: 1, animations: {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            
            let width = self.view.frame.width / 3 - 9
            
            layout.itemSize = CGSize(width: width, height: width)
            
            self.collectionView.collectionViewLayout = layout
            self.collectionView.reloadData()
            self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0),at: .top,animated: true)
        }) { (status) in
            let alert = UIAlertController(title: "Alert", message: "yes its layout changed....yipeee bro", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return 10
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = UIColor.gray
        
        
//        let imageView = UIImageView(frame: cell.contentView.frame)
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        cell.contentView.addSubview(imageView)
//        imageView.backgroundColor = UIColor.cyan

        
        // Configure the cell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize = CGSize(width: 90, height: 120)
        //
        return cellSize
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
