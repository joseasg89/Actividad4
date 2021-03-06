//
//  Extension.swift
//  Actividad4
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation
import UIKit

extension String{
    func fromBase64() -> String?{
        guard let data = Data(base64Encoded: self)else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    func toBase6() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
