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

class ___VARIABLE_sceneName___Configurator: SNPConfigurator {
    // MARK: - Properties
    
    // MARK: - Methods
    class func build() -> ___VARIABLE_sceneName___ViewController {
        let viewController = ___VARIABLE_sceneName___ViewController()
        let interactor = ___VARIABLE_sceneName___Interactor()
        let presenter = ___VARIABLE_sceneName___Presenter()
        let router = ___VARIABLE_sceneName___Router()
        
        viewController.interactor = interactor
        
        interactor.viewController = viewController
        interactor.presenter = presenter
        interactor.router = router
        
        presenter.viewController = viewController
        
        router.viewControllerProtocol = viewController
        
        return viewController
    }
}
