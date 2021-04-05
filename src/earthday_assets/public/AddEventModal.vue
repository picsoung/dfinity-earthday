<template>
  <div class="modal-card">
    <header class="modal-card-head">
      <p class="modal-card-title">Add a new event</p>
      <button type="button" class="delete" @click="$emit('close')" />
    </header>
    <section class="modal-card-body">
      <b-field label="Event name">
        <b-input
          type="text"
          v-model="event_name"
          placeholder="Cleanup at ..."
          required
        ></b-input>
      </b-field>

      <b-field label="City">
        <b-input
          type="text"
          v-model="location"
          placeholder="San Francisco"
          required
        ></b-input>
      </b-field>
      <b-field label="Address">
        <b-input
          type="text"
          v-model="address"
          placeholder="123 Market Street"
          required
        ></b-input>
      </b-field>
      <b-field label="Date">
        <b-input
          type="text"
          v-model="date"
          placeholder="04/21/2021"
          required
        ></b-input>
      </b-field>
      <b-field label="Start time">
        <b-input
          type="text"
          v-model="start_time"
          placeholder="10am"
          required
        ></b-input>
      </b-field>
      <b-field label="Host">
        <b-input
          type="text"
          v-model="host"
          placeholder="Organization or individual"
          required
        ></b-input>
      </b-field>
      <b-field label="Country">
        <b-input
          type="text"
          v-model="country_code"
          placeholder="USA"
          required
        ></b-input>
      </b-field>
      <b-field label="Meeting point Latitude">
        <b-input
          type="text"
          v-model="latitude"
          placeholder="37.733795"
          required
        ></b-input>
      </b-field>
      <b-field label="Meeting point Longitude">
        <b-input
          type="text"
          v-model="longitude"
          placeholder="-122.446747"
          required
        ></b-input>
      </b-field>
      <b-field label="Organizer name">
        <b-input
          type="text"
          v-model="organizer_name"
          placeholder="Bruce Wayne"
          required
        ></b-input>
      </b-field>
      <b-field label="Organizer email">
        <b-input
          type="text"
          v-model="organizer_email"
          placeholder="bruce@wayne.com"
          required
        ></b-input>
      </b-field>
      <b-field label="Organizer phone">
        <b-input
          type="text"
          v-model="organizer_phone"
          placeholder="+14151234568"
          required
        ></b-input>
      </b-field>
      <b-field label="Description">
        <b-input
          type="text"
          v-model="additional_information"
          placeholder="+14151234568"
          required
        ></b-input>
      </b-field>
    </section>
    <footer class="modal-card-foot">
      <button class="button" type="button" @click="$emit('close')">
        Close
      </button>
      <button class="button is-primary" @click="handleSubmit">Create</button>
    </footer>
  </div>
  <!-- <div class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
      <h2>Add an envent</h2>
      <form id="createEventForm" @submit.prevent="handleSubmit">
        <label>
          Name:
          <input type="text" class="input" name="name" v-model="name" />
        </label>
        <label>
          Location:
          <input type="text" class="input" name="location" v-model="location" />
        </label>
        <button type="submit">Submit</button>
      </form>
    </div>
    <button class="modal-close is-large" aria-label="close"></button>
  </div> -->
</template>

<script>
import earthday from "ic:canisters/earthday";
export default {
  name: "AddEventModal",
  methods: {
    async handleSubmit() {
      console.log("handleSubmit",  Date.now().toString(),
          this.event_name,
          this.location,
          this.date,
          this.start_time,
          this.address,
          this.additional_information,
          this.host,
          this.country_code,
          this.latitude,
          this.longitude,
          this.organizer_name,
          this.organizer_email,
          this.organizer_phone);
    //   await earthday.createEvent(this.name, this.location);
      await earthday
        .createEvent(
          Date.now().toString(),
          this.event_name,
          this.location,
          this.date,
          this.start_time,
          this.address,
          this.additional_information,
          this.host,
          this.country_code,
          +(this.latitude),
          +(this.longitude),
          this.organizer_name,
          this.organizer_email,
          this.organizer_phone
        )
    $emit('close')
    },
  },
};
</script>

<style>
</style>