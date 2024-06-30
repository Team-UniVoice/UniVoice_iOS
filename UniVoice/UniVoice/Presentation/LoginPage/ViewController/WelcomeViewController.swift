//
//  WelcomeViewController.swift
//  UniVoice
//
//  Created by 박민서 on 7/1/24.
//

import UIKit
import RxSwift
import RxCocoa

final class WelcomeViewController: UIViewController {
    
    // MARK: Properties
    private let rootView = WelcomeView()
    private let disposeBag = DisposeBag() // 임시용
    
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpFoundation()
        setUpBindUI()
    }
    
    // MARK: setUpFoundation
//    private func setUpFoundation() {
//
//    }
    
    // MARK: setUpBindUI
    private func setUpBindUI() {
        rootView.homeButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.navigationController?.pushViewController(ViewController(), animated: true)
            })
            .disposed(by: disposeBag)
    }
}

@available(iOS 17.0, *)
#Preview {
    WelcomeViewController()
}
