import * as THREE from "three";

import "./style.css";

class App {
  constructor() {}

  async init() {
    this._renderer = new THREE.WebGLRenderer();
    document.body.appendChild(this._renderer.domElement);

    window.addEventListener(
      "resize",
      () => {
        this._onWindowResize();
      },
      false
    );

    this._scene = new THREE.Scene();

    this._camera = new THREE.OrthographicCamera(0, 1, 1, 0, 0.1, 1000);
    this._camera.position.set(0, 0, 1);

    await this._setupProject();

    this._onWindowResize();
    this._raf();
  }

  async _setupProject() {
    const vsh = await fetch("./shaders/vertex-shader.glsl");
    const fsh = await fetch("./shaders/fragment-shader.glsl");

    const loader = new THREE.TextureLoader();
    const texture1 = loader.load("../textures/cat.jpg");
    texture1.wrapS = THREE.MirroredRepeatWrapping; // THREE.RepeatWrapping // THREE.ClampToEdgeWrapping
    texture1.wrapT = THREE.MirroredRepeatWrapping;
    const texture2 = loader.load("../textures/tart.png");

    const material = new THREE.ShaderMaterial({
      uniforms: {
        diffuse1: { value: texture1 },
        diffuse2: { value: texture2 },
        tint: { value: new THREE.Vector4(1, 0, 1, 1) },
      },
      vertexShader: await vsh.text(),
      fragmentShader: await fsh.text(),
    });

    const geometry = new THREE.PlaneGeometry(1, 1);

    const plane = new THREE.Mesh(geometry, material);
    plane.position.set(0.5, 0.5, 0);
    this._scene.add(plane);

    this._onWindowResize();
  }

  _onWindowResize() {
    this._renderer.setSize(window.innerWidth, window.innerHeight);
  }

  _raf() {
    requestAnimationFrame((t) => {
      this._renderer.render(this._scene, this._camera);
      this._raf();
    });
  }
}

window.addEventListener("DOMContentLoaded", async () => {
  const app = new App();
  await app.init();
});
