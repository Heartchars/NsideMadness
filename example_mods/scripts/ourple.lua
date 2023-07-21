------------------SETTINGS

local SongOne = 'tutorial'           -------Name of the Song One
local SongTwo = 'bopeebo'            -------Name of the Song Two
local SongThree = 'pico'            -------Name of the Song Three

------------------

currentSelected = 0

local CanSelect = false

function onCreate()
	initSaveData('DataWait', 'Wait')
	flushSaveData('DataWait')
	WaitAnoun = getDataFromSave('DataWait', 'Wait')

	if songName == 'Machine' then
		function onStartCountdown() 
			if not allowCountdown then
				return Function_Stop
			end
		
			if allowCountdown then
				return Function_Continue
			end
            end

      playMusic('ourple', 0.8, true)

      runTimer('Wait', 3, 1)

      end
end

function onUpdate()
	if songName == 'Machine' then
              if keyJustPressed('pause') then
			exitMenu()
              end

		if keyboardJustPressed('SPACE') then
				playSound('play');
		end

		if WaitAnoun == 'Wait' then
			WaitAnoun = 0
		end

				if keyboardJustPressed('RIGHT') and songName == 'Machine' and CanSelect == true then
					currentSelected = currentSelected + 1
			 elseif currentSelected > 4 then
					currentSelected = 3
			  end
			 if keyboardJustPressed('LEFT') and songName == 'Machine' and CanSelect == true then
					currentSelected = currentSelected - 1
			 elseif currentSelected == 0 then
					currentSelected = 1
			  end

			if currentSelected == 1 then
	                  doTweenX('Move0', 'arcade0', 335, 0.5, 'linear')
                        setProperty('arcade2.visible', false)
                        setProperty('arcade1.x', 710)
                        setProperty('arcade0.alpha', 1)
                        setProperty('arcade1.alpha', 0.5)
                        setProperty('arcade2.alpha', 0.5)
                  elseif currentSelected == 2 then
	                  doTweenX('Move1', 'arcade1', 335, 0.5, 'linear')
					  setProperty('arcade0.visible', true)
					  setProperty('arcade2.visible', true)
                        setProperty('arcade0.x', -40)
                        setProperty('arcade2.x', 710)
                        setProperty('arcade0.alpha', 0.5)
                        setProperty('arcade1.alpha', 1)
                        setProperty('arcade2.alpha', 0.5)
                  elseif currentSelected == 3 then
	                  doTweenX('Move2', 'arcade2', 335, 0.5, 'linear')
                        setProperty('arcade1.x', -40)
                        setProperty('arcade0.visible', false)
                        setProperty('arcade0.alpha', 0.5)
                        setProperty('arcade1.alpha', 0.5)
                        setProperty('arcade2.alpha', 1)
			end
			playSound(null);
		end
		if currentSelected == 1 and keyboardJustPressed('SPACE') and songName == 'Machine' then
                    loadSong(SongOne);
            elseif currentSelected == 2 and keyboardJustPressed('SPACE') and songName == 'Machine' then
                    loadSong(SongTwo);
            elseif currentSelected == 3 and keyboardJustPressed('SPACE') and songName == 'Machine' then
                    loadSong(SongThree);
		      end

            if WaitAnoun == 1 then
              CanSelect = true
			  setProperty('read.visible', false)
			end
       end

function onTimerCompleted(tag, loops, loopsLeft)
	if keyJustPressed('pause') and songName == 'Machine' then
		exitMenu();
	end
end

function exitMenu()
	setDataFromSave('DataWait', 'Wait', WaitAnoun)
	exitSong(true);
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Wait' and CanSelect == false then
          CanSelect = true
		  WaitAnoun = WaitAnoun + 1
		  setDataFromSave('DataWait', 'Wait', WaitAnoun)
	    doTweenAlpha('DisText', 'read', 0, 0.5, 'CircInOut')
	end
end