//
//  ViewController.swift
//  Booking and Invoicing for Trainers
//
//  Created by Anton Huisamen on 2019/01/16.
//  Copyright © 2019 antonsolo. All rights reserved.
//

import UIKit


struct Client {
    let name: String
}

class ClientsViewController: UIViewController {
    
    @IBOutlet weak var clientListTableView: UITableView!
    @IBOutlet weak var addClientButton: UIBarButtonItem!
    var listOfNames: [Client] = []{
        didSet {
            clientListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clientListTableView.delegate = self
        clientListTableView.dataSource = self
    }
    
    @IBAction func addClientButtonTapped(_ sender: UIBarButtonItem) {
        let addClientToList = UIAlertController.init(title: "Add Client", message: "", preferredStyle: .alert)
        addClientToList.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
        }
        addClientToList.addAction(.init(title: "SAVE", style: .default, handler: { (_) in
            print("Name is saved")
            guard let clientName = addClientToList.textFields![0].text else {return}
            let newClient = Client(name: clientName)
            self.listOfNames.append(newClient)
        }))
        clientListTableView.reloadData()
        present(addClientToList, animated: true)
    }
}




extension ClientsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = clientListTableView.dequeueReusableCell(withIdentifier: "clientListCell", for: indexPath)
        let nameLabel = cell.contentView.viewWithTag(1)as! UILabel
        nameLabel.textColor = .black
        let clientAtIndex = listOfNames[indexPath.row]
        nameLabel.text = clientAtIndex.name
        return cell
    }
    
    
}
