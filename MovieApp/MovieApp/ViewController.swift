//
//  ViewController.swift
//  MovieApp
//
//  Created by Mingu Seo on 2022/05/21.
//

import UIKit

class ViewController: UIViewController {
    let repository = Repository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.getMoviesPlaying { result, error in
            // MARK: API 호출 성공시 데이터 반환
            if let result = result {
                dump(result)
            }
            
            // MARK: API 호출 실패시 에러 반환
            if let error = error {
                // API 에러 반환
                dump(error)
            }
        }
    }
}

