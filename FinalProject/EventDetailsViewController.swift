//
//  EventDetails.swift
//  FinalProject
//
//  Created by Justin Baiko on 10/23/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit
import EventKit

class EventDetailsViewController: UIViewController {
    
    var data:DataModel? = nil
    var path: NSIndexPath!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBOutlet weak var HostLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBOutlet weak var CapacityLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Event Detail"
        
        let index = path.row
        let event = data?.getEvent(index: index)
        titleLabel.text = event?.title
        DateLabel.text = event?.date
        LocationLabel.text = event?.location
        HostLabel.text = event?.host
        DescriptionLabel.numberOfLines = 0
        DescriptionLabel.sizeToFit()
        DescriptionLabel.text = event?.desc
        CapacityLabel.text = String(event!.capacity)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveEvent(sender: AnyObject) {
        
        let eventStore : EKEventStore = EKEventStore()
    
        eventStore.requestAccessToEntityType(.Event, completion: {
            (granted, error) in
            
            if (granted) && (error == nil) {
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                
                let details = self.data?.getEvent(index: self.path.row)
                
                event.title = details!.title
                event.startDate = NSDate()
                event.endDate = NSDate()
                event.notes = details!.desc
                event.calendar = eventStore.defaultCalendarForNewEvents
                event.location = details?.location
                
                do {
                    try eventStore.saveEvent(event, span: .ThisEvent)
                    } catch let error as NSError {
                    _ = error
                    } catch {
                        fatalError()
                    }
                
                print("Saved Event")
            } 
        })
    }
    


}
