# OpenProject Auto-Project Plugin

This plugin creates a new top-level private project for new users.

## Requirements

* OpenProject Version >= 3.0
 
## Installation

Create a file `Gemfile.plugins` in your OpenProject installation with the following content:

	gem "openproject-plugins", :git => "https://github.com/opf/openproject-plugins.git", :branch => "stable" 
	gem "openproject-auto_project", :git => "https://github.com/oliverguenther/openproject-auto_project.git", :branch => "master"


Please see the [OpenProject plugin overview](https://www.openproject.org/projects/openproject/wiki/OpenProject_Plug-Ins)
for more details.

## License

Copyright (c) 2014 Oliver Günther (mail@oliverguenther.de)

This plugin is forked from the [ChiliProject Auto Project Plugin](https://github.com/thegcat/chiliproject_auto_project) by Felix Schäfer.

Copyright (c) 2011 Felix Schäfer

This plugin is licensed under the MIT license. See COPYING for details.
