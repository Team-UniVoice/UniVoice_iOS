//
//  ArticleCVC.swift
//  UniVoice
//
//  Created by 오연서 on 7/10/24.
//

import UIKit
import SnapKit
import Then

final class ArticleCVC: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "ArticleCVC"
    
    //MARK: Views
    let chip = UILabel()
    let chipView = UIView()
    let articleTitle = UILabel()
    let thumbnailImage = UIImageView()
    let duration = UILabel()
    let divider = UIView()
    let likedIcon = UIImageView()
    let likedNumber = UILabel()
    let savedIcon = UIImageView()
    let savedNumber = UILabel()
    let cellDivider = UIView()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHierarchy()
        setUpUI()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpHierarchy
    private func setUpHierarchy() {
        [
            chipView,
            thumbnailImage,
            articleTitle,
            duration,
            divider,
            likedIcon,
            likedNumber,
            savedIcon,
            savedNumber,
            cellDivider
        ].forEach { self.addSubview($0) }
        
        chipView.addSubview(chip)
    }
    
    // MARK: setUpUI
    private func setUpUI() {
        chip.do {
            $0.setText("공지사항", font: .C4R, color: .B_02)
        }
        chipView.do {
            $0.backgroundColor = .clear
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.regular.cgColor
        }
        thumbnailImage.do {
            $0.image = UIImage(named: "defaultImage")
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 5
            $0.contentMode = .scaleAspectFit
        }
        articleTitle.do {
            $0.setText("명절 귀향 버스 수요 조사", font: .T4SB, color: .B_01)
        }
        duration.do {
            $0.setText("06/26 ~ 06/26", font: .C3R, color: .B_03)
        }
        divider.do {
            $0.backgroundColor = .B_03
        }
        likedIcon.do {
            $0.image = .icnLike
        }
        likedNumber.do {
            $0.setText("10", font: .C3R, color: .B_03)
        }
        savedIcon.do {
            $0.image = .icnViewCount
        }
        savedNumber.do {
            $0.setText("8", font: .C3R, color: .B_03)
        }
        cellDivider.do {
            $0.backgroundColor = UIColor.regular
        }

    }
    // MARK: setUpLayout
    private func setUpLayout() {
        chipView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(4)
            $0.height.equalTo(16)
            $0.width.equalTo(20)
        }
        chip.snp.makeConstraints {
            $0.center.equalTo(chipView)
        }
        articleTitle.snp.makeConstraints {
            $0.top.equalTo(chipView.snp.bottom).offset(6)
            $0.leading.equalTo(chipView)
        }
        thumbnailImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(4)
            $0.size.equalTo(58)
        }
        duration.snp.makeConstraints {
            $0.top.equalTo(articleTitle.snp.bottom).offset(12)
            $0.leading.equalTo(chipView)
        }
        divider.snp.makeConstraints {
            $0.centerY.equalTo(duration)
            $0.leading.equalTo(duration.snp.trailing).offset(8)
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        likedIcon.snp.makeConstraints {
            $0.centerY.equalTo(duration)
            $0.leading.equalTo(divider.snp.trailing).offset(8)
            $0.size.equalTo(12)
        }
        likedNumber.snp.makeConstraints {
            $0.centerY.equalTo(duration)
            $0.leading.equalTo(likedIcon.snp.trailing).offset(2)
        }
        savedIcon.snp.makeConstraints {
            $0.centerY.equalTo(duration)
            $0.leading.equalTo(likedNumber.snp.trailing).offset(6)
            $0.size.equalTo(12)
        }
        savedNumber.snp.makeConstraints {
            $0.centerY.equalTo(duration)
            $0.leading.equalTo(savedIcon.snp.trailing).offset(2)
        }
        cellDivider.snp.makeConstraints {
            $0.top.equalTo(duration.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

extension ArticleCVC {
    func articleDataBind(viewModel: Article) {
        let width = viewModel.chip.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]).width
        chip.text = viewModel.chip
        articleTitle.text = viewModel.articleTitle
        thumbnailImage.image = viewModel.thumbnailImage
        duration.text = viewModel.duration
        likedNumber.text = "\(viewModel.likedNumber)"
        savedNumber.text = "\(viewModel.savedNumber)"
        chipView.snp.removeConstraints()
        chipView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(4)
            $0.height.equalTo(16)
            $0.width.equalTo(width + 14)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    PreviewController(ArticleCVC(), snp: { view in
        view.snp.makeConstraints {
            $0.height.equalTo(78)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.center.equalToSuperview()
        }
    })
}
