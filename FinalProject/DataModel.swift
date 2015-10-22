//
//  DataModel.swift
//  FinalProject
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit
import CoreData

class DataModel: NSObject {
    private var events:[Event] = [Event]()
    private var users:[User] = [User]()
    
    // Core Data array, need them?
    var coreDataEvents = [NSManagedObject]()
    var coreDataUsers = [NSManagedObject]()
    
    override init() {
        super.init()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // get all the events from core data
        getEvents(managedContext)
        
        // get all the users from core data
        getUsers(managedContext)
        
    }
    
    func countUsers() -> Int {
        return users.count
    }
    
    func countEvents() -> Int {
        return events.count
    }
    
    func getEvent(index index:Int) -> Event {
        return events[index]
    }
    
    func addEvent(title title:String, date:String, location:String, host:String, description:String, capacity:Int) {
        let temp = Event(title: title, date: date, location: location, host: host, description: description, capacity: capacity)
        events.append(temp)
        saveEvent(temp)
    }
    
    func addUser(username username:String, password:String) {
        let temp = User (username: username, password: password)
        users.append(temp)
        saveUser(temp)
    }
    
    private func saveUser(user: User) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        let u = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set the attribute values
        u.setValue(user.username, forKey: "username")
        u.setValue(user.password, forKey: "password")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        coreDataUsers.append(u)
    }
    
    private func saveEvent(event: Event) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("Event", inManagedObjectContext: managedContext)
        
        let e = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set the attribute values
        e.setValue(event.title, forKey: "title")
        e.setValue(event.date, forKey: "date")
        e.setValue(event.location, forKey: "location")
        e.setValue(event.host, forKey: "host")
        e.setValue(event.desc, forKey: "desc")
        e.setValue(event.capacity, forKey: "capacity")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        coreDataEvents.append(e)
    }
    
    private func getEvents(managedContext: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest(entityName: "Event")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // update local data from Core data
        if let results = fetchedResults {
            coreDataEvents = results
            dispatch_sync(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)) {
                for i in self.coreDataEvents {
                    let object = i
                    let title:String = (object.valueForKey("title") as? String!)!
                    let date:String = (object.valueForKey("date") as? String)!
                    let location:String = (object.valueForKey("location") as? String)!
                    let host:String = (object.valueForKey("host") as? String)!
                    let description:String = (object.valueForKey("desc") as? String)!
                    let capacity:Int = (object.valueForKey("capacity") as? Int)!
                    let temp = Event(title: title, date: date, location: location, host: host, description: description, capacity: capacity)
                    self.events.append(temp)
                }
            }
            
        } else {
            print("Could not fetch")
        }
    }
    
    private func getUsers(managedContext: NSManagedObjectContext) {
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // update local data from Core data
        if let results = fetchedResults {
            coreDataUsers = results
            dispatch_sync(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)) {
                for i in self.coreDataUsers {
                    let object = i
                    let username:String = (object.valueForKey("username") as? String!)!
                    let password:String = (object.valueForKey("password") as? String)!
                    let temp = User(username: username, password: password)
                    self.users.append(temp)
                }
            }
            
        } else {
            print("Could not fetch")
        }
    }
    
}
