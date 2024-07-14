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
    private let titleLabel = UILabel()
    lazy var savedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
    }).then {
        $0.backgroundColor = .white
    }
    
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
            titleLabel,
            savedCollectionView
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpUI
    private func setUpUI() {
        titleLabel.do {
            $0.attributedText = .pretendardAttributedString(for: .H5B, with: "저장한 공지사항")
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        savedCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
