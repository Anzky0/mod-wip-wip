package states.stages.objects;

import flixel.graphics.frames.FlxFrame.FlxFrameAngle;

class ZoomSprite extends FlxSprite {
    public var zoomFactor:Float = 1.0;
    public var zoomMin:Float = 0.25;
    public var zoomMax:Float = 0.5;

    public function new(x:Float, y:Float, zoomFactor:Float, ?path:String) {
        var tex = (path != null) ? Paths.image(path) : null;
        this.zoomFactor = zoomFactor;
        super(x, y, tex);
    }

	override function drawComplex(camera:FlxCamera):Void {
		_frame.prepareMatrix(_matrix, FlxFrameAngle.ANGLE_0, checkFlipX(), checkFlipY());
		_matrix.translate(-origin.x, -origin.y);
		_matrix.scale(scale.x, scale.y);

		if (bakedRotationAngle <= 0) {
			updateTrig();

			if (angle != 0)
				_matrix.rotateWithTrig(_cosAngle, _sinAngle);
		}

		getScreenPosition(_point, camera).subtractPoint(offset);
		_point.add(origin.x, origin.y);
		_matrix.translate(_point.x, _point.y);

		if (isPixelPerfectRender(camera)) {
			_matrix.tx = Math.floor(_matrix.tx);
			_matrix.ty = Math.floor(_matrix.ty);
		}

        // SHhhhhhhhhhhhhh.... dont tell codename. i hid takis netflix popcorn inside the mirror
		_matrix.translate(-camera.width * 0.5, -camera.height * 0.5);
        var zoom = FlxMath.lerp(1, camera.zoom, zoomFactor);
		var mult = zoom / camera.zoom;
		_matrix.scale(mult, mult);
		_matrix.translate(camera.width * 0.5, camera.height * 0.5);

        var ogAlpha = colorTransform.alphaMultiplier;
        colorTransform.alphaMultiplier *= FlxMath.bound(FlxMath.remapToRange(zoom, zoomMin, zoomMax, 1, 0), 0, 1);

		camera.drawPixels(_frame, framePixels, _matrix, colorTransform, blend, antialiasing, shader);
        colorTransform.alphaMultiplier = ogAlpha;
	}
}