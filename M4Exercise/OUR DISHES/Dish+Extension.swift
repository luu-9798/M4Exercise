import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for item in menuItems {
            if dishExists(title: item.title, in: context) {
                continue
            }
            
            // Convert the price from String to Float
            guard let priceValue = Float(item.price) else {
                print("Invalid price value for item: \(item.title)")
                continue  // Skip if price is not convertible
            }
            
            let dish = Dish()
            dish.name = item.title                // Map title to name
            dish.price = priceValue               // Map price as-is (if still a String)
            dish.size = "Regular"
            
            do {
                // Save all the new dishes to Core Data
                try context.save()
            } catch {
                print("Error saving dishes to Core Data: \(error)")
            }
        }
    }
    
    //Static function to check if a Dish already exist in Core data
    static func dishExists(title: String, in context: NSManagedObjectContext) -> Bool {
        //Create fetch request
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        
        //Add a predicate to filter a dish by title
        fetchRequest.predicate = NSPredicate(format: "name == %@", title)
        
        //If we can fetch at least 1, that means it exist
        fetchRequest.fetchLimit = 1
        
        //Check for error then return value
        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error checking if disk exists: \(error)")
            return false
        }
    }
    
}
