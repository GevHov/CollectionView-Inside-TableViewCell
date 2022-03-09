//
//  ViewController.swift
//  CollectionView Inside TableViewCell 2
//
//  Created by Gevorg Hovhannisyan on 06.10.21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - ImageURL
    
    var imageView = UIImageView()
    let dataSource: [Models] = [
                 Models(title: "Main Title 1", imageURL: "https://images.unsplash.com/photo-1566650554919-44ec6bbe2518?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80"),
                 Models(title: "Main Title 2", imageURL: "https://images.theconversation.com/files/134652/original/image-20160818-12312-4dyz0u.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip"),
                 Models(title: "Main Title 3", imageURL: "https://assets3.thrillist.com/v1/image/2528822/792x528/flatten;scale;jpeg_quality=70"),
                 Models(title: "Main Title 4", imageURL: "https://picsum.photos/id/237/200/300"),
                 Models(title: "Main Title 5", imageURL: "https://pbs.twimg.com/media/DaCMRQSU0AAr8-r?format=jpg&name=900x900"),
                 Models(title: "Main Title 6", imageURL: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5faad4255239c9448d6c7bcd%2FBest-Animal-Photos-Contest--Close-Up-Of-baby-monkey%2F960x0.jpg%3Ffit%3Dscale")]
    
    //MARK: - @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
        

    //MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MyTableViewCell.id, bundle: nil), forCellReuseIdentifier: MyTableViewCell.id)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - Private Methods
    
    private func showAlertForIndexPath(indexPath: IndexPath, titel: String) {
        
        let alert = UIAlertController(title: title, message: "IndexPath Item Is \(indexPath.item),IndexPath Section Is \(indexPath.section)", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
    
}
// MARK: - Extensions

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count/2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as! MyTableViewCell
         
        cell.delegate = self
        cell.data = [dataSource[indexPath.row * 2], dataSource[indexPath.row * 2 + 1]]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
}

extension ViewController: TabActionProtocol {
    
    func didTapOnCell(indexPath: IndexPath, title: String) {
        
        showAlertForIndexPath(indexPath: indexPath, titel: title)
    }
}


