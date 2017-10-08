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

class ___VARIABLE_sceneName___Interactor {
    // MARK: - Properties
    var presenter: ___VARIABLE_sceneName___PresenterProtocol!
    var router: ___VARIABLE_sceneName___RouterProtocol!
    weak var viewController: ___VARIABLE_sceneName___ViewControllerProtocol!
    
    // MARK: - Methods
}

extension ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___InteractorProtocol {
    func configViewOnLoad() {
        
    }
}