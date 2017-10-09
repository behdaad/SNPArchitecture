# SNPArchitecture

Here lies the arcitectural foundation for the years to come, for the generations to come. Take a moment and pay respect to our fallen brothers and sisters, whom had been beaten, broken and scarred, but paved the way on which we tread today. 

To learn about basics of Clean Swift and VIP cycle, read:

http://clean-swift.com/clean-swift-ios-architecture

But SNPArchitecture is not a exact implementation if Clean Swift, it's been modified to accomodate Snapp's requirements. 


To install the Clean Swift Xcode templates, run:

```
make install_templates
```

To uninstall the Clean Swift Xcode templates, run:

```
make uninstall_templates
```

Every push to this repository sends an automatic message to `#ios_scrum_team` Slack channel. You need to pull changes and manually apply new templates by running `make install_templates`. This process can be automated adding a git hook to your local installation of Git. 

1. Create a file named `post-merge` under `.git/hooks` and fill it with:

```
#!/bin/sh
make install_templates
```

2. Add execution permissions to `post-merge` using:
```
chmod +x post-merge
```

3. Since it's not a remote possibility that you'll someday commit and push changes to this repository, you may want to add a `post-commit` hook too. It will be the same as `post-merge`. This can be simply done using

```
cp post-merge post-commit
```

4. Moreover, you want to edit files once and have git automatically copy them in the `Scene` folder. For this, add a `pre-commit` hook using this:
```
#!/bin/sh
cp Templates/Configurator.xctemplate/___FILEBASENAME___Configurator.swift Templates/Scene.xctemplate/___FILEBASENAME___Configurator.swift
cp Templates/Interactor.xctemplate/___FILEBASENAME___Interactor.swift Templates/Scene.xctemplate/___FILEBASENAME___Interactor.swift
cp Templates/Models.xctemplate/___FILEBASENAME___Models.swift Templates/Scene.xctemplate/___FILEBASENAME___Models.swift
cp Templates/Presenter.xctemplate/___FILEBASENAME___Presenter.swift Templates/Scene.xctemplate/___FILEBASENAME___Presenter.swift
cp Templates/Protocols.xctemplate/___FILEBASENAME___Protocols.swift Templates/Scene.xctemplate/___FILEBASENAME___Protocols.swift
cp Templates/Router.xctemplate/___FILEBASENAME___Router.swift Templates/Scene.xctemplate/___FILEBASENAME___Router.swift
cp Templates/ViewController.xctemplate/___FILEBASENAME___ViewController.swift Templates/Scene.xctemplate/___FILEBASENAME___ViewController.swift
```

Add execution permissions using 
```
chmod +x post-merge
```
to `pre-commit` too. 
Voila! Every time you pull this repo, templates will be automatically installed in your Xcode templates folder. 
