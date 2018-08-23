//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___VARIABLE_sceneName___View: UIView {
    // MARK: - Properties
    weak var view: UIView?
    //MARK: Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    // MARK: - Methods
    private func setupView() {
        let view: UIView = Bundle.main.load("___VARIABLE_sceneName___View", owner: self)
        addExpletiveSubView(view: view)
        self.view = view
    }
    // MARK: NSObject
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
