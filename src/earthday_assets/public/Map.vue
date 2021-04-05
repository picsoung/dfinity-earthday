<template>
  <MglMap :accessToken="accessToken" :mapStyle="mapStyle" />
</template>

<script>
import Mapbox from "mapbox-gl";
import { MglMap } from "vue-mapbox";

export default {
name: 'Map',
  components: {
    MglMap
  },
  data() {
    return {
      accessToken: 'pk.eyJ1IjoicGljc291bmciLCJhIjoiY2tuNDBoeXMzMDM0ZjJvcGh1bXVwOWNpdSJ9.u0gkPk16WrqN_f8lWGDYMQ', // your access token. Needed if you using Mapbox maps
      mapStyle: 'mapbox://styles/mapbox/streets-v11' // your map style
    };
  },

  created() {
    // We need to set mapbox-gl library here in order to use it in template
    this.mapbox = Mapbox;
  }
};
</script>