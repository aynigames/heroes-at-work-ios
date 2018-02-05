# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

inhibit_all_warnings!
use_frameworks!

target 'HeroesAtWork' do
    
    #Presentation
    pod 'IQKeyboardManagerSwift', '~> 5.0'
    pod 'AlignedCollectionViewFlowLayout'
    
    #CoreData
    pod 'MagicalRecord', '~> 2.3'
    
    #Service
    pod 'Alamofire'
    pod 'AlamofireImage'
    
end

# Disable Code Coverage for Pods projects
post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
        end
    end
end
