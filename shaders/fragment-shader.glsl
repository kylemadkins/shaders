in vec2 vUv;

uniform sampler2D diffuse1;
uniform sampler2D diffuse2;
uniform vec4 tint;

vec2 repeat(vec2 uv, float factor) {
  return fract(uv * factor);
}

void main() {
  vec4 color1 = texture2D(diffuse1, repeat(vUv, 3.0));
  vec4 color2 = texture2D(diffuse2, repeat(vUv, 3.0));
  gl_FragColor = mix(color1, color2, color2.a) * vec4(vUv.y * tint.r, vUv.x * tint.g, tint.b, 1.0);
}
