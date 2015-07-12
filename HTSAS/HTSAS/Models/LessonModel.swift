//
//  LessonModel.swift
//  HTSAS
//
//  Created by Domenico on 28/06/15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import SwiftyJSON

struct LessonTranscript {
    var author: String?
    var caption: String?
    init() {
        
    }
    
    init(data: JSON) {
        author = data["author"].string
        caption = data["caption"].string
    }
}
struct Author {
    var name:String?
    var slide:String?
    
    init(data: JSON) {
        name = data["name"].string
        slide = data["slide"].string
    }
}

struct Lesson {
    var transcripts:Array<LessonTranscript>?
    var authors: Array<Author>?
    var youtubeID: String?
    var title: String?
    var website: String?
    var lessonType: String?
    var id:String?
    
    init() {
        
    }
    
    init(data:NSData){
        let jsonData = JSON(data:data)
        youtubeID = jsonData["youtube_video"].string
        title = jsonData["title"].string
        website = jsonData["website"].string
        lessonType = jsonData["type"].string
        id = jsonData["id"].string
        authors = Array<Author>()
        transcripts = Array<LessonTranscript>()
        for (key: String, subJson: JSON) in jsonData["authors"] {
            var author = Author(data: subJson)
            authors?.append(author)
        }
        
        for (index: String, subJson: JSON) in jsonData["data"] {
            var transcript = LessonTranscript(data: subJson)
            transcripts?.append(transcript)
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
    
    subscript(index:Int) ->Lesson?{
        var result: Lesson?
        result = lessons[index]
        return result
    }
    
    var count: Int{
        get{
            return lessons.count
        }
    }
    
}
