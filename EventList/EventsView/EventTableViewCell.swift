//
//  EventTableViewCell.swift
//  EventList
//
//  Created by Titas Dutta on 1/29/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

     
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventLocLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    
    func setEvent(event: Event) {
        eventNameLabel.text = event.name
        eventLocLabel.text = event.location
        eventTimeLabel.text = "\(event.start) - \(event.end)"
    }
}
