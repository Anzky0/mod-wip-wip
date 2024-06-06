package states.stages.objects;

import openfl.geom.Matrix;

class JumbotronDisplay extends FlxSprite {
	var updateTmr:Float = 0.0;
	static var camTransform:Matrix = new Matrix();
	public var cameraToDraw(default, set):FlxCamera;

	public function new(x:Float, y:Float, cam:FlxCamera) {
		super(x, y);
		cameraToDraw = cam;
		if (ClientPrefs.data.shaders)
			shader = new shaders.JumbotronBloom();
	}

	override function update(elapsed:Float) {
		updateTmr += elapsed;
		if (updateTmr < ClientPrefs.data.jumboUpdate || ClientPrefs.data.lowQuality) return;
		updateTmr = 0;

		camTransform.setTo(1, 0, 0, 1, camera.width * -0.25, camera.height * -0.25);
		camTransform.scale(0.75, 0.75);
		pixels.draw(cameraToDraw.canvas, camTransform);
	}

	function set_cameraToDraw(cam:FlxCamera) {
		if (cam == cameraToDraw) return cam;

		makeGraphic(Math.floor(cam.width * 0.5), Math.floor(cam.height * 0.5));
		return cameraToDraw = cam;
	}
}