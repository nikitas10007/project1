import UIKit

//ДЗ


//1. Написать функции, которая:
//- Будет просто выводить в консоль ”Hello, world!”.
//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции
//должен быть следующим - printHi(“Misha”)).
//- Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”.


func HelloWorld() {
    print("Hello World")
}
func printHi(_ name: String) {
    print("Hello, \(name)")
}

func getGreeting(for name: String) -> String {
    return "Hello! \(name)"
}

HelloWorld()
printHi("Misha")
let greeting = getGreeting(for: "Misha")
print(greeting)


//2. Написать функцию, которая принимает две строки и возвращает сумму количества
//символов двух строк.

func Count(_ num1: String, _ num2: String) -> Int {
    return num1.count + num2.count
}
let string1 = "Hello"
let string2 = "World"
let result = Count(string1, string2)
print(result)

//3. Написать функцию, которая выводит в консоль квадрат переданного числа.

func printSquare(of num: Int) {
    let square = num * num
    print("Квадрат числа \(num) равен \(square)")
}
printSquare(of: 10)


// 4.Функция для вычисления площади круга

func CircleArea(radius: Double) -> Double {
    return Double.pi * pow(radius, 2)
}
let radius = 15

//5. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает
//строку с описанием времени суток. Можно делать с логическим типом, можно делать со временем.
//
func timeOfDay(currentTime: Date) -> String {
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: currentTime)
    
    switch hour {
    case 7..<22:
        return "Сейчас день"
    default:
        return "Сейчас ночь"
    }
}
let currentTime = Date()
let description = timeOfDay(currentTime: currentTime)
print(description)

//6. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и
//возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или
//осень).

func seasonForMonth(_ month: Int) -> String {
    switch month {
    case 12, 1, 2:
        return "Зима"
    case 3, 4, 5:
        return "Весна"
    case 6, 7, 8:
        return "Лето"
    case 9, 10, 11:
        return "Осень"
    default:
        return "Некорректный номер месяца"
    }
}

print(seasonForMonth(5))


//1. Конвертер валют с обработкой ошибок:
//
// •     Создайте enum Currency с кейсами для USD, EUR, BYN. Каждому кейсу присвойте rawValue типа String с соответствующим кодом валюты.
// •     Создайте функцию getExchangeRate(from: Currency, to: Currency) -> Double?, которая принимает две валюты и возвращает курс обмена между ними. Если для какой-то пары валют курс не найден, функция должна возвращать nil.
// •   Создайте функцию convertCurrency(amount: Double, from: Currency, to: Currency) -> Double?, которая принимает сумму, исходную валюту и целевую валюту и возвращает сконвертированную сумму. Используйте функцию getExchangeRate для получения курса обмена. Если курс обмена не найден, функция должна возвращать nil.


enum Currency: String {
    case USD = "USD"
    case EUR = "EUR"
    case BYN = "BYN"
}

func getExchange(from: Currency, to: Currency) -> Double? {
    let exchange: [String: Double] = [
        "USD_EUR": 0.83,
        "USD_BYN": 3.11,
        "EUR_USD": 1.08,
        "EUR_BYN": 3.45,
        "BYN_USD": 0.29,
        "BYN_EUR": 0.25
    ]
    
    let key = "\(from.rawValue)_\(to.rawValue)"
    
    return exchange[key]
}

func convertCurrency(amount: Double, from: Currency, to: Currency) -> Double? {
    guard let exchange = getExchange(from: from, to: to) else {
        print("Курс обмена для \(from.rawValue) -> \(to.rawValue) не найден.")
        return nil
    }
    return amount * exchange
}


if let convertedAmount = convertCurrency(amount: 1000, from: .USD, to: .EUR) {
    print("1000 USD = \(convertedAmount) EUR")
} else {
    print("Конвертация невозможна.")
}

// 2. Анализатор результатов экзамена:
//
//•   Создайте enum Grade с кейсами A, B, C, D, F.  Каждому кейсу присвойте rawValue типа Int, представляющий числовой балл (например, A = 90, B = 80 и т.д.).
//•   Создайте функцию getLetterGrade(score: Int) -> Grade?, которая принимает числовой балл (Int) и возвращает соответствующую буквенную оценку (Grade).  Если балл находится вне допустимого диапазона (например, меньше 0 или больше 100), функция должна возвращать nil.  Реализуйте логику определения оценки на основе диапазонов баллов (например, 90-100 -> A, 80-89 -> B и т.д.).
//•   Создайте функцию printExamResult(name: String, score: Int) -> String, которая принимает имя студента (String) и его балл (Int) и возвращает строку с результатом экзамена. Используйте функцию getLetterGrade для получения буквенной оценки.
//
//    •   Если функция getLetterGrade возвращает оценку, строка должна иметь формат: "[Имя студента] получил [Буквенная оценка] (Балл: [Числовой балл])".
//    •   Если функция getLetterGrade возвращает nil, строка должна иметь формат: "[Имя студента] получил недопустимый балл: [Числовой балл]".
//
//•   Продемонстрируйте работу функции printExamResult с разными входными данными, включая допустимые и недопустимые баллы.


enum Grades: Int {
    case A = 90
    case B = 80
    case C = 70
    case D = 60
    case F = 0
}

func letterGrades(score: Int) -> Grades? {
    switch score {
    case 90...100:
        return .A
    case 80..<90:
        return .B
    case 70..<80:
        return .C
    case 60..<70:
        return .D
    case 0..<60:
        return .F
    default:
        return nil //
    }
}

func printExamResult(name: String, score: Int) -> String {
    if let grade = letterGrades(score: score) {
        return "\(name) получил \(grade) (Балл: \(score))"
    } else {
        return "\(name) получил недопустимый балл: \(score)"
    }
}
let result1 = printExamResult(name: "Алексей", score: 35)
print(result1)
