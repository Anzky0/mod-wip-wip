package shaders;

class JumbotronBloom extends flixel.system.FlxAssets.FlxShader {
    @:glFragmentSource("#pragma header

    void main() {
        gl_FragColor = texture2D(bitmap, openfl_TextureCoordv);
        vec2 uv = openfl_TextureCoordv - vec2(0.5);
        float dist = distance(uv * uv * uv * uv, vec2(0.0)) * 7.0;
        gl_FragColor.rgb *= (1.0 - min(dist, 1.0)) * 1.25;
    }")

    public function new() {
        super();
    }
}