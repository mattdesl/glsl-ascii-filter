# glsl-ascii-filter

[![stable](http://badges.github.io/stability-badges/dist/stable.svg)](http://github.com/badges/stability-badges)

![ascii](http://i.imgur.com/PdUNMwF.png)

A simple ASCII post-processing effect in GLSL, [original here](https://www.shadertoy.com/view/lssGDj) by @movAX13h. 

```glsl
void main() {
  vec4 color = texture2D(u_sampler, uv);

  //aspect-corrected screen UVs
  vec2 st = uv;
  st.x *= iResolution.x / iResolution.y;
  
  //apply filter
  gl_FragColor.rgb = color.rgb * asciiFilter(color.rgb, uv);
  gl_FragColor.a = color.a;
}
```

Best rendered with retina scaling for crisp edges.

## Usage

[![NPM](https://nodei.co/npm/glsl-ascii-filter.png)](https://www.npmjs.com/package/glsl-ascii-filter)

#### `float asciiFilter(vec3 color, vec2 uv[, float pixelSize])`

Applies an ASCII-like filter to the given pixel `color` based on the current screen `uv` texcoords. The `pixelSize` (defaults to `0.04`) can be used to scale the characters. 

## License

MIT, see [LICENSE.md](http://github.com/mattdesl/glsl-ascii-filter/blob/master/LICENSE.md) for details.
