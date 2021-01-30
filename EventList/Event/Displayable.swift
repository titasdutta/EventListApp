//
//  Displayable.swift
//  EventList
//
//
//  Displayable.swift
//


protocol Displayable {
    var eventNameText: String { get }
    var eventLocationText: String { get }
    var eventDateText: String { get }
    var eventDurationText: String { get }
    var attendingNumberText: String { get }
    
    var eventList: [String] { get }
    
}

