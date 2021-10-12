let VAT_PERCENT = 15

enum ProductStatus {
    case available
    case notAvilable
}

struct Product {
    var produsTypes: String
    var itemPrice: Double
    var status: ProductStatus
    var qty: Int
    
}

struct Cateogry {
    var title: String
    var product: [Product] = []
}

struct Account {
    var fullname: String = ""
    var cart: [Product] = []
    var billNumer: Int = 0

    init() {
        billNumer = Account.getNewBillNumber()
    }
    
    init (name: String, cart: [Product]) {
        self.init()
        self.fullname = name
        self.cart = cart
    }
    
    private static var lastId = 0
    static private func getNewBillNumber() -> Int {
        Account.lastId += 1
        return Account.lastId + 1
    }
    
//    var sub-total: Double     100
    // vat%                     15% on sub-total
    // final price              115
}


class Store {
    var categories: [Cateogry] = []
    var customers: [Account] = []
}

var myStore = Store()

var apple = Product(produsTypes: "Apples", itemPrice: 3, status: .available, qty: 24)
myStore.categories.append(Cateogry(title: "Fruits", product: [apple]))

myStore.categories.append(Cateogry(title: "Drinks", product: [Product(produsTypes: "Tea", itemPrice: 2, status: .available, qty: 40)]))
myStore.categories.append(Cateogry(title: "Pasta", product: [Product(produsTypes: "Spaghitti", itemPrice: 3, status: .available, qty: 35)]))
myStore.categories.append(Cateogry(title: "Snacks", product: [Product(produsTypes: "Nuts", itemPrice: 3, status: .available, qty: 35)]))


var customer1 = Account(name: "Raz", cart: [])
var customer2 = Account(name: "Myawld", cart: [])
myStore.customers.append(customer1)
myStore.customers.append(customer2)

//print(myStore.categories)
print(myStore.customers)

//myStore.addNewCetegory ()


// Add / Edit / Remove New Category
// Add / Edit / Remove Customer
// Add / Edit / Remove Products


//List all Customers
//print bill for the given customer
//Edit Cart
//Buy()
//Print all my products for the given category
//List of all my (customer) purchases so far
//
