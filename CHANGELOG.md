## [2.6.2] - 2023-10-05
### Updated
- Check if strcmp had value
## [2.6.1] - 2023-08-31
### Updated
- Check if asset file is indeed an object
## [2.6.0] - 2023-08-21
### Updated
- Made changes to adding section classes
## [2.5.2] - 2020-11-16
### Updated
- Changed all the dot notations to php array ['value'] notation + added the needed isset()
## [2.6.0] - 2023-06-02
### Updated
- made php 8.1 compatible
## [2.5.1] - 2020-11-10
### Updated
- Added missing bracket

## [2.5.0] - 2020-11-9
### Updated
- Updated browserSync array check to work with php 7.4

## [2.4.11] - 2020-02-06
### Updated
- Changed breadcrumbs tpl to play well with structured data for Google Breadcrumbs

## [2.4.10] - 2019-10-11
### Updated
- Body components should only be included once

## [2.4.9] - 2018-08-21
### Updated
- Fixed minifying stylesheets starting with https

## [2.4.8] - 2018-04-13
### Updated
- Don't render useless divs when layout className or containerClass isn't set

## [2.4.6] - 2017-08-18
### Updated
- fixed hideForAuthenticatedUsers and hideForAnonymousUsers in the menu templates

## [2.4.5] - 2017-06-21
### Updated
- removed meta from base/index.tpl, belongs in cms/base.tpl where it also resides

## [2.4.4] - 2017-06-12
### Fixed
- Remove empty subject parameter from social share mail link (causes issues in certain email clients)

## [2.4.2] - 2017-06-07
### Fixed
- Fixed default asset template to generate URLs for every asset type, not just images

## [2.4.1] - 2017-06-01
### Fixed
- Fixed a small typo in naming of function.

## [2.4.0] - 2017-06-01
### Removed
- Removed the original Google Tag Manager function

### Added
- Added 2 new Functions for the Google Tag Manager tag, one in ```<head>``` and one in ```<body>```

## [2.3.0] - 2017-04-25
### Added
- template for the finish page of the exception report module

## [2.2.0] - 2017-04-10
### Deprecated
- Deprecate “excerpt” class name in favour of “card”

### Changed
- Generalize image transformation widths to better fit layouts

### Fixed
- Fix colorbox for asset helper function

## [2.1.2] - 2017-03-30
### Updated
- fixed submission URL of the exception form

## [2.1.1] - 2017-03-20
### Updated
- made default assets template fall back to download links, instead of only displaying images

## [2.1.0] - 2017-02-09
### Added
- added meta tags from the node

## [2.0.0] - 2017-01-24
### Added
- support for allow_delete option for file and image form rows
- downloads template for assets widget

### Updated
- use widgets 2.0
- localized url handling
- main.js with updated locales

### Removed
- files, google and toc widget templates

## [1.4.0] - 2017-01-18
### Added
- added template for the exception module

## [1.3.0] - 2017-01-17
### Added
- added template for a widget error

## [1.2.0] - 2017-01-13
### Added
- canonical URL to head
- localized URL's to head
- pagination URL's to head

### Removed
- modifier.text: use smarty-cms module for the CMS integration of Smarty

## [1.1.0] - 2016-10-25
### Updated
- title widget template to support custom titles with an anchor
- menu widget templates to create a menu based on the custom titles with an anchor, usefull for a TOC or one pagers

## 0.0.1 - 2015-06-12

### Added
- First add the first btch of files to the git repo
- Do an effort to maintain a changelog
