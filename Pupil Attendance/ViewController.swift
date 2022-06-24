//
//  ViewController.swift
//  Pupil Attendance
//
//  Created by Zachary Confino on 6/24/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var students = [(name: String, present: Bool)]()
    var presentStudents = [String]()
    
    struct GlobalVariable {
        static var absentStudents = [String]()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Present"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(studentRegister))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(sequenceStudents))
        
        sortStudents()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if students.isEmpty {
            studentRegister()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentStudents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        let student = presentStudents[indexPath.row]
        cell.textLabel?.text = student.self
        return cell
    }

    @objc func studentRegister() {
        let ac = UIAlertController(title: "Add Student", message: "Are they here today?", preferredStyle: .alert)
        ac.addTextField()
        ac.isSpringLoaded = true
        ac.addAction(UIAlertAction(title: "Present", style: .default, handler: { [ weak ac ] (_) in
            let textField = ac?.textFields![0].text
            guard textField != "" else {
                let alert = UIAlertController(title: "Error", message: "Please add a student name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alert, animated: true)
                return
            }
            self.students.insert((name: textField!, present: true), at: 0)
            self.sortStudents()
            self.tableView.reloadData()
        }))
        ac.addAction(UIAlertAction(title: "Absent", style: .destructive, handler: { [ weak ac ] (_) in
            let textField = ac?.textFields![0].text
            guard textField != "" else {
                let alert = UIAlertController(title: "Error", message: "Please add a student name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alert, animated: true)
                return
            }
            self.students.insert((name: textField!, present: false), at: 0)
            self.sortStudents()
            self.tableView.reloadData()
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func sortStudents() {
        for student in students {
            if student.present == true && presentStudents.contains(student.name) == false {
                presentStudents.insert(student.name, at: 0)
            } else if student.present == false && GlobalVariable.absentStudents.contains(student.name) == false {
                GlobalVariable.absentStudents.insert(student.name, at: 0)
            }
        }
    }
    
    @objc func sequenceStudents() {
        presentStudents.sort()
        tableView.reloadData()
    }
    
}

