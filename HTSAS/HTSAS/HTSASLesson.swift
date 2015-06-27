//
//  HTSASLesson.swift
//  HTSAS
//
//  Created by Domenico on 27/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import Foundation

public class HTSASLesson:NSObject{
    public var title = ""
    public var authors = ""
    
    override init(){
        super.init()
    }
    
    convenience init(title: String, authors: String){
        self.init()
        self.title = title
        self.authors = authors
    }
    
    
}
