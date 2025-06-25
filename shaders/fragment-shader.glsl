in vec2 vUv;

uniform sampler2D diffuse1;
uniform sampler2D diffuse2;
uniform vec4 tint;

vec2 repeat(vec2 uv, float factor) {
  return fract(uv * factor);
}

void main() {
  vec2 uv1 = vUv / 20.0 + 0.1;
  vec4 color1 = texture2D(diffuse1, uv1);
  gl_FragColor = color1;
}
