varying vec2 vUvs;

uniform vec4 color1;
uniform vec4 color2;

void main() {
  /* mix is just lerp */
  gl_FragColor = mix(color1, color2, vUvs.x);
}
