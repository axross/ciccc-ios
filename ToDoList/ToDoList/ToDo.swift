//
//  ToDo.swift
//  ToDoList
//
//  Created by Kohei Asai on 9/13/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

struct ToDo: Codable {
    var title: String
    var isComplete: Bool
    var dueBy: Date
    var note: String

    static func getInitialToDos() -> [ToDo] {
        return [
            ToDo(title: "ToDo One", isComplete: false, dueBy: Date(), note: "Notes 1"),
            ToDo(title: "ToDo Two", isComplete: false, dueBy: Date(), note: "Notes 2"),
            ToDo(title: "ToDo Three", isComplete: false, dueBy: Date(), note: "Notes 3"),
        ]
    }

    static func loadSavedToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {
            return nil
        }

        return try? PropertyListDecoder().decode(Array<ToDo>.self, from: codedToDos)
    }

    static func saveToDos(_ toDos: [ToDo]) {
        let codedToDos = try? PropertyListEncoder().encode(toDos)

        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }

    static let archiveURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("todos").appendingPathExtension("plist")
}


