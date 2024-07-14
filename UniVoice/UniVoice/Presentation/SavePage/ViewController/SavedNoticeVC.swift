//
//  SavedNoticeVC.swift
//  UniVoice
//
//  Created by 박민서 on 7/14/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class SavedNoticeVC: UIViewController {
    
    // MARK: Views
    private let rootView = SavedNoticeView()
    private let disposeBag = DisposeBag()
    
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFoundation()
        bindCollectionView()
    }
    
    func setUpFoundation() {
        rootView.savedCollectionView.register(ArticleCVC.self, forCellWithReuseIdentifier: ArticleCVC.identifier)
    }
    
    func bindCollectionView() {
        rootView.savedCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        let articleDataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Article>>(configureCell: { dataSource, collectionView, indexPath, viewModel in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCVC.identifier, for: indexPath) as? ArticleCVC else {
                return UICollectionViewCell()
            }
            cell.articleDataBind(viewModel: viewModel)
            return cell
        })
        
        let mockData: Observable<[Article]> = Observable.just([
            Article(council: "총학생회", chip: "공지사항", articleTitle: "명절 귀향 버스 수요 조사", thumbnailImage: nil, duration: "2023/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "총학생회", chip: "공지사항", articleTitle: "간식 먹고, 열공하자!", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "선착순 이벤트", articleTitle: "아요 파이팅", thumbnailImage: nil, duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "선착순 이벤트", articleTitle: "기획 파이팅", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "공지사항", articleTitle: "디자인 파이팅", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "공지사항", articleTitle: "안드 파이팅", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "공지사항", articleTitle: "서버 파이팅", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "공지사항", articleTitle: "명절 귀향 버스 수요 조사", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "공지사항", articleTitle: "명절 귀향 버스 수요 조사", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
            Article(council: "공과대학 학생회", chip: "공지사항", articleTitle: "명절 귀향 버스 수요 조사", thumbnailImage: UIImage(named: "defaultImage"), duration: "2024/12/23", likedNumber: 10, savedNumber: 7),
        ])
        
        mockData
            .map { [SectionModel(model: "Section 0", items: $0)] }
            .bind(to: rootView.savedCollectionView.rx.items(dataSource: articleDataSource))
            .disposed(by: disposeBag)
    }
}

extension SavedNoticeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 32, height: 78)
    }
}
