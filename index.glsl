#pragma glslify: luma = require('glsl-luma')

float character(float n, vec2 p) {
  p = floor(p*vec2(4.0, -4.0) + 2.5);
  if (clamp(p.x, 0.0, 4.0) == p.x && clamp(p.y, 0.0, 4.0) == p.y){
    if (int(mod(n/exp2(p.x + 5.0*p.y), 2.0)) == 1) return 1.0;
  }
  return 0.0;
}

float asciiFilter(vec3 color, vec2 uv, float pixelSize) {
  float threshold = luma(color);
  float n =  65536.0;                  // .
  if (threshold > 0.2) n = 65600.0;    // :
  if (threshold > 0.3) n = 332772.0;   // *
  if (threshold > 0.4) n = 15255086.0; // o
  if (threshold > 0.5) n = 23385164.0; // &
  if (threshold > 0.6) n = 15252014.0; // 8
  if (threshold > 0.7) n = 13199452.0; // @
  if (threshold > 0.8) n = 11512810.0; // #
  vec2 p = mod( uv / ( pixelSize * 0.5 ), 2.0) - vec2(1.0);
  return character(n, p);
}

float asciiFilter(vec3 color, vec2 uv) {
  return asciiFilter(color, uv, 1.0 / 25.0);
}

#pragma glslify: export(asciiFilter)