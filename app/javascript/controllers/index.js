// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  remove() {
    this.element.remove()
  }
}