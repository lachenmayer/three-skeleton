# Three.js skeleton
Get hacking instantly with Three.js, CoffeeScript, Jade and Stylus.

To hack, download this repository and inside this directory run (assuming you have Node installed):

    npm install -g gulp # you'll only have to do this once
    npm install
    gulp

You'll now have a blank Three.js canvas running on http://localhost:1337/, with LiveReload. (Get the [LiveReload plugin for Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en) to enable this in your browser.)

All your JavaScript or CoffeeScript code goes in `src/js`. The main Three.js render loop is in `src/js/app.coffee`.