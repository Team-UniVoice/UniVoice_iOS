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
    private let viewModel = SavedNoticeVM()
    
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFoundation()
        bindUI()
    }
    
    func setUpFoundation() {
        rootView.savedCollectionView.register(ArticleCVC.self, forCellWithReuseIdentifier: ArticleCVC.identifier)
        rootView.savedCollectionView.rx.setDelegate(self).disposed(by: viewModel.disposeBag)
    }
    
    func bindUI() {
        let input = SavedNoticeVM.Input(refreshEvent: .just(Void()))
        let output = viewModel.transform(input: input)
        
        let articleDataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Article>>(configureCell: { dataSource, collectionView, indexPath, viewModel in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCVC.identifier, for: indexPath) as? ArticleCVC else {
                return UICollectionViewCell()
            }
            cell.articleDataBind(viewModel: viewModel)
            return cell
        })
        
        output.listData
            .map { [SectionModel(model: "Section 0", items: $0)] }
            .drive(rootView.savedCollectionView.rx.items(dataSource: articleDataSource))
            .disposed(by: viewModel.disposeBag)
    }
}

extension SavedNoticeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 32, height: 78)
    }
}
