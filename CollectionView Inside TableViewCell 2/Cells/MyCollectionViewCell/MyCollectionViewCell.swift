//
//  MyCollectionViewCell.swift
//  CollectionView Inside TableViewCell 2
//
//  Created by Gevorg Hovhannisyan on 06.10.21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - ID
   static var id = "MyCollectionViewCell"
    
    //MARK: - @IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    
    //MARK: - LifeCycle Mhethods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.setRounded()
        
    }

}

//MARK: - Remote ImageURL
extension UIImageView {
    
    func load(url: URL){
        DispatchQueue.global().async {
            [weak self] in if let data = try? Data(contentsOf: url){
                if let imageView = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = imageView
                    }
                }
            }
        }
    }
}

//MARK: - ImageView Radius
extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

