# EarthDay Cleanup Events

A website to find cleanup events around you for Earth Day.
Powered by decentralized internet!

# Test locally

1. clone repo

2. `yarn install`

3. `dfx start`

4. `dfx deploy`

5. Open `http://127.0.0.1:8000/?canisterId={canisterId}`

# Stack
Vue, thanks to [@nop33's boilerplate](https://github.com/nop33/dfinity-vue)
[buefy](https://buefy.org/) for UI framework

# Data source
Data extracted from: https://cleanup.earthday.org/

Found the [Arcgis endpoint](https://services5.arcgis.com/cy2zIylXXizcsMCw/arcgis/rest/services/survey123_dad531ff74b443c59a47e969875b502c_stakeholder/FeatureServer/0/query?f=json&where=approved%20%3D%20%27yes%27&returnGeometry=true&spatialRel=esriSpatialRelIntersects&outFields=*&maxRecordCountFactor=4&outSR=102100&resultOffset=0&resultRecordCount=8000&cacheHint=true&quantizationParameters=%7B%22mode%22%3A%22view%22%2C%22originPosition%22%3A%22upperLeft%22%2C%22tolerance%22%3A1.0583354500042335%2C%22extent%22%3A%7B%22xmin%22%3A-1800244.8901729973%2C%22ymin%22%3A-90%2C%22xmax%22%3A180%2C%22ymax%22%3A5076149.369044887%2C%22spatialReference%22%3A%7B%22wkid%22%3A4326%2C%22latestWkid%22%3A4326%7D%7D%7D
) to extract all the data points

Reconstruct a nice JSON object `scripts/event.json`

```js
features.map((f) =>{
 return {
   id: f.attributes.globalid,
   organizer: {
    name: f.attributes.first_name_ + f.attributes.last_name_,
    phone: f.attributes.phone_number_of_organizer_,
    email: f.attributes.email_address_of_organizer
   },
   name: f.attributes.cleanup_event_name_,
   location: f.attributes.cleanup_location_name_,
   date: f.attributes.cleanup_date_,
   start_time: f.attributes.start_time,
   address: f.attributes.cleanup_address,
   additional_information: f.attributes.additional_information_,
   host: f.attributes.host_of_the_cleanup,
   country_code: f.attributes.country_code,
   geometry: f.geometry
 }
})
```

# Improvement
- Seed app with data points
- Show data points on a map
- Search by distance (findByDistance in `main.mo`)