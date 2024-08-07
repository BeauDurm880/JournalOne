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
import 'chartjs-adapter-moment'; // Import the date adapter


Chartkick.use(Chart);

Rails.start();

ActiveStorage.start();

