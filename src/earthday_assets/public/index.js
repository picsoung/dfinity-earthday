import Vue from 'vue'
import App from './App.vue'

import '../../css/mapbox-gl.css';
import earthday from "ic:canisters/earthday";

import Buefy from 'buefy'
import 'buefy/dist/buefy.css'

import { library } from '@fortawesome/fontawesome-svg-core';
// internal icons
import { fas } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

library.add(fas);
Vue.component('vue-fontawesome', FontAwesomeIcon);

Vue.use(Buefy,{
  defaultIconPack: 'fas'
})

const events = require("../../../scripts/events.json");

async function seed() {
  //first 10
  for (var event of events.slice(0, 10)) {
    console.log(event)
    earthday.createEvent(event.id,
      event.name,
      event.location,
      event.date,
      event.start_time,
      event.address,
      event.additional_information,
      event.host,
      event.country_code,
      event.geometry.lat,
      event.geometry.long,
      event.organizer.name,
      event.organizer.email,
      event.organizer.phone).then((e) => {
        console.log("e", e)
      })
  }

};

seed()

new Vue({
  render: (h) => h(App)
}).$mount('#app')
