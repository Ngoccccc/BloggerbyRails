import { Controller } from "@hotwired/stimulus";
import * as THREE from "three";
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

// Nếu sau này cần RapierJS cho physics: import thêm ở đây

export default class extends Controller {
  static targets = ["canvas"];

  connect() {
    this.initThree();
    this.loadModel();
    this.animate();
    window.addEventListener("resize", this.onWindowResize.bind(this));
  }

  disconnect() {
    window.removeEventListener("resize", this.onWindowResize.bind(this));
    cancelAnimationFrame(this.animationId);
  }

  initThree() {
    this.scene = new THREE.Scene();
    this.scene.background = new THREE.Color(0xf0f0f0);

    this.camera = new THREE.PerspectiveCamera(
      75,
      this.canvasTarget.clientWidth / this.canvasTarget.clientHeight,
      0.1,
      1000
    );
    this.camera.position.z = 3;

    this.renderer = new THREE.WebGLRenderer({
      canvas: this.canvasTarget,
      antialias: true,
      alpha: true,
    });
    this.renderer.setSize(
      this.canvasTarget.clientWidth,
      this.canvasTarget.clientHeight
    );

    const ambientLight = new THREE.AmbientLight(0xffffff, 1);
    this.scene.add(ambientLight);

    this.controls = new OrbitControls(this.camera, this.renderer.domElement);
    this.controls.enableDamping = true;
    this.controls.dampingFactor = 0.05;
    this.controls.enableZoom = false;
  }

  loadModel() {
    const loader = new GLTFLoader();
    loader.load(
      "/assets/kartu.glb",
      (gltf) => {
        this.card = gltf.scene;
        this.scene.add(this.card);
      },
      undefined,
      function (error) {
        console.error("Error loading GLTF model:", error);
      }
    );
  }

  animate = () => {
    this.animationId = requestAnimationFrame(this.animate);

    if (this.card) {
      this.card.rotation.y += 0.01;
    }

    this.controls.update();
    this.renderer.render(this.scene, this.camera);
  };

  onWindowResize() {
    this.camera.aspect =
      this.canvasTarget.clientWidth / this.canvasTarget.clientHeight;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(
      this.canvasTarget.clientWidth,
      this.canvasTarget.clientHeight
    );
  }
}
