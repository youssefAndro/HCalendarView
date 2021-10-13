
Pod::Spec.new do |spec|

  spec.name         = "HCalendar"
  spec.version      = "1.0.6"
  spec.summary      = "Horizontal scrollable calendar for week view just like on iOS calendar."

  spec.description  = <<-DESC
  This calendar shows week view and can be scrolled back and forth endlessly. You can select any date you want.
                   DESC

  spec.homepage     = "https://github.com/youssefAndro/HCalendarView"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "youssef aqabbou" => "youssef.aqabbou@gmail.com" }
  
  
  
  spec.ios.deployment_target = "14.0"
  
  spec.source       = { :git => "https://github.com/youssefAndro/HCalendarView.git", :tag => "#{spec.version}" }
  spec.source_files  = 'Source/**/*.swift'
  #spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  #spec.exclude_files = "Classes/Exclude"
  
end
