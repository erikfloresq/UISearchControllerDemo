//
//  Please.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 16/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation

struct Please {
    static func readJSON(from file: String) -> Data {
        guard let jsonFileURL = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Problems with JSON URL")
        }
        do {
            return try Data(contentsOf: jsonFileURL)
        } catch {
            fatalError("Data parse error: \(error.localizedDescription)")
        }
    }
}
