THREE = require './lib/threejs/build/three.js'
THREE.PointerLockControls = require './lib/PointerLockControls.js'
$ = require './lib/jquery/dist/jquery.js'

Crystals = require './crystals'
{v2, v3} = require './util'

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

  crystals = new Crystals v2(0, 0), 11, 11, 30, 220
  crystals.addToScene scene

  light = new THREE.AmbientLight 0xffffff
  scene.add light

  controls = new THREE.PointerLockControls camera
  scene.add controls.getObject()
  controls.enabled = true

  tick = 0
  startTime = time = Date.now()
  render = ->
    controls.update Date.now() - time
    crystals.bob time - startTime
    renderer.render scene, camera
    time = Date.now()
    window.requestAnimationFrame render
  window.requestAnimationFrame render

  container.append(renderer.domElement)

  $(renderer.domElement).click ->
    console.log 'click'
    renderer.domElement.webkitRequestPointerLock()
    document.addEventListener('webkitpointerlockchange', ((e) -> console.log e), false)
