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
    var id: Int?
    init() {
        
    }
    
    init(data:AnyObject){
        self.init(JSONDecoder(data))
    }
    
    init(_ decoder: JSONDecoder) {
        id = decoder["id"].integer
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

struct Lessons{
    var lessons: [Lesson]
    
    init(){
        lessons = [Lesson]()
    }
    
    mutating func append(lesson:Lesson){
        lessons.append(lesson)
    }
    
    subscript(index:Int) -> Lesson?{
        var result: Lesson?
        var filteredLessons = lessons.filter{ $0.id! == index }
        if filteredLessons.count > 0{
            result = filteredLessons[0]
        }
        return result
    }
    
    var count: Int{
        get{
            return lessons.count
        }
    }
    
}
