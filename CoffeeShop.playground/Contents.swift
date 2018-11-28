import Foundation
import XCTest

// MARK: - Location
struct Location {
    var x = 0.0
    var y = 0.0
}

class LocationTest: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_defaultLocation() {
        let location = Location()
        XCTAssertEqual(location.x, 0.0)
        XCTAssertEqual(location.y, 0.0)
    }

    func test_specificLocation() {
        var location = Location()
        location.x = 1
        location.y = 1
        XCTAssertEqual(location.x, 1)
        XCTAssertEqual(location.y, 1)
    }
}

LocationTest.defaultTestSuite.run()


// MARK: - CoffeeShopApp
struct CoffeeShopApp {

    var user = Location()
    var shopDataFilename = ""

    init?(_ arguments: [String]) {
        guard arguments.count == 3,
            let y = Double(arguments[0]),
            let x = Double(arguments[1])
        else {
            return nil
        }
        user.x = x
        user.y = y
        shopDataFilename = arguments[2]
    }
}

class CoffeeShopAppTest: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }

    func test_applicationValidArguments() {
        let app = CoffeeShopApp(["47.6", "-122.4", "coffee_shop.csv"])
        XCTAssertNotNil(app)
        XCTAssertEqual(app!.user.y, 47.6)
        XCTAssertEqual(app!.user.x, -122.4)
        XCTAssertEqual(app!.shopDataFilename, "coffee_shop.csv")
    }

    func test_applicationNotEnoughArguments() {
        let app = CoffeeShopApp(["47.6", "-122.4"])
        XCTAssertNil(app)
    }

    func test_applicationYNotDouble() {
        let app = CoffeeShopApp(["47.6.5", "-122.4", "coffee_shop.csv"])
        XCTAssertNil(app)
    }

    func test_applicationXNotDouble() {
        let app = CoffeeShopApp(["47.6", "-122b", "coffee_shop.csv"])
        XCTAssertNil(app)
    }

    }
}

CoffeeShopAppTest.defaultTestSuite.run()


