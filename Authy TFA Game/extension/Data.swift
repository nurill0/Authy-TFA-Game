//
//  Data.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 10/08/23.
//

import Foundation
import AVFoundation


struct LessonData {
    let title: String
    let id: String
}


struct Datas{
    var data: [LessonData] = [
        LessonData(title: "Street Workout", id: "3"),
        LessonData(title: "Total Workout", id: "3"),
        LessonData(title: "Mobility mix", id: "1"),
        LessonData(title: "Pop up", id: "5"),
        LessonData(title: "Stretching + ABC", id: "3"),
        LessonData(title: "Contemporary dance", id: "3"),
        LessonData(title: "Upper Workout", id: "18"),
        LessonData(title: "Yoga", id: "7"),
        LessonData(title: "Flex power", id: "3"),
        LessonData(title: "Pilates", id: "3"),
        LessonData(title: "FT interval", id: "4"),
        LessonData(title: "Pump FT", id: "3"),
        LessonData(title: "Stretching", id: "7"),
        LessonData(title: "Lower workout", id: "1"),
        LessonData(title: "Zumba dance", id: "3"),
        LessonData(title: "Upper workout", id: "10"),
        LessonData(title: "Fitness", id: "3"),
        LessonData(title: "Hip-hop dance", id: "3")
    ]
    
    func getitems(index: Int)->LessonData {
        return data[index]
    }
    
    func getSize()->Int{
        return data.count
    }
}

let dataForTime: [String] = [
    "8:00-8:45",
    "9:00-9:45",
    "10:00-10:45",
    "11:00-11:45",
    "12:00-12:45",
    "13:00-13:45",
    "14:00-14:45",
    "15:00-15:45",
    "16:00-16:45",
    "17:00-17:45",
    "18:00-18:45",
    "19:00-19:45",
    "20:00-20:45",
    "21:00-21:45",
    "22:00-22:45",
    ]



