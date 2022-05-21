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
            if let result = result {
                print(result)
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

