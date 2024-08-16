// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "@hotwired/turbo-rails";
import Chartkick from "chartkick";
import Chart from "chart.js/auto";
import 'chartjs-adapter-moment'; 

Chartkick.use(Chart);
Rails.start();
ActiveStorage.start();

document.addEventListener('turbo:load', function() {
  // Toggle text visibility
  document.querySelectorAll('.toggle-text').forEach(function(link) {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      var entryId = event.currentTarget.dataset.entryId;
      var shortText = event.currentTarget.closest('.list-group-item').querySelector('.entry-short-text');
      var fullText = event.currentTarget.closest('.list-group-item').querySelector('.entry-full-text');

      if (fullText.style.display === 'none') {
        shortText.style.display = 'none';
        fullText.style.display = 'inline';
        event.currentTarget.textContent = 'Show Less';
      } else {
        shortText.style.display = 'inline';
        fullText.style.display = 'none';
        event.currentTarget.textContent = 'Show More';
      }
    });
  });

  // Toggle edit form visibility
  document.querySelectorAll('.edit-toggle').forEach(function(button) {
    button.addEventListener('click', function(event) {
      event.preventDefault();
      var entryId = event.currentTarget.dataset.entryId;
      var formContainer = document.getElementById('edit-form-' + entryId);

      // Hide all open forms
      document.querySelectorAll('.edit-form-container').forEach(function(container) {
        if (container !== formContainer) {
          container.style.display = 'none';
        }
      });

      // Toggle the display of the selected form
      if (formContainer) {
        formContainer.style.display = (formContainer.style.display === 'block') ? 'none' : 'block';
      }
    });
  });

  // Initialize the sliders for all entries
  document.querySelectorAll('input[type="range"]').forEach(function(slider) {
    var formContainer = slider.closest('.edit-form-container');
    if (formContainer) {
      var entryId = formContainer.id.split('-').pop();
      var output = document.getElementById('ratingValue-' + entryId);

      if (output) {
        slider.addEventListener('input', function(event) {
          output.textContent = 'Rating: ' + event.target.value;
        });

        // Initialize the output on page load
        output.textContent = 'Rating: ' + slider.value;
      }
    }
  });
});
