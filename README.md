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

Voila! Every time you pull this repo, templates will be automatically installed in your Xcode templates folder. 

**Bonus**
Since it's not a remote possibility that you'll someday commit and push changes to this repository, you may want to add a `post-commit` hook too. It will be the same as `post-merge`. 
