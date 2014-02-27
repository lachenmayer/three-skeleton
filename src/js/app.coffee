THREE = require './lib/threejs/build/three.js'
$ = require './lib/jquery/dist/jquery.js'

screenSize = [window.innerWidth, window.innerHeight]

viewAngle = 45
aspect = screenSize[0] / screenSize[1]
near = 0.1
far = 10000

$ ->
  container = $ '.container'

  renderer = new THREE.WebGLRenderer()
  camera = new THREE.PerspectiveCamera viewAngle, aspect, near, far
  renderer.setSize(screenSize...)

  scene = new THREE.Scene()
  scene.add camera

  camera.position.z = 500

  light = new THREE.AmbientLight 0xffffff
  scene.add light

  render = ->
    ###
    # Render code goes here
    ###

    renderer.render scene, camera
    window.requestAnimationFrame render
  window.requestAnimationFrame render

  container.append(renderer.domElement)

  ###
  # Uncomment below to hide the mouse cursor when you click. (Chrome only)
  ###
  #$(renderer.domElement).click ->
  #  renderer.domElement.webkitRequestPointerLock()
