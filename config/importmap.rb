# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "budget_table", to: "budget_table.js"
pin "control_table", to: "control_table.js"
pin "contractor_table", to: "contractor_table.js"
pin "alco_table", to: "alco_table.js"
pin "guest_table", to: "guest_table.js"
