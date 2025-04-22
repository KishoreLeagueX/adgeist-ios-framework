//
//  CreativeDataModel.swift
//  AdgeistCreatives
//
//  Created by kishore on 16/04/25.
//

import Foundation

@objc public class CreativeDataModel: NSObject, Codable {
    @objc public let success: Bool
    @objc public let message: String
    @objc public let data: Campaign?
    
    @objc public init(success: Bool, message: String, data: Campaign?) {
        self.success = success
        self.message = message
        self.data = data
    }
}

@objc public class Campaign: NSObject, Codable {
    @objc public let id: String?
    @objc public let name: String?
    @objc public let creative: Creative?
    @objc public let budgetSettings: BudgetSettings?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case creative
        case budgetSettings
    }
    
    @objc public init(id: String?, name: String?, creative: Creative?, budgetSettings: BudgetSettings?) {
        self.id = id
        self.name = name
        self.creative = creative
        self.budgetSettings = budgetSettings
    }
}

@objc public class Creative: NSObject, Codable {
    @objc public let title: String?
    @objc public let description: String?
    @objc public let fileUrl: String?
    @objc public let ctaUrl: String?
    @objc public let type: String?
    @objc public let fileName: String?
    @objc public let createdAt: String?
    @objc public let updatedAt: String?
    
    @objc public init(title: String?,
               description: String?,
               fileUrl: String?,
               ctaUrl: String?,
               type: String?,
               fileName: String?,
               createdAt: String?,
               updatedAt: String?) {
        self.title = title
        self.description = description
        self.fileUrl = fileUrl
        self.ctaUrl = ctaUrl
        self.type = type
        self.fileName = fileName
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

@objc public class BudgetSettings: NSObject, Codable {
    @objc public let totalBudget: Double
    @objc public let spentBudget: Double
    
    @objc public init(totalBudget: Double, spentBudget: Double) {
        self.totalBudget = totalBudget
        self.spentBudget = spentBudget
    }
}