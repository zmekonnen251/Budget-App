# Pin npm packages by running ./bin/importmap

pin "application",preload:true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
# my_engine/config/importmap.rb

pin_all_from File.expand_path("../app/assets/javascripts", __dir__)
