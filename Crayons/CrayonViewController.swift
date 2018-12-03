//
//  ViewController.swift
//  Crayons
//
//  Created by Diego Estrella III on 12/3/18.
//  Copyright © 2018 Diego Estrella III. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController {
    
    private var crayons = Crayon.allTheCrayons
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
             let crayonDetailController = segue.destination as? CrayonDetailViewController else {fatalError("missing indexPath, CrayonDetailController")}
        let crayon = crayons[indexPath.row]
        crayonDetailController.crayon = crayon
    }
}

extension CrayonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = crayon.color()
        return cell
    }
}

