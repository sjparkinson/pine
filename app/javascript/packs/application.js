// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "trix";
import * as ujs from "@rails/ujs"
import bsCustomFileInput from 'bs-custom-file-input'

ujs.start();
bsCustomFileInput.init();

// Trix rich text editor logic.
addEventListener("trix-file-accept", function (event) {
    // Prevent all attachments for now.
    event.preventDefault()

    // // Only allow image attachements.
    // if (!["image/png", "image/jpeg", "image/gif"].includes(event.file.type)) {
    //     event.preventDefault();
    //     alert("Only image attachments are allowed.");
    // }

    // // Prevent attaching files larger than 5 MB
    // if (event.file.size > 5242880) {
    //     event.preventDefault();
    //     alert("Attachments must be smaller that 5MB.");
    // }
});
