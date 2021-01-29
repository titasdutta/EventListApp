//
//  EventTableViewController.swift
//  EventList
//

import UIKit

class EventTableViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    
    
    var events: [Event] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        events = createArray()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
    }
    

    func createArray() -> [Event] {
        var tempEvents: [Event] = []
        
        let event1 = Event(id: 1, name: "Event 1", start: "12:0:0 00:00", end: "02:0:0 00:00", location: "MSTB", attending: 21)
        let event2 = Event(id: 2, name: "Event 2", start: "14:0:0 00:00", end: "17:0:0 00:00", location: "Humanities", attending: 33)
        
        tempEvents.append(event1)
        tempEvents.append(event2)
        
        return tempEvents
     }

}


extension EventTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "event_cell") as! EventTableViewCell
        
        cell.setEvent(event: event)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEventDetail", sender: self)
    }
    
    
}
