varying vec2 vUvs;

void main() {
  gl_FragColor = vec4(vUvs.x, vUvs.y, vUvs.x, 1.0);
}
