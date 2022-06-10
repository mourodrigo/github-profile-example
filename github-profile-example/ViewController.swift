//
//  ViewController.swift
//  github-profile-example
//
//  Created by Rodrigo Bueno Tomiosso on 10/06/22.
//

import UIKit

class ViewController: UIViewController {

    let profileProvider = ProfileProvider()
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    @IBOutlet weak var contentContainer: UIStackView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var company: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentContainer.isHidden = true
        activityView.isHidden = false
    }
    
    private func updateUI(with profile: Profile) {
        username.text = profile.login
        fullName.text = profile.name
        company.text = profile.company
        contentContainer.isHidden = false
        activityView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let username = "mourodrigo"

        profileProvider.getProfile(username: username) { result in
            switch result {
            case .success(let profile):
                DispatchQueue.main.async {
                    self.updateUI(with: profile)
                }
            case .failure(let error):
                print(error)
            }
        }
    }


}

