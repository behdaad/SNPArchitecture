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

class ___VARIABLE_sceneName___ViewController: SNPViewController {
    // MARK: - Properties
    var <#scene#>Interactor: ___VARIABLE_sceneName___InteractorProtocol! {
        get {
            return interactor as! ___VARIABLE_sceneName___InteractorProtocol
        }
        set {
            interactor = newValue
        }
    }
    var <#scene#>View: ___VARIABLE_sceneName___View = Bundle.load()
    
    // MARK: - Methods
    // MARK: UIViewController
    override func loadView() {
        view = <#scene#>View
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___ViewControllerProtocol {
//    func show(viewModel: ___VARIABLE_sceneName___.SomeViewModel) {
//        
//    }
}
