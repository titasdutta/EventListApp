//
//  EventTableViewController.swift
//  EventList
//
import Alamofire
import UIKit

class EventTableViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    
    
    var events: [Event] = []
    
    var items: [Displayable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //events = createArray()
        //self.getEvents()
        fetchAllEvents()
        
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
     return items.count
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "event_cell", for: indexPath)
     let item = items[indexPath.row]
     cell.textLabel?.text = item.eventNameText
     cell.detailTextLabel?.text = item.eventLocationText
     return cell
   }
}

//extension EventTableViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return events.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let event = events[indexPath.row]
////
////        let cell = tableView.dequeueReusableCell(withIdentifier: "event_cell") as! EventTableViewCell
////
////        cell.setEvent(event: event)
////
//        let cell = tableView.dequeueReusableCell(withIdentifier: "event_cell", for: indexPath) as! EventTableViewCell
//        let event = events[indexPath.row]
//        cell.textLabel?.text = event.eventNameText
//        cell.detailTextLabel?.text = event.eventLocationText
//        return cell
//    }
//
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        performSegue(withIdentifier: "showEventDetail", sender: self)
////    }
//
//
//}


// MARK: - Alamofire
extension EventTableViewController {
    func getEvents () {
        
        let events = [Event]()
        
        AF.request(event_url, method: .get, encoding: JSONEncoding.default)
                    .responseJSON { response in
                        debugPrint(response)

//                        if let data = response.value {
                            
                            if let jsonData = try? JSONEncoder().encode(events),
                              let jsonString = String(data: jsonData, encoding: .utf8) {
                              //print(jsonString)
                                
                                if let eventData = jsonString.data(using: .utf8),
                                    let eventArray = try? JSONDecoder().decode([Event].self, from: eventData) {
                                    print("Even ARRAY:\n \(eventArray)")
                                }
                                
                            }
//                            // Response type-1
//                            if  (data as? [[String : AnyObject]]) != nil{
//                                let events: [Event] = data
//                            }
//                            // Response type-2
//                            if  (data as? [String : AnyObject]) != nil{
//                                print("data_2: \(data)")
//                            }
                        }
                    }
        
//        let request = AF.request(event_url, method: .get)
//
//        request.responseDecodable(of: Events.self) { (response) in
//            guard let events = response.value else { return }
//            self.events = events.events
//            self.eventTableView.reloadData()
//        }
    }


extension EventTableViewController {
  func fetchAllEvents() {
    AF.request("https://jir8pypexa.execute-api.us-west-1.amazonaws.com/api/events")
        .validate()
        .responseDecodable(of: Events.self) { (response) in
      guard let events = response.value else { return }
      self.events = events.events
      self.items = events.events
      self.eventTableView.reloadData()
    }
  }
}
