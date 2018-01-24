//
//  Verbs.swift
//  UISearchControllerDemo
//
//  Created by Erik Flores on 16/01/18.
//  Copyright © 2018 Orbis. All rights reserved.
//

import Foundation

enum CoderKeys: String {
    case idKey
    case baseFormKey
    case pastFormKey
    case pastParticipleFormKey
    case sEsIesFormKey
    case ingFormKey
}

class Verb: NSObject, NSCoding, Codable {
    @objc let id: Int
    @objc let baseForm: String
    @objc let pastForm: String
    @objc let pastParticipleForm: String
    @objc let sEsIesForm: String
    @objc let ingForm: String

    init(id: Int, baseForm: String, pastForm: String, pastParticipleForm: String, sEsIesForm: String, ingForm: String) {
        self.id = id
        self.baseForm = baseForm
        self.pastForm = pastForm
        self.pastParticipleForm = pastParticipleForm
        self.sEsIesForm = sEsIesForm
        self.ingForm = ingForm
    }

    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: CoderKeys.idKey.rawValue) as! Int
        baseForm = aDecoder.decodeObject(forKey: CoderKeys.baseFormKey.rawValue) as! String
        pastForm = aDecoder.decodeObject(forKey: CoderKeys.pastFormKey.rawValue) as! String
        pastParticipleForm = aDecoder.decodeObject(forKey: CoderKeys.pastParticipleFormKey.rawValue) as! String
        sEsIesForm = aDecoder.decodeObject(forKey: CoderKeys.sEsIesFormKey.rawValue) as! String
        ingForm = aDecoder.decodeObject(forKey: CoderKeys.ingFormKey.rawValue) as! String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: CoderKeys.idKey.rawValue)
        aCoder.encode(baseForm, forKey: CoderKeys.baseFormKey.rawValue)
        aCoder.encode(pastForm, forKey: CoderKeys.pastFormKey.rawValue)
        aCoder.encode(pastParticipleForm, forKey: CoderKeys.pastParticipleFormKey.rawValue)
        aCoder.encode(sEsIesForm, forKey: CoderKeys.sEsIesFormKey.rawValue)
        aCoder.encode(ingForm, forKey: CoderKeys.ingFormKey.rawValue)
    }
}

extension Verb {
    static func getVerbsFromJSON(_ json: String) -> [Verb] {
        let dataJSON = Please.readJSON(from: json)
        do {
            return try JSONDecoder().decode([Verb].self, from: dataJSON)
        } catch {
            fatalError("Decoder error: \(error.localizedDescription)")
        }
    }
}
