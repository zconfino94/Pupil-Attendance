# Pupil-Attendance
App which tracks absent and present students in a classroom

## Use Case
For a teacher at the beginning of class to add each student name, and specify whether they are present or absent for that class.
The views are split between two Tab Bars, and code automatically sorts students into different arrays based on whether they are present or absent, and populates this data in the corresponding view.

Also included a barButtonItem that sorts the students alphabetically, so once the register is taken, the user can sort for easier readability.
This sort is available on both Absent and Present views.

## To Do
Need to access UserDefaults to save data between sessions.

Also need to assign each student a UUID() to allow Swift to cross-reference this value rather than "name" value when determining whether to add the student to the list.
* Right now, I added all students to a students array, then added a custom filter to determin, based on a Bool of "present", whether to add to presentStudents or absentStudents.
* To avoid duplicating the students in each array, I used this code, but this prevents addition of two students with the same name, without specifying a last name or initial:
``` 
if student.present == true && presentStudents.contains(student.name) == false {...}
```

## Experiments
Was struggling to find out how to pass data between ViewControllers. Used following method to place the variable inside a struct:
```
 struct GlobalVariable {
        static var absentStudents = [String]()
    }
```
Then accessed the variable on my secondary view by:
```
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.GlobalVariable.absentStudents.count
    }
```
Essentially by accessing through the following path: Class => Struct => Variable

## Screenshots
![Screenshot 2022-06-24 at 13 32 20](https://user-images.githubusercontent.com/60122942/175663116-c937ae73-a581-46cc-b813-05d903233b4c.png)
![Screenshot 2022-06-24 at 13 32 45](https://user-images.githubusercontent.com/60122942/175663235-6902db11-f90b-4a4d-9b60-ae53b6a15900.png)
