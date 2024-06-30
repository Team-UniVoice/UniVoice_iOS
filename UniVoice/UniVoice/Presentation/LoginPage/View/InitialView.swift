//
//  InitialView.swift
//  UniVoice
//
//  Created by 박민서 on 7/1/24.
//

import UIKit
import SnapKit
import Then

final class InitialView: UIView {
    
    // MARK: Views
    private let logoImageView = UIImageView()
    let buttonStack = UIStackView()
    let startButton = UIButton()
    let loginButton = UIButton()
    let councilButton = UIButton()
    
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
            startButton,
            loginButton,
            councilButton
        ].forEach { buttonStack.addArrangedSubview($0) }
        
        [
            logoImageView,
            buttonStack
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpUI
    private func setUpUI() {
        logoImageView.do {
            $0.image = UIImage(systemName: "graduationcap.fill")
        }
        
        buttonStack.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        
        startButton.do {
            $0.setTitle("유니보이스 시작하기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
        
        loginButton.do {
            $0.setTitle("로그인 하기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
        
        councilButton.do {
            $0.setTitle("학생회이신가요?", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(200)
        }
        
        buttonStack.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
