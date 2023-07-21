function onCreate()
	makeLuaSprite('bg', 'ourple/freeplaywall', 0, 0)
	setScrollFactor('bg', 1, 1);
	addLuaSprite('bg')
      setProperty('bg.antialiasing', false)

	makeLuaSprite('arcade0', 'ourple/machines/tutorial', 710, 160)
	setScrollFactor('arcade0', 1, 1);
	addLuaSprite('arcade0')
      setProperty('arcade0.antialiasing', false)
      setProperty('arcade0.alpha', 0.5)

	makeLuaSprite('arcade1', 'ourple/machines/bopeebo', 1000, 160)
	setScrollFactor('arcade1', 1, 1);
	addLuaSprite('arcade1')
      setProperty('arcade1.antialiasing', false)

	makeLuaSprite('arcade2', 'ourple/machines/pico', -40, 160)
	setScrollFactor('arcade2', 1, 1);
	addLuaSprite('arcade2')
      setProperty('arcade2.antialiasing', false)
      setProperty('arcade2.alpha', 0.5)

	makeAnimatedLuaSprite('arrowR', 'ourple/arrow', 630, 350)
	setLuaSpriteScrollFactor('arrowR', 1, 1);
	addAnimationByPrefix('arrowR', 'arrow', 'arrow', 12, true)
	objectPlayAnimation('arrowR', ' arrow', true)
	addLuaSprite('arrowR', true);
      setProperty('arrowR.antialiasing', false)

	makeAnimatedLuaSprite('arrowL', 'ourple/arrow', 240, 350)
	setLuaSpriteScrollFactor('arrowL', 1, 1);
	addAnimationByPrefix('arrowL', 'arrow', 'arrow', 12, true)
	objectPlayAnimation('arrowL', ' arrow', true)
	addLuaSprite('arrowL', true);
      setProperty('arrowL.antialiasing', false)
      setProperty('arrowL.flipX', true)

	makeAnimatedLuaSprite('pressL', 'ourple/press', 230, 360)
	setLuaSpriteScrollFactor('pressL', 1, 1);
	addAnimationByPrefix('pressL', 'press', 'press', 12, true)
	objectPlayAnimation('pressL', ' press', true)
	addLuaSprite('pressL', true);
      setProperty('pressL.antialiasing', false)
      setProperty('pressL.flipX', true)
      setProperty('pressL.visible', false)

	makeAnimatedLuaSprite('pressR', 'ourple/press', 620, 360)
	setLuaSpriteScrollFactor('pressR', 1, 1);
	addAnimationByPrefix('pressR', 'press', 'press', 12, true)
	objectPlayAnimation('pressR', ' press', true)
	addLuaSprite('pressR', true);
      setProperty('pressR.antialiasing', false)
      setProperty('pressR.visible', false)

	makeLuaSprite('read', 'ourple/freeplaywelcome', 293, 320)
	setScrollFactor('read', 1, 1);
      scaleObject('read', 0.3, 0.3);
	addLuaSprite('read')
      setProperty('read.antialiasing', false)

	makeLuaSprite('blind', 'ourple/blind', 0, 0)
	setScrollFactor('blind', 1, 1);
	addLuaSprite('blind')

	makeLuaSprite('controls', 'ourple/controls', -69, -148)
	setScrollFactor('controls', 1, 1);
	addLuaSprite('controls')
      setProperty('controls.antialiasing', false)
end

function onCreatePost()
	setProperty('timeTxt.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('boyfriend.visible', false)
	setProperty('gf.visible', false)
	setProperty('dad.visible', false)
end

function onUpdate(elapsed)
    if keyPressed('left') then
      setProperty('pressL.visible', true)
      setProperty('arrowL.visible', false)
    else
      setProperty('pressL.visible', false)
      setProperty('arrowL.visible', true)

    if keyPressed('right') then
      setProperty('pressR.visible', true)
      setProperty('arrowR.visible', false)
    else
      setProperty('pressR.visible', false)
      setProperty('arrowR.visible', true)
end
end
end