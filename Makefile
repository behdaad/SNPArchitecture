XCODE_USER_TEMPLATES_DIR=~/Library/Developer/Xcode/Templates/File\ Templates
XCODE_USER_SNIPPETS_DIR=~/Library/Developer/Xcode/UserData/CodeSnippets

TEMPLATES_DIR=Templates
SCENE_DIR=$(TEMPLATES_DIR)/Scene.xctemplate

install_templates:
	mkdir -p $(SCENE_DIR)
	cp $(TEMPLATES_DIR)/Configurator.xctemplate/___FILEBASENAME___Configurator.swift $(SCENE_DIR)/___FILEBASENAME___Configurator.swift
	cp $(TEMPLATES_DIR)/Interactor.xctemplate/___FILEBASENAME___Interactor.swift $(SCENE_DIR)/___FILEBASENAME___Interactor.swift
	cp $(TEMPLATES_DIR)/Presenter.xctemplate/___FILEBASENAME___Presenter.swift $(SCENE_DIR)/___FILEBASENAME___Presenter.swift
	cp $(TEMPLATES_DIR)/Protocols.xctemplate/___FILEBASENAME___Protocols.swift $(SCENE_DIR)/___FILEBASENAME___Protocols.swift
	cp $(TEMPLATES_DIR)/Router.xctemplate/___FILEBASENAME___Router.swift $(SCENE_DIR)/___FILEBASENAME___Router.swift
	cp $(TEMPLATES_DIR)/ViewController.xctemplate/___FILEBASENAME___ViewController.swift $(SCENE_DIR)/___FILEBASENAME___ViewController.swift
	cp $(TEMPLATES_DIR)/View.xctemplate/___FILEBASENAME___View.swift $(SCENE_DIR)/___FILEBASENAME___View.swift
	cp $(TEMPLATES_DIR)/ViewController.xctemplate/___FILEBASENAME___ViewController.storyboard $(SCENE_DIR)/___FILEBASENAME___ViewController.storyboard

	mkdir -p $(XCODE_USER_TEMPLATES_DIR)
	rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
	cp -R $(TEMPLATES_DIR) $(XCODE_USER_TEMPLATES_DIR)

uninstall_templates:
	rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
