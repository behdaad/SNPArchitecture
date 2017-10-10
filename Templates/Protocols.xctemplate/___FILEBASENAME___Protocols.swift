//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates, edited by
//  Behdad Keynejad for Snapp, so you can apply clean architecture to your
//  iOS and Mac projects, see http://clean-swift.com
//

import UIKit

@objc protocol ___VARIABLE_sceneName___InteractorProtocol: class {
    @objc optional func viewDidLoad() -> Void
    @objc optional func viewWillAppear(_ animated: Bool) -> Void
    @objc optional func viewDidAppear(_ animated: Bool) -> Void
    @objc optional func viewWillDisappear(_ animated: Bool) -> Void
    @objc optional func viewDidDisappear(_ animated: Bool) -> Void
}

protocol ___VARIABLE_sceneName___PresenterProtocol: class {
    func present(businessModel: ___VARIABLE_sceneName___.Something.BusinessModel) -> Void
}

protocol ___VARIABLE_sceneName___ViewControllerProtocol: class {
    func display(viewModel: ___VARIABLE_sceneName___.Something.ViewModel) -> Void
}

protocol ___VARIABLE_sceneName___RouterProtocol: class {
    func navigateTo<#Scene#>(presentingViewController: UIViewController) -> Void
}
