//
//  OTPView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import Combine

final class OTPViewModel: ObservableObject {
    
    @Published var isEnbledButton = true
    @Published var otp = ""  {
        didSet {
            if otp.count > 4 && oldValue.count <= 4 {
                otp = oldValue
            }
        }
    }
    @Published var otpPromt = ""
    
    private let isRegister: Bool
    private let appCoordinator: AppCoordinator
    
    init(isRegister: Bool, appCoordinator: AppCoordinator) {
        self.isRegister = isRegister
        self.appCoordinator = appCoordinator
        setup()
    }
    
    private func setup() {
        $otp
            .map { str in
                return str.count == 4
            }
            .assign(to: &$isEnbledButton)
    }
    
    func confirmAction() {
        if isRegister {
            appCoordinator.coordinate(to: AuthorizationPath.selectUserAvatar)
        } else {
            appCoordinator.coordinate(to: AuthorizationPath.newPassword)
        }
    }
    
}
