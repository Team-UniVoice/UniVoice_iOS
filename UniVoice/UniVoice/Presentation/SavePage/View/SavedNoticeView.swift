//
//  SavedNoticeView.swift
//  UniVoice
//
//  Created by 박민서 on 7/14/24.
//

import UIKit
import SnapKit
import Then

final class SavedNoticeView: UIView {
    
    // MARK: Views
    
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

        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpUI
    private func setUpUI() {
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
    }
}
