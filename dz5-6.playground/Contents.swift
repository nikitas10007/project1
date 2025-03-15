import UIKit
import Foundation

typealias Student = (name: String, age: Int, grades: [String: Int], optionalSubjects: Set<String>)

var students: [Student]
[
    (name: "Иван", age: 20, grades: ["Математика": 5, "Физика": 4], optionalSubjects: ["Программирование", "Английский язык"]),
    (name: "Мария", age: 21, grades: ["Математика": 4, "Химия": 5], optionalSubjects: ["Биология", "Английский язык"]),
    (name: "Алексей", age: 20, grades: ["Математика": 3, "Физика": 5], optionalSubjects: ["Программирование"]),
    (name: "Дмитрий", age: 21, grades: ["Физика": 5, "Химия": 5], optionalSubjects: ["Биология", "Программирование"])
]

func calculateAverageGrade(student: Student) -> Double? {
    let grades = student.grades.values
    guard !grades.isEmpty else { return nil }
    let sum = grades.reduce(0, +)
    return Double(sum) / Double(grades.count)
}

func findStudentsByAge(students: [Student], age: Int) -> [Student] {
    return students.filter { $0.age == age }
}
func getTopStudents(students: [Student], top: Int) -> [(name: String, averageGrade: Double)] {
    
    let studentsWithGrades = students.compactMap { student -> (name: String, averageGrade: Double)? in
        if let averageGrade = calculateAverageGrade(student: student) {
            return (name: student.name, averageGrade: averageGrade)
        }
        return nil
    }
    let sortedStudents = studentsWithGrades.sorted { $0.averageGrade > $1.averageGrade }
    return Array(sortedStudents.prefix(top))
}

func getUniqueOptionalSubjects(student: [Student]) -> Set<String> {
    return student.reduce(Set<String>()) { result, student in
        return result.union(student.optionalSubjects)
    }
}

print("Информация о студентах:")
for student in students {
    let avgGrade = calcAvgGrade(student: student) ?? 0.0
    print("Имя: \(student.name), Возраст: \(student.age), Средний балл: \(avgGrade), Факультативы: \(student.optionalSubjects)")
}
print(" ")
let targetAge = 20
let studentsAge20 = findStudentsAge(students: students, age: targetAge)
print("Студенты возраста \(StudentsAge20):")
for student in studentsAge20 {
    print("Имя: \(student.name), Возраст: \(student.age)")
}
print("")

let topStudents = getTopStudents(students: students, top: 3)
print("Топ-3 студентов по среднему баллу:")
for student in topStudents {
    print("Имя: \(student.name), Средний балл: \(student.averageGrade)")
}
print("")




//2

import Foundation

class Shape {
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func calculateArea() -> Double {
        return 0
    }
}

class Circle: Shape {
    var radius: Double
    
    init(color: String, radius: Double) {
        self.radius = radius
        super.init(color: color)
    }
    

    override func calculateArea() -> Double {
        return Double.pi * radius * radius
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(color: String, width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return width * height
    }
}

class Triangle: Shape {
    var base: Double
    var height: Double
    
    init(color: String, base: Double, height: Double) {
        self.base = base
        self.height = height
        super.init(color: color)
    }
    
    override func calculateArea() -> Double {
        return 0.5 * base * height
    }
}

let shapes: [Shape] = [
    Circle(color: "Red", radius: 2),
    Rectangle(color: "Blue", width: 6, height: 9),
    Triangle(color: "Green", base: 8, height: 4)
]
for shape in shapes {
    print("Фигура цвета \(shape.color) имеет площадь: \(shape.calculateArea())")
}


import Foundation

struct Contact {
    var firstName: String
    var phoneNumber: String
    var email: String?
}

func searchContacts(_ contacts: [Contact], searchString: String) -> [Contact] {
    return contacts.filter { contact in
        let fullName = "\(contact.firstName)".lowercased()
        return fullName.contains(searchString.lowercased())
    }
}
let contacts = [
    Contact(firstName: "Иван", phoneNumber: "1234567890", email: "ivan@gmail.com"),
    Contact(firstName: "Мария",  phoneNumber: "0987654321", email: "maria@gmail.com"),
    Contact(firstName: "Алексей",  phoneNumber: "5555555555", email: nil),
    Contact(firstName: "Екатерина", phoneNumber: "1111111111", email: "ekaterina@gmail.com")
]

let searchResults = searchContacts(contacts, searchString: "Иван")

print("Результаты поиска:")
for contact in searchResults {
    print("Имя: \(contact.firstName), Телефон: \(contact.phoneNumber), Email: \(contact.email ?? "не указан")")
}
