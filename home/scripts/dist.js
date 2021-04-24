#!/usr/bin/node

const http = require('http')
const hass_token = process.env.HASS_TOKEN;
const coords = process.env.HOME_COORDS.split(",");
const home_lat = coords[0];
const home_long = coords[1];

const options = {
  host: 'hass.local',
  port: 8123,
  path: '/api/states/device_tracker.busch_iphone',
  headers: {
    'Authorization': 'Bearer ' + hass_token,
    'Content-Type': 'application/json'
  }
}

function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
  const R = 6371; // Radius of the earth in km
  const dLat = deg2rad(lat2-lat1);  // deg2rad below
  const dLon = deg2rad(lon2-lon1);
  const a =
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
    Math.sin(dLon/2) * Math.sin(dLon/2)
    ; 
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  const d = R * c; // Distance in km
  return d;
}

function deg2rad(deg) {
  return deg * (Math.PI/180)
}

http.get(options, (res) => {
  let data = ''

  res.on('data', (chunk) => {
    data += chunk
  })

  res.on('close', () => {
    let dict = JSON.parse(data)
    let lat = dict.attributes.latitude
    let long = dict.attributes.longitude
    let state = dict.state
    let distance = getDistanceFromLatLonInKm(lat, long, home_lat, home_long) * 1000

    console.log(Math.round(distance) + 'm (' + state + ')')
  })
})
