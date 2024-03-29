//
//  AppDelegate.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/13/21.
//

import UIKit
//import AppCenter
//import AppCenterAnalytics
//import AppCenterCrashes
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        AppCenter.start(withAppSecret: "921f3f91-8ab9-45c9-96c4-de46387270e8", services:[
//          Analytics.self,
//          Crashes.self
//        ])
//        NetworkLogger.registerClass(URLProtocol.self)
        URLProtocol.registerClass(NetworkLogger.self)
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

