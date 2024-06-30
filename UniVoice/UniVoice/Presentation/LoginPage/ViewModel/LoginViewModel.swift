//
//  LoginViewModel.swift
//  UniVoice
//
//  Created by 박민서 on 7/1/24.
//

import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}

final class LoginViewModel: ViewModelType {
    
    struct Input {
        let idText: Observable<String>
        let pwText: Observable<String>
        let loginButtonDidTap: Observable<Void>
    }
    
    struct Output {
        let isValid: Driver<Bool>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let isValid = Observable
                    .combineLatest(input.idText, input.pwText)
                    .map { id, pw in
                        return !id.isEmpty && !pw.isEmpty
                    }
                    .asDriver(onErrorJustReturn: false)
        
        return Output(isValid: isValid)
    }
}
