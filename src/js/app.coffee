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
  #camera.position.y = 200


  light = new THREE.AmbientLight 0xffffff
  scene.add light

  tick = 0
  startTime = time = Date.now()
  render = ->
    renderer.render scene, camera
    window.requestAnimationFrame render
  window.requestAnimationFrame render

  container.append(renderer.domElement)

  $(renderer.domElement).click ->
    console.log 'click'
    renderer.domElement.webkitRequestPointerLock()
    document.addEventListener('webkitpointerlockchange', ((e) -> console.log e), false)
