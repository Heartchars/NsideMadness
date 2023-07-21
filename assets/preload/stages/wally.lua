function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'pico-p1')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'picoDie'); 
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'picoGameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'picoGameoverEnd');

    makeLuaSprite('bg', 'backwally', -600, -200);
    addLuaSprite('bg', false);

end
