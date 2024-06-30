//
//  WelcomeView.swift
//  UniVoice
//
//  Created by 박민서 on 7/1/24.
//

import UIKit
import SnapKit
import Then

final class WelcomeView: UIView {
    
    // MARK: Views
    private let welcomeLabel = UILabel()
    let homeButton = UIButton()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFoundation()
        setUpHierarchy()
        setUpUI()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpFoundation
    private func setUpFoundation() {
        self.backgroundColor = .white
    }
    
    // MARK: setUpHierarchy
    private func setUpHierarchy() {
        [
            welcomeLabel,
            homeButton
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpUI
    private func setUpUI() {
        welcomeLabel.do {
            $0.text = "환영합니다!"
        }

        homeButton.do {
            $0.setTitle("유니보이스 홈 가기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        welcomeLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        homeButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    WelcomeView()
}
