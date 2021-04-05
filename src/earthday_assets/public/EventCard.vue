<template>
  <div class="column is-4">
    <div class="card">
      <div class="card-image">
        <figure class="image is-4by3">
          <img
            src="https://picsum.photos/200/300"
            alt="Placeholder image"
          />
        </figure>
      </div>
      <div class="card-content">
        <div class="media">
          <div class="media-content">
            <p class="title is-4">{{ event.name }}</p>
            <p class="subtitle is-6">{{event.host}}</p>
          </div>
        </div>

        <div class="content">
           <p v-if="event.additional_information">
                📜 {{ event.additional_information.substring(0,140) }}
           </p>
          <ul style="list-style: none;margin-left: 0;">
          <li v-if="event.date">
            <span class="emoji">🗓️</span>
            <span>{{event.date}}</span>
          </li>
          <li v-if="event.start_time">
            <span class="emoji">🕰️</span>
            <span><time datetime="event.start_time">{{event.start_time}}</time></span>
          </li>
          <li v-if="event.address">
           <span class="emoji">📍</span>
            <span><a :href="`https://www.google.com/maps?q=${event.lat},${event.long}`" target="_blank">{{event.address}}</a></span>
          </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "EventCard",
  props: ["event"]
};
</script>

<style>
.emoji{
    margin-right: 0.5em;
}
.event_details_list{
    list-style: none;
    margin-left: 0;
}
</style>