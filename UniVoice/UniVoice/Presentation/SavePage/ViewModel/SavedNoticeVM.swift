//
//  SavedNoticeVM.swift
//  UniVoice
//
//  Created by 박민서 on 7/14/24.
//

import RxSwift
import RxCocoa
import UIKit

final class SavedNoticeVM: ViewModelType {
    
    struct Input {
        let refreshEvent: Observable<Void>
    }
    
    struct Output {
        let listData: Driver<[Article]>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let listData = input.refreshEvent
            .flatMapLatest({ [weak self] in
                self?.getSavedList() ?? .just([])
            })
            .asDriver(onErrorJustReturn: [])
        
        return Output(listData: listData)
    }
}

// MARK: API Logic
extension SavedNoticeVM {
    // 대충 API 탔다고 가정
    private func getSavedList() -> Observable<[Article]> {
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
        
        return mockData
    }
}

