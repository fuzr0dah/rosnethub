//
//  AppDelegate.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController(contentView: LoginView(), viewModel: LoginViewModel())
        window?.makeKeyAndVisible()
        return true
    }
}
