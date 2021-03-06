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

import XCTest
@testable import ___PROJECTNAMEASIDENTIFIER___
import SwiftyMocky

class ___VARIABLE_sceneName___PresenterTests: XCTestCase {
    // MARK: - Properties
    var presenter: ___VARIABLE_sceneName___Presenter!
    
    // MARK: - Methods
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        presenter = ___VARIABLE_sceneName___Presenter()
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
    }
    
    // MARK: - Tests
    func testPresentSomething() {
        // Given
        let viewControllerMock = ___VARIABLE_sceneName___ViewControllerProtocolMock()
        presenter.viewController = mockViewController
        
        // When
         //presenter.present(viewModel: viewModel)
        // Then
        Verify(viewControllerMock, .//desired method => show(viewModel: .any))
    }
}
