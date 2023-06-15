import { Controller } from "@hotwired/stimulus"

import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {

  static targets = ["map"]

  static values = {
    apiKey: String,
    markers: Array,
    currentUser: Object,
  }

  connect() {
    console.log("Hello from the map controller 🫣");
    const userLocation = JSON.parse(this.data.get("userLocation"));

    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/jlgrobe/cjnpu54rp0h222srxnr5awqoz",
      center: [userLocation.longitude, userLocation.latitude],
      zoom: 12,
    });
    this.#addMarkersToMap();
    this.#adduserMarkerToMap();
    // this.#fitMapToMarkers();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      const customMarker = document.createElement("div");
      customMarker.innerHTML = marker.marker_html;

      new mapboxgl.Marker(customMarker)
        .setPopup(popup)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  #adduserMarkerToMap() {
    const userLocation = JSON.parse(this.data.get("userLocation"));

    if (userLocation) {
      const userMarker = document.createElement("div");
      userMarker.innerHTML = userLocation.usermarker_html;

      new mapboxgl.Marker(userMarker)
        .setLngLat([userLocation.longitude, userLocation.latitude])
        .addTo(this.map);
    }
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 16, duration: 0 });
  }
}
