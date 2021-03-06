import "bootstrap";
import "../plugins/flatpickr"

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { fetch_position } from '../lib/fetch_position';
import { delete_alert } from '../lib/delete_alert'

initMapbox();
initAutocomplete();
fetch_position();
delete_alert();
