// CRUD

enum ProductStatus {
    case available
    case notAvilable
}
enum Category {
    case Drinks
    case Food
    case Friut
    case Snacks
}

struct Product {
    var produsTypes: String
    var itemPrice: Double
    var status: ProductStatus
    var qty: Int
    let serialNumber : Int = Int.random(in: 90000...99999)
    var category : Category
    
}

struct Cart {
    var title: String
    var products: [Product] = []
    mutating func createNewItem(item: Product){
        self.products.append(item)
    }
    mutating func updateItem(itemIndex: Int, itemChanges: Product){
        self.products[itemIndex] = itemChanges
    }
    mutating func removeItem(itemIndex: Int){
        self.products.remove(at: itemIndex)
    }
}

struct Account {
    var fullname: String = ""
    var cart : [Product] = []
    var billNumber: Int = 0
    
    init() {
        billNumber = Account.getNewBillNumber()
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
    
}

class Store {
    var products: [Product] = []
    var customers: [Account] = []
    
    
    var subTotal: Double = 100.7
    let VATprecentage = 0.15
    
    func calcVAT (price: Double) -> Double {
        return (price + (price * VATprecentage))
    }
    
    // Add / Remove ITEMS
    
    func addItemToCart (newItem : String) {
        guard let addtocart = self.products.first(where: {$0.produsTypes == newItem})
        else{
            print("not found")
            return
        }
        products.append(addtocart)
        
    }
    
    func removeItemsFromCart (custmoerIndex: Int, itemIndex: Int) {
        customers[custmoerIndex].cart.remove(at: itemIndex)
    }

    
    func updateProfile(index: Int, updatedProfile: Account){
        customers[index] = updatedProfile
    }
}

var myStore = Store()


myStore.products.append(.init(produsTypes: "apples", itemPrice: 3, status: .available, qty: 12, category: .Friut))
myStore.products.append(.init(produsTypes: "Tea", itemPrice: 15, status: .available, qty: 20, category: .Drinks))
myStore.products.append(.init(produsTypes: "Spaghitti", itemPrice: 3, status: .available, qty: 6, category: .Food))
myStore.products.append(.init(produsTypes: "Nuts", itemPrice: 14, status: .notAvilable, qty: 0, category: .Snacks))


var bill2 = myStore.calcVAT(price: 50)
print(bill2)

var newItem2 = myStore.addItemToCart(newItem: "Pineapple")
print(newItem2)





