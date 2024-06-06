// TEMPORARY! REMOVE LATER!

function onUpdate(elapsed) {
    FlxG.camera.zoom += elapsed * (FlxG.keys.pressed.E - FlxG.keys.pressed.Q);
    game.defaultCamZoom += elapsed * (FlxG.keys.pressed.E - FlxG.keys.pressed.Q);
}