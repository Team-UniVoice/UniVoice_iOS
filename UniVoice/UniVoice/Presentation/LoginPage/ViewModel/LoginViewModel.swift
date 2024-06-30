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
        
    }
    
    struct Output {
        
    }
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
