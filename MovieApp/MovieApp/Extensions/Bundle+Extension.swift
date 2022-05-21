//
//  Bundle+Extension.swift
//  MovieApp
//
//  Created by Mingu Seo on 2022/05/21.
//

import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "APIKey", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["APIKEY"] as? String else {
            print("APIKEY값을 입력해주세요.")
            return "" }
        return key
    }
}
