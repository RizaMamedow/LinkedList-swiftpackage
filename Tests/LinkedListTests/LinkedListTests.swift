import Testing
@testable import LinkedList

private class TestDataFactory{
    static let sortedIntegers: [Int] = [1,2,3,4,5,6,7]
    static let nullableIntegers: [Int?] = [1, nil, 3]
    static let emptyArray: [Int] = []
    static let unsortedIntegers = [2,6,1,3,8,10]
}

@Test func testProperty() async throws {
    let list = LinkedList(TestDataFactory.emptyArray)
    
    print("List relations:", list.description)
    print("First node:", list.head as Any)
    print("Penultimate node:", list.penult as Any)
    print("Last node:", list.tail as Any)
    print("List length:", list.count)
    print("List \"isEmpty\" property:", list.isEmpty)
}

@Test func testSorting() async throws {
    var list = LinkedList(TestDataFactory.unsortedIntegers)
    print(list)
    list.sort(by: <)
    print(list)
}

@Test func testConvertings() async throws {
    let list = LinkedList(TestDataFactory.sortedIntegers)
    print(list.toDictionary())
}


