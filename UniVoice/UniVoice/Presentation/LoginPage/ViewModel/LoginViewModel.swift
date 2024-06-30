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
        let loginState: Driver<Bool>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let isValid = Observable
                    .combineLatest(input.idText, input.pwText)
                    .map { id, pw in
                        return !id.isEmpty && !pw.isEmpty
                    }
                    .asDriver(onErrorJustReturn: false)
        
        let credentials = Observable
                   .combineLatest(input.idText, input.pwText)
        
        let loginState = input.loginButtonDidTap
            .withLatestFrom(isValid.asObservable())
            .filter { $0 } // isValid가 true인 경우에만 통과
            .withLatestFrom(credentials)
            .flatMapLatest { id, pw in
                return self.login(id: id, password: pw) //  로그인 로직 호출
            }
            .asDriver(onErrorJustReturn: false) 
        
        return Output(isValid: isValid, loginState: loginState)
    }
}

// MARK: API Logic
extension LoginViewModel {
    private func login(id: String, password: String) -> Observable<Bool> {
        return Observable.just(true).delay(.seconds(1), scheduler: MainScheduler.instance)
    }
}
