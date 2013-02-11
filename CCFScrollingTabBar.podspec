Pod::Spec.new do |s|
    s.name = 'CCFScrollingTabBar'
    s.version = '0.9.0'
    s.summary = 'A refined scrolling tab bar for iPhone'
    s.platform = :ios, '5.0'
    s.author = { 'Alan Duncan' => 'alan@cocoa-factory.com' }
    s.homepage = 'https://github.com/cocoa-factory/CCFScrollingTabBar'
    s.license = 'MIT'
    s.frameworks = 'QuartzCore', 'UIKit'
    s.requires_arc = true
    s.source = { :git => 'https://github.com/cocoa-factory/CCFScrollingTabBar.git' }
    s.source_files = 'source/*/{h,m}'
end