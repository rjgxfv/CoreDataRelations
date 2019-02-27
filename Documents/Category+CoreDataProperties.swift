//
//  Category+CoreDataProperties.swift
//  Documents
//
//  Created by Robert Graman on 2/27/19.
//  Copyright © 2019 Robert Graman. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawDocs: NSOrderedSet?

}

// MARK: Generated accessors for rawDocs
extension Category {

    @objc(insertObject:inRawDocsAtIndex:)
    @NSManaged public func insertIntoRawDocs(_ value: Doc, at idx: Int)

    @objc(removeObjectFromRawDocsAtIndex:)
    @NSManaged public func removeFromRawDocs(at idx: Int)

    @objc(insertRawDocs:atIndexes:)
    @NSManaged public func insertIntoRawDocs(_ values: [Doc], at indexes: NSIndexSet)

    @objc(removeRawDocsAtIndexes:)
    @NSManaged public func removeFromRawDocs(at indexes: NSIndexSet)

    @objc(replaceObjectInRawDocsAtIndex:withObject:)
    @NSManaged public func replaceRawDocs(at idx: Int, with value: Doc)

    @objc(replaceRawDocsAtIndexes:withRawDocs:)
    @NSManaged public func replaceRawDocs(at indexes: NSIndexSet, with values: [Doc])

    @objc(addRawDocsObject:)
    @NSManaged public func addToRawDocs(_ value: Doc)

    @objc(removeRawDocsObject:)
    @NSManaged public func removeFromRawDocs(_ value: Doc)

    @objc(addRawDocs:)
    @NSManaged public func addToRawDocs(_ values: NSOrderedSet)

    @objc(removeRawDocs:)
    @NSManaged public func removeFromRawDocs(_ values: NSOrderedSet)

}
