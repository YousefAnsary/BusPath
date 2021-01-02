//
//  String+.swift
//  QuantumSitTask
//
//  Created by Yousef on 12/10/20.
//

import Foundation

extension String {
    
    var attributedHtmlString: NSAttributedString? {
        
        do {
            return try NSAttributedString(data: Data(utf8),
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        } catch {
            print("Error:", error)
            return nil
        }
    }
    
}
