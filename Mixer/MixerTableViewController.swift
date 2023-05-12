//
//  MixerTableViewController.swift
//  Mixer
//
//  Created by Лаванда on 12.05.2023.
//

import UIKit

class MixerTableViewController: UITableViewController {
    
    private let cellID = "Cell"
    private var data = Number.getNumbers()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Mixer-Table"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shuffle", style: .plain, target: self, action: #selector(shuffleButtonPressed))
    }
    
    @objc private func shuffleButtonPressed() {
        for i in 0...data.count - 1 {
            let randomIndex = Int.random(in: 0...data.count - 1)
            let number = data[i]
            data.remove(at: i)
            data.insert(number, at: randomIndex)
            let indexPath = IndexPath(row: i, section: 0)
            tableView.moveRow(at: indexPath, to: IndexPath(row: randomIndex, section: 0))
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let number = data[indexPath.row]
        cell.textLabel?.text = "\(number.number)"
        if number.isCheck {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        var number = data[indexPath.row]
        print(number)
        if number.isCheck {
            cell.accessoryType = .none
            number.isCheck = false
            data[indexPath.row].isCheck = false
        } else {
            cell.accessoryType = .checkmark
            number.isCheck = true
            data.remove(at: indexPath.row)
            data.insert(number, at: 0)
            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
        }
    }
    
}


