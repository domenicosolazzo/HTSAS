//
//  Favorite.swift
//  HTSAS
//
//  Created by Domenico on 22/07/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import Foundation
import CoreData

class Favorite: NSManagedObject {
    @NSManaged var id: String
    @NSManaged var quote: String
}
