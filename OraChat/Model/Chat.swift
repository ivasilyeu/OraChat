//
//  Chat.swift
//  OraChat
//
//  Created by Igor Vasilev on 11/11/16.
//  Copyright © 2016 Productive Edge. All rights reserved.
//

import Foundation

struct Chat {
	
	let id: Int?
	let name: String
	let creationDate: Date?
	let lastMessage: Message?
	
	init(name aName: String) {
		
		name = aName
		
		id = nil
		creationDate = nil
		lastMessage = nil
	}
}
