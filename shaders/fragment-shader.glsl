in vec2 vUv;

uniform sampler2D diffuse1;
uniform sampler2D diffuse2;
uniform vec4 tint;

vec2 repeat(vec2 uv, float factor) {
  return fract(uv * factor);
}

void main() {
  vec2 uv1 = vUv * 2.0;
  vec2 uv2 = (vUv - 0.5) * 2.5 + 0.5;
  vec4 color1 = texture2D(diffuse1, uv1);
  vec4 color2 = texture2D(diffuse2, uv2);
  if (uv2.x < 0.0 || uv2.x > 1.0 || uv2.y < 0.0 || uv2.y > 1.0) {
    gl_FragColor = color1;
    return;
  }
  gl_FragColor = mix(color1, color2, color2.a);
}
