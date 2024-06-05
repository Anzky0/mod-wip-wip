package states.stages;

import backend.PsychCamera;
import states.stages.objects.JumbotronDisplay;

class JumbotronTest extends BaseStage {
    override function create() {
        defaultCamZoom = 0.4;

        var bg:BGSprite = new BGSprite('stageback', -600, -200, 0.9, 0.9);
        //bg.cameras.push(funnyCam);
		add(bg);

		var stageFront:BGSprite = new BGSprite('stagefront', -650, 600, 0.9, 0.9);
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
        //stageFront.cameras.push(funnyCam);
		stageFront.updateHitbox();
		add(stageFront);
		if(!ClientPrefs.data.lowQuality) {
			var stageLight:BGSprite = new BGSprite('stage_light', -125, -100, 0.9, 0.9);
			stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
            //stageLight.cameras.push(funnyCam);
			stageLight.updateHitbox();
			add(stageLight);
			var stageLight:BGSprite = new BGSprite('stage_light', 1225, -100, 0.9, 0.9);
			stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
            //stageLight.cameras.push(funnyCam);
			stageLight.updateHitbox();
			stageLight.flipX = true;
			add(stageLight);

			var stageCurtains:BGSprite = new BGSprite('stagecurtains', -500, -300, 1.3, 1.3);
			stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
            //stageCurtains.cameras.push(funnyCam);
			stageCurtains.updateHitbox();
			add(stageCurtains);
		}

		var jumbotronDisplay = new JumbotronDisplay(-1000, -300, FlxG.camera);
		jumbotronDisplay.scale.scale(1.5);
		add(jumbotronDisplay);

		var jumbotronDisplay = new JumbotronDisplay(1750, -300, FlxG.camera);
		jumbotronDisplay.scale.scale(1.5);
		add(jumbotronDisplay);
    }
}