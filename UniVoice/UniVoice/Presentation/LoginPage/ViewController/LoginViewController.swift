//
//  LoginViewController.swift
//  UniVoice
//
//  Created by 박민서 on 7/1/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: Views
    private let rootView = LoginView()
    
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFoundation()
    }
    
    // MARK: setUpFoundation
    private func setUpFoundation() {
        self.title = "로그인"
    }
}
