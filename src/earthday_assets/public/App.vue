<template>
  <v-app>
    <div class="container">
      <section class="hero">
        <div class="hero-body">
          <p class="title">EarthDay cleanups</p>
          <p class="subtitle">
            Connect with your local community and preserve the environement
          </p>
        </div>
      </section>
      <section>
        <div class="row columns">
          <div class="row column is-four-fifths">
            <input
              type="text"
              class="input"
              name="searchBox"
              placeholder="Search for events"
              v-model="searchBox"
            />
          </div>
          <div class="column">
            <button class="button" v-on:click="findAroundMe">🔎</button>
            <button class="button" v-on:click="getEvents">🔁</button>
            <button class="button" v-on:click="showModal">➕</button>
          </div>
        </div>
        <div v-if="searchTerm" class="columns">
          <div class="column">
            <p>
              {{ nonUndefinedEvents.length }} events found for term
              <b>{{ searchTerm }}</b>
            </p>
          </div>
        </div>
        <div class="row columns is-multiline">
          <div v-if="!nonUndefinedEvents.length">No event found 😢</div>
          <EventCard
            v-for="event in nonUndefinedEvents"
            v-bind:event="event"
            v-bind:key="event.id"
          ></EventCard>
        </div>
      </section>
    </div>
    <b-modal>
      <template #default="props">
        <button @click="props.close">close</button>
      </template>
    </b-modal>
  </v-app>
</template>

<script>
import earthday from "ic:canisters/earthday";
import EventCard from "./EventCard.vue";
import AddEventModal from "./AddEventModal.vue";

export default {
  data: () => {
    return {
      events: [],
      searchTerm: ""
    };
  },
  created() {
    earthday.getEvents().then((events) => {
      this.events = events;
    });
  },
  computed: {
    nonUndefinedEvents() {
      return this.events.filter((c) => c && typeof c.name != "undefined");
    },
  },
  methods: {
    async handleSubmit() {
      console.log("handleSubmit", this);
      await earthday.createEvent(this.name, this.location);
      getEvents();
    },
    async getEvents() {
      this.searchTerm = ""; //reset
      let events = await earthday.getEvents();
      console.log("getEvents", events);
      this.events = events;
    },
    async findAroundMe() {
      let events = await earthday.findEvent(this.searchBox);
      this.searchTerm = this.searchBox;
      console.log("events found", events);
      this.events = events;

      //find by distance
      // let events = await earthday.findByDistance(
      //   37.773972,
      //   -122.431297,
      //   200
      // );
    },
    showModal() {
      this.$buefy.modal.open({
          parent: this,
          component: AddEventModal,
          hasModalCard: true,
          customClass: 'custom-class custom-class-2',
          trapFocus: true
      })
    },
  },
  components: {
    EventCard
  },
};
</script>
