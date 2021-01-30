//
//  Event.swift
//  EventList
//


class Event: Codable {
    var id: Int
    var name: String
    var start: String
    var end: String
    var location: String
    var attending: Int
    
    
    init(id: Int, name: String, start: String, end: String, location: String, attending: Int) {
        self.id = id
        self.name = name
        self.start = start
        self.end = end
        self.location = location
        self.attending = attending
    }
}



extension Event: Displayable {
    var eventNameText: String { name }
    
    var eventLocationText: String {
        "Location:" + location }
    
    var eventDateText: String {
        "Date: \(start)"
    }
    
    var eventDurationText: String {
        "\(start) - \(end)"
    }
    
    var attendingNumberText: String {
        "Attendance: \(String(attending))" }

    var eventList: [String] {
        ["Test1", "Test2"]
    }
}
