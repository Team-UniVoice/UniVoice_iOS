//
//  LoginViewController.swift
//  UniVoice
//
//  Created by 박민서 on 7/1/24.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: UIViewController {
    
    // MARK: Properties
    private let rootView = LoginView()
    private let viewModel = LoginViewModel()
    
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFoundation()
        setUpBindUI()
    }
    
    // MARK: setUpFoundation
    private func setUpFoundation() {
        self.title = "로그인"
    }
    
    // MARK: setUpBindUI
    private func setUpBindUI() {
        let input = LoginViewModel.Input(
            idText: rootView.idTextField.rx.text.orEmpty.asObservable(),
            pwText: rootView.pwTextField.rx.text.orEmpty.asObservable(),
            loginButtonDidTap: rootView.loginButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(input: input)
        
        output.isValid
            .drive(rootView.loginButton.rx.isEnabled)
            .disposed(by: viewModel.disposeBag)
        
        output.loginState
            .drive(onNext: { [weak self] isUser in
                if isUser {
                    self?.navigationController?.pushViewController(WelcomeViewController(), animated: true)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Login failed", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                }
            })
            .disposed(by: viewModel.disposeBag)
    }
}

@available(iOS 17.0, *)
#Preview {
    LoginViewController()
}
