in vec2 vUv;

uniform sampler2D diffuse;
uniform vec4 tint;

vec2 repeat(vec2 uv, float factor) {
  return fract(uv * factor);
}

void main() {
  vec4 color = texture2D(diffuse, vec2(1.0 - vUv.x, vUv.y));
  gl_FragColor = color * tint;
}
