package states.stages;

import states.stages.objects.JumbotronDisplay;
import states.stages.objects.ZoomSprite;

class MagicShow extends BaseStage {
    override function create() {
        defaultCamZoom = 1.0;

        var bg:BGSprite = new BGSprite('venue_bg', -1530, -390, 1, 1);
		add(bg);

        var jumbotron:JumbotronDisplay = new JumbotronDisplay(-715, -65, FlxG.camera);
        add(jumbotron);

        var jumbotron:JumbotronDisplay = new JumbotronDisplay(1370, -65, FlxG.camera);
        add(jumbotron);
    }

    override function createPost() {
        var seats:ZoomSprite = new ZoomSprite(-1530, -490, 0.975, 'venue_seats');
        seats.scrollFactor.set(1.25, 1.25);
        seats.zoomMin = 0.5;
        seats.zoomMax = 0.75;
        add(seats);

        var seatsFG:ZoomSprite = new ZoomSprite(-1530, -490, 0.95, 'venue_seats_fg');
        seatsFG.scrollFactor.set(1.5, 1.5);
        seatsFG.zoomMin = 0.4;
        seatsFG.zoomMax = 0.6;
        add(seatsFG);

        var seatsClose:ZoomSprite = new ZoomSprite(-1530, -490, 0.9, 'venue_seats_fg_close');
        seatsClose.scrollFactor.set(2, 2);
        seatsClose.zoomMin = 0.34;
        seatsClose.zoomMax = 0.5;
        add(seatsClose);
    }
}