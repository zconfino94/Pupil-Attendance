//
//  AbsentViewController.swift
//  Pupil Attendance
//
//  Created by Zachary Confino on 6/24/22.
//

import UIKit

class AbsentViewController: UITableViewController {
    
    var absentees = ViewController.GlobalVariable.absentStudents
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Absent"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(sequenceStudents))
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.GlobalVariable.absentStudents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AbsentStudent", for: indexPath)
        let student = ViewController.GlobalVariable.absentStudents[indexPath.row]
        cell.textLabel?.text = student.self
        return cell
    }
    
    @objc func sequenceStudents() {
        ViewController.GlobalVariable.absentStudents.sort()
        tableView.reloadData()
    }
}
