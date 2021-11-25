// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

// import { Controller } from "stimulus"

// export default class extends Controller {
//   static targets = [ "output" ]

//   connect() {
//     this.outputTarget.textContent = 'Hello, Stimulus!'
//   }
// }

// imports
import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('hello from select2 controller')
    $(this.element).select2({
      width: "100%",
      theme: "classic",
      color: "#000",
    });
  }
}
