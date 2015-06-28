//
//  LessonModel.swift
//  HTSAS
//
//  Created by Domenico on 28/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import JSONJoy

struct LessonTranscript {
    var author: String?
    var time: String?
    var caption: String?
    init() {
        
    }
    
    init(_ decoder: JSONDecoder) {
        author = decoder["author"].string
        time = decoder["time"].string
        caption = decoder["caption"].string
    }
}

struct Lesson {
    var transcripts:Array<LessonTranscript>?
    var youtubeID: String?
    var authors: String?
    var title: String?
    init() {
        
    }
    
    init(_ decoder: JSONDecoder) {
        println(decoder["y_id"].string)
        youtubeID = decoder["y_id"].string
        authors = decoder["authors"].string
        title = decoder["title"].string
        if let transcrs = decoder["transcripts"].array {
            transcripts = Array<LessonTranscript>()
            for transcriptDecoder in transcrs {
                transcripts?.append(LessonTranscript(transcriptDecoder))
            }
        }
    }
}
