//
//  MyTableViewCell.swift
//  CollectionView Inside TableViewCell 2
//
//  Created by Gevorg Hovhannisyan on 06.10.21.
//

import UIKit

//MARK: - TabActionProtocol

protocol TabActionProtocol{
    
    func didTapOnCell(indexPath: IndexPath, title: String)
    
}

class MyTableViewCell: UITableViewCell {
        
    
    //MARK: - ID
    
    static var id = "MyTableViewCell"
    
    //MARK: - @IBOutlet
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    //MARK: - Properties
    
    var delegate: TabActionProtocol?
    var data: [Models]?
    
    
    //MARK: - LifeCycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        mainCollectionView.register(UINib(nibName: MyCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: MyCollectionViewCell.id)
    }
    
    //MARK: - Rotated
    @objc func rotated() {
        
        if UIDevice.current.orientation.isLandscape {
            
            mainCollectionView.collectionViewLayout.invalidateLayout()
            
        } else {
            
            mainCollectionView.collectionViewLayout.invalidateLayout()
        }
    }
}

//MARK: - Extension

extension  MyTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        cell.imageView.load(url: URL(string: data?[indexPath.item].imageURL ?? "")!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.width / 2 - 5, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.didTapOnCell(indexPath: indexPath, title: data?[indexPath.item].title ?? "")

    }
}
