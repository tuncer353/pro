name = "4 badge"
author = "tuncer"
description = [[4 badge!   first 3 poke for leveling , 4. poke must be run away rattata.   U must have these 4 poke before use this script
  u can countinue everywhere until 4. badge. Just go pokecenter and play code. U should change mission true falses
  leveling auto, if u lose it raise level end try again auto
]]

city = "Pokecenter Pewter"

fosil= "dome"    --helix or dome
celadonlevel = 32
ceruleanlevel = 22
vermilionlevel = 28
pewterLevel = 18

-- mission
step=1
getFosil = true
isTicketGet=true
leveling = false 
swapped = false
ceruteanRozet=true
vermilionRozet=false
celadonRozet=false
ssAnne=true
rockedTeam=false
rockedRetry =true
pewterRozet =false

--Vermilion gym settings
SWITCHES_START_X = 2
SWITCHES_START_Y = 13
SWITCHES_END_X = 10
SWITCHES_END_Y = 17

firstSwitchFound = false
firstSwitchActivated = false
firstSwitchX = 0
firstSwitchY = 0
currentSwitchX = SWITCHES_START_X
currentSwitchY = SWITCHES_START_Y

function onStart()

    getFosil= hasItem("Dome Fossil") or hasItem("Helix Fossil")
    city = getMapName()
    ceruteanRozet = hasItem("Cascade Badge")
    ssAnne = hasItem("HM01 - Cut")
    vermilionRozet = hasItem("Thunder Badge")
    rockedTeam = hasItem("Silph Scope")
    celadonRozet= hasItem("Rainbow Badge")
    pewterRozet= hasItem("Boulder Badge")
    step=1


end


function onPathAction()
  ilk4()
end

function onBattleAction()
  if isWildBattle() and isOpponentShiny() then
    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run()
  elseif isWildBattle() and (getActivePokemonNumber() == 1 or getActivePokemonNumber() == 2 or getActivePokemonNumber() == 3) and leveling==true then
    return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
  else
    return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
  end
end

function ilk4( )
  if city == "Pokecenter Pewter" or city == "Pokecenter Route 3" then
    if leveling == false then
      if pewterRozet ==false then
        getPewterRozet()
      else
        pewterToCerulean()
      end
    else
      levelingPewter()
    end
  elseif city == "Pokecenter Viridian" then
    viridianToPewter()
  elseif city == "Pokecenter Cerulean" then
    if leveling == false then
      if isTicketGet==false then
        getSSAnneTicked()
      elseif ceruteanRozet==false then
        getCeruleanRozet()
      else
        ceruleanToVermilion()
      end
    else
      levelingCerulean()
    end
  elseif city == "Pokecenter Vermilion" then
    if leveling == false then
      if ssAnne ==false then
        ssAnneMission()
      elseif vermilionRozet == false then
        getVermilionRozet()
      else
        vermilionToCeladon()
      end
    else
      levelingVermilion()
    end
  elseif city == "Pokecenter Celadon" then
    if leveling == false then
      if rockedTeam == false then
        rockedHideout()
      elseif celadonRozet == false then
        getCeladonRozet()
      end
    else
       levelingCeladon()
    end
  end
end

function viridianToPewter()
  if getMapName() == "Pokecenter Viridian" then
    moveToMap("Viridian City")
  elseif getMapName() == "Viridian City" then
    step=step+2
    moveToMap("Route 2")
  elseif getMapName() == "Route 2" then
    if step==1 or step ==2 then
      moveToMap("Pewter City")
    else
      moveToMap("Route 2 Stop")
    end
  elseif getMapName() == "Route 2 Stop" then
    step=1
    moveToMap("Viridian Forest")
  elseif getMapName() == "Viridian Forest" then
    moveToMap("Route 2 Stop2")
  elseif getMapName() == "Route 2 Stop2" then
    moveToMap("Route 2")
  elseif getMapName() == "Pewter City" then
    moveToMap("Pokecenter Pewter")
  elseif getMapName() == "Pokecenter Pewter" then
    usePokecenter()
    city = "Pokecenter Pewter"
    leveling=true
  end
end

function pewterToCerulean( )
  if getMapName() == "Pokecenter Pewter" then
    moveToMap("Pewter City")
  elseif getMapName() == "Pewter City" then
    moveToMap("Route 3")
  elseif getMapName() == "Pokecenter Route 3" then
    moveToMap("Route 3")
  elseif getMapName() == "Route 3" then
    moveToMap("Mt. Moon 1F")
  elseif getMapName() == "Mt. Moon 1F" then
    if step==1 then
        moveToCell(21,20)
    end
  elseif getMapName() == "Mt. Moon B1F" then
    if step==1 then
      if getPlayerX()!= 57 and getPlayerY()!=34 then
          moveToCell(57,34)
      else      
          moveToCell(56,34)
      end
    else
      moveToMap("Mt. Moon Exit")
    end
  elseif getMapName() == "Mt. Moon B2F"then
    if isNpcOnCell(25, 29)  then
        if getFosil==false then
            if getPlayerX() !=24   and getPlayerY()!=31   then
                moveToCell(24,31)
            else
                
                talkToNpcOnCell(23, 31)
                if step ==3 then
                  getFosil=true
                end
                step = step+1
            end
        elseif fosil == "helix" then
            talkToNpcOnCell(25, 29)
        elseif fosil == "dome" then
            talkToNpcOnCell(26, 29)
        end
    else
        if isNpcOnCell(26, 23) then
            talkToNpcOnCell(26,23)
        else
            step = 4
            moveToCell(17,27)
        end
    end
  elseif getMapName() == "Mt. Moon Exit"  then
    moveToMap("Route 4")
  elseif getMapName() == "Route 4" then
    moveToMap("Cerulean City")
  elseif getMapName() == "Cerulean City" then
    moveToMap("Pokecenter Cerulean")
  elseif getMapName() == "Pokecenter Cerulean" then
--    log("step " .. step)
    if step==4 then
      usePokecenter()
      step=step+1
    elseif step==5 then
      usePokecenter()
      city = "Pokecenter Cerulean"
      step=1
    end
  elseif getMapName() == "Route 3" then
    moveToMap("Mt. Moon 1F")
  end
end

function levelingPewter( )
  if (isPokemonUsable(1) ) and step==1 then
    changePoke(pewterLevel)
    if swapped!= true then
      if getMapName() == "Pokecenter Pewter" then
        moveToMap("Pewter City")
      elseif getMapName() == "Pewter City" then
        moveToMap("Route 3")
      elseif getMapName() == "Pokecenter Route 3" then
        moveToMap("Route 3")
      elseif getMapName() == "Route 3" then
        moveToGrass()
      end
    end
  else
    if getMapName() == "Route 3" then
      moveToMap("Pokecenter Route 3")
    elseif getMapName() == "Pokecenter Route 3" then
      if step == 1 then
        usePokecenter()
      elseif step==2 then
        usePokecenter()
        step=step+1
      elseif step==3 then
        usePokecenter()
        leveling=false
        step=1
      end
    end
  end
  swapped=false
end


function onLearningMove(moveName, pokemonIndex)
  name = getPokemonName(pokemonIndex)
  if name== "Squirtle" or name== "Wartortle" or name == "Blastoise" then
    return forgetAnyMoveExcept({"Aqua Tail", "Bite"})
  elseif name == "Budew" or name== "Roselia" or name == "Roserade" then
    return forgetAnyMoveExcept({"Giga Drain", "Petal Dance"})
  elseif name == "Ponyta" or name== "Rapidash" then
    return forgetAnyMoveExcept({"Stomp", "Flame Wheel", "Bounce", "Flare Blitz"})
  elseif name == "Poliwag" or name== "Poliwhirl" then
    return forgetAnyMoveExcept({"Bubble Beam", "Body Slam", "Mud Shot", "Wake-Up Slap"})
  elseif name == "Bulbasaur" or name== "Ivysaur" or name== "Venusaur" then
    return forgetAnyMoveExcept({"Razor Leaf", "Double-Edge", "Petal Dance", "Take Down"})
  elseif name == "Snubbull" or name== "Granbull" then
    return forgetAnyMoveExcept({"Ice Fang", "Fire Fang", "Thunder Fang", "Headbutt"})
  elseif name == "Pidgey" or name== "Pidgeotto" or name== "Pidgeot" then
    return forgetAnyMoveExcept({"Gust", "Quick Attack", "Wing Attack"})
  elseif name == "Spearow" or name== "Fearow"  then
    return forgetAnyMoveExcept({"Aerial Ace", "Peck", "Assurance", "Pursuit"})
  elseif name == "Hoothoot" or name== "Noctowl"  then
    return forgetAnyMoveExcept({"Zen Headbutt", "Air Slash", "Uproar", "Sky Attack"})
  elseif name == "Sentret" or name== "Furret"  then
    return forgetAnyMoveExcept({"Quick Attack", "Slam", "Sucker Punch", "Fury Swipes"})
  else 
    return forgetAnyMoveExcept({})
  end
end


function changePoke( level)

  if getPokemonLevel(1) >= level then
    if getPokemonLevel(2) >= level then
      if getPokemonLevel(3) >= level then
        step= step+1
      else
        swapPokemon(1,3)
        swapped=true
      end
    else
      swapPokemon(1,2)
      swapped=true
    end
  end
end

function getPewterRozet()
    if pewterRozet==false then
        if getMapName() == "Pokecenter Pewter" then
          if step==1 or step==2 then
            moveToMap("Pewter City")
          elseif step==3 or step==4 then
            usePokecenter()
            step=step+1
            if step==4 then
              pewterRozet=true
              step=1
            end
          end
        elseif getMapName() == "Route 3" then
          if step==1 or step==2 then
            moveToMap("Pewter City")
          elseif step==3 or step==4 then
             moveToMap("Pokecenter Route 3")
          end
        elseif getMapName() == "Pokecenter Route 3" then
          if step==1 or step==2 then
            moveToMap("Route 3")
          elseif step==3 or step==4 or step==5 then
            usePokecenter()
            step=step+1
            if step==5 then
              pewterRozet=true
              step=1
            end
          end
        elseif getMapName() == "Pewter City" then
          if isNpcOnCell(23, 22)  then
                talkToNpcOnCell(23, 22)
          else
            if step==1 or step==2 then
              moveToMap("Pewter Gym")
            elseif step==3 or step==4 then
              moveToMap("Route 3")
            end
          end
        elseif getMapName() == "Pewter Gym" then
            if step==1 or step==2 then
              step=step+1
              talkToNpcOnCell(7, 5)
            elseif step==3 or step==4 then
              moveToMap("Pewter City")
            end
        end
    end
end

function getSSAnneTicked()
    if isTicketGet==false then
        if step == 1 or step==2 then
            if getMapName() == "Pokecenter Cerulean" then
                moveToMap("Cerulean City")
            elseif getMapName() == "Cerulean City" then
                moveToMap("Route 24")
            elseif getMapName() == "Route 24" then
                moveToMap("Route 25")
            elseif getMapName() == "Route 25" then
                moveToMap("Bills House")
            elseif getMapName() == "Bills House" then
                step=step+1
                talkToNpcOnCell(11, 3)
            end
        elseif step == 3 or step ==4 then
            if isNpcOnCell(18, 2)  then
                talkToNpcOnCell(18, 2)
            end
            step=step+1
        elseif step == 5 or step==6 then
            step=step+1
            talkToNpcOnCell(11, 3)
        elseif step == 7 then
            if getMapName() == "Bills House" then
                moveToMap("Route 25")
            elseif getMapName() == "Route 25" then
                moveToMap("Route 24")
            elseif getMapName() == "Route 24" then
                moveToMap("Cerulean City")
            elseif getMapName() == "Cerulean City" then
                moveToMap("Pokecenter Cerulean")
            elseif getMapName() == "Pokecenter Cerulean" then
                usePokecenter()
                step=8
            end
        elseif step ==8 then
            isTicketGet=true
            step=1
            leveling=true

        end
    end

end

function levelingCerulean( )
  if (isPokemonUsable(1) ) and step==1 then
    changePoke(ceruleanlevel)
    if swapped!= true then
      if getMapName() == "Pokecenter Cerulean" then
        moveToMap("Cerulean City")
      elseif getMapName() == "Cerulean City" then
        moveToMap("Route 4")
      elseif getMapName() == "Route 4" then
        moveToGrass()
      end
    end
  else
    if getMapName() == "Route 4" then
      moveToMap("Cerulean City")
    elseif getMapName() == "Cerulean City" then
      moveToMap("Pokecenter Cerulean")
    elseif getMapName() == "Pokecenter Cerulean" then
      if step == 1 then
        usePokecenter()
      elseif step==2 then
        usePokecenter()
        step=step+1
      elseif step==3 then
        usePokecenter()
        leveling=false
        step=1
      end
    end
  end
  swapped=false
end
function levelingVermilion( )
  if (isPokemonUsable(1)) and step==1 then
    changePoke(vermilionlevel)
    if swapped!= true then
      if getMapName() == "Pokecenter Vermilion" then
        moveToMap("Vermilion City")
      elseif getMapName() == "Vermilion City" then
        moveToMap("Route 11")
      elseif getMapName() == "Route 11" then
        moveToGrass()
      end
    end
  else
    if getMapName() == "Route 11" then
      moveToMap("Vermilion City")
    elseif getMapName() == "Vermilion City" then
      moveToMap("Pokecenter Vermilion")
    elseif getMapName() == "Pokecenter Vermilion" then
      if step == 1 then
        usePokecenter()
      elseif step==2 then
        usePokecenter()
        step=step+1
      elseif step==3 then
        usePokecenter()
        leveling=false
        step=1
      end
    end
  end
  swapped=false
end
function levelingCeladon( )
  if (isPokemonUsable(1)) and step==1   then
    changePoke(celadonlevel)
    
    if swapped!= true then
      if getMapName() == "Pokecenter Celadon" then
        moveToMap("Celadon City")
      elseif getMapName() == "Rocket Hideout B1F" then
        step=1 
        if (getPlayerX()==2 and (getPlayerY()==19 or getPlayerY()==20)) or (getPlayerX()== 6 and getPlayerY()==18) then
            
            talkToNpcOnCell(7,18)
        else
            moveToMap("Celadon Gamecorner Stairs") 
        end
      elseif getMapName() == "Celadon Gamecorner Stairs" then
        step=1 
        moveToMap("Celadon City")
      elseif getMapName() == "Celadon City" then
        moveToMap("Route 7")
      elseif getMapName() == "Route 7" then
        moveToGrass()
      end
    end
  else
    if getMapName() == "Route 7" then
      moveToMap("Celadon City")
    elseif getMapName() == "Celadon City" then
      moveToMap("Pokecenter Celadon")
    elseif getMapName() == "Pokecenter Celadon" then
      if step == 1 then
        usePokecenter()
      elseif step==2 then
        usePokecenter()
        step=step+1
      elseif step==3 then
        usePokecenter()
        leveling=false
        step=1
      end
    end
  end
  swapped=false
  
end

function getCeruleanRozet()
    if ceruteanRozet==false then
        if step == 1 or step ==2  or step==3 then
             if getMapName() == "Pokecenter Cerulean" then
                moveToMap("Cerulean City")
            elseif getMapName() == "Cerulean City" then
                moveToMap("Cerulean Gym")
            elseif getMapName() == "Cerulean Gym" then
                talkToNpcOnCell(10, 6)
                step=step+1
            end
        elseif step==4  then
            if getMapName() == "Cerulean Gym" then
                moveToMap("Cerulean City")
            elseif getMapName() == "Cerulean City" then
                moveToMap("Pokecenter Cerulean")
            elseif getMapName() == "Pokecenter Cerulean" then
                     step=step+1
                    usePokecenter()
            end
        elseif step==5  then
            if getMapName() == "Pokecenter Cerulean" then
                usePokecenter()
                ceruteanRozet=true
                step=1
            end
        end

    end
end

function ceruleanToVermilion()


    if getMapName() == "Pokecenter Cerulean" then
        moveToMap("Cerulean City")
    elseif getMapName() == "Cerulean City" then
        moveToMap("Route 5")
    elseif getMapName() == "Route 5" then
        moveToMap("Route 5 Stop House")
    elseif getMapName() == "Route 5 Stop House" then
        moveToMap("Saffron City")
    elseif getMapName() == "Saffron City" then
        moveToMap("Route 6 Stop House")
    elseif getMapName() == "Route 6 Stop House" then
        moveToMap("Route 6")
    elseif getMapName() == "Route 6" then
        moveToMap("Vermilion City")
    elseif getMapName() == "Vermilion City" then
        moveToMap("Pokecenter Vermilion")
    elseif getMapName() == "Pokecenter Vermilion" then
        if step== 1 then
            step=step+1
            usePokecenter()
        else
            log("to Vermilion")
            usePokecenter()
            step=1
            leveling=false
            city = "Pokecenter Vermilion"
        end
    end
end



function ssAnneMission()
    if ssAnne==false then
        if getMapName() == "Pokecenter Vermilion" then
                if step==1 or step ==2 then
                    moveToMap("Vermilion City")
                elseif step==19 or step==20 then
                    usePokecenter()
                    step=step+1
                else
                    usePokecenter()
                    ssAnne=true
                    leveling=true
                    step=1
                end
        elseif getMapName() == "Vermilion City" then
            if step==19 or step==20 then
                moveToMap( "Pokecenter Vermilion")
            else
                if isNpcOnCell(38, 63)  then
                    talkToNpcOnCell(38, 63)
                else
                    moveToCell(40,67)
                end
            end
        elseif getMapName() == "SSAnne 1F" then
                if step == 1 or step ==2 then
                    moveToMap("SSAnne 1F Kitchen")
                elseif step == 11 or step ==12 then
                    moveToMap("SSAnne 2F")
                elseif step==19 or step==20 then
                    if hasMove(4,"Cut") then
                        moveToMap("Vermilion City")
                    else
                        useItemOnPokemon("HM01 - Cut",4)
                    end

                end
        elseif getMapName() == "SSAnne 1F Kitchen" then
                if step == 1 or step ==2 then
                    step = step+1
                    talkToNpcOnCell(5, 3)
                elseif step ==3 or step==4 then
                   talkToNpcOnCell(14, 7)
                     step = step+1
                elseif step ==5 or step==6 then
                    talkToNpcOnCell(14, 9)
                    step = step+1
                elseif step ==7 or step==8 then
                    talkToNpcOnCell(14, 11)
                   step = step+1
                elseif step ==9 or step==10 then
                    step = step+1
                    talkToNpcOnCell(5, 3)
                else
                    moveToMap("SSAnne 1F")
                end
        elseif getMapName() == "SSAnne 2F" then
            if step==11 or step==12 then 
                moveToMap("SSAnne 2F Room6")
            elseif step==13 or step==14 then 
                moveToMap("SSAnne 3F")
            elseif step==15 or step==16 then
                if isNpcOnCell(26, 4)  then
                    talkToNpcOnCell(26, 4)
                else
                    moveToMap("SSAnne 2F Captain Room")
                end
            elseif step==17 or step==18 then
                talkToNpcOnCell(28, 18)
                step=step+1
            elseif step==19 or step==20 then
                moveToMap("SSAnne 1F")
            end
        elseif getMapName() == "SSAnne 2F Room6" then
            if step==11 or step==12 then
                talkToNpcOnCell(9, 9)
                step=step+1
            elseif step==13 or step==14 then
                moveToMap("SSAnne 2F")
            end
        elseif getMapName() == "SSAnne 3F" then
            if step==15 or step==16 then 
                moveToMap("SSAnne 2F")
            else
                moveToMap("Ballroom SS Anne")
            end
        elseif getMapName() == "Ballroom SS Anne" then
            if isNpcOnCell(2, 20)  then
                step=step+1
                talkToNpcOnCell(2, 20)
            else
                moveToMap("SSAnne 3F")
            end
        elseif getMapName() == "SSAnne 2F Captain Room" then
            if step==15 or step==16 then
                step=step+1
                talkToNpcOnCell(5, 4)
            else
                moveToMap("SSAnne 2F")
            end
        end
    end
end

function onDialogMessage(message)
    if stringContains(message, "wrong switch") then
        log("[Surge puzzle] First switch [" .. currentSwitchX .. "," ..
            currentSwitchY .. "] is wrong, next.")
        nextSwitch()
        firstSwitchFound = false
        firstSwitchActivated = false
    end
    if stringContains(message, "have triggered the first switch") then
        if not firstSwitchFound then
            log("[Surge puzzle] Found the first switch! [" ..
                currentSwitchX .. "," .. currentSwitchY .. "] is correct.")
            firstSwitchFound = true
            firstSwitchX = currentSwitchX
            firstSwitchY = currentSwitchY
            currentSwitchX = SWITCHES_START_X
            currentSwitchY = SWITCHES_START_Y
        end
        firstSwitchActivated = true
    end
    if stringContains(message, "have been reset") then
        log("[Surge puzzle] Second switch [" .. currentSwitchX ..
            "," .. currentSwitchY .. "] is wrong, next.")
        nextSwitch()
        firstSwitchActivated = false
    end
    

end

function getVermilionRozet()
    
    if vermilionRozet==false then 
        if getMapName() == "Pokecenter Vermilion" then
            if step==1 or step==2 then
                moveToMap("Vermilion City")
            elseif step==3 or step==4 then
                usePokecenter()
                step=step+1
            else
                usePokecenter()
                step=1
                vermilionRozet=true
            end
        elseif getMapName() == "Vermilion City" then    
            if step==1 or step==2 then
                moveToMap("Vermilion Gym")
            elseif step==3 or step==4 then
                moveToMap("Pokecenter Vermilion")
            end
        elseif getMapName() == "Vermilion Gym" then    
            if isNpcOnCell(6, 10) then
                if firstSwitchFound and not firstSwitchActivated then
                    talkToNpcOnCell(firstSwitchX, firstSwitchY)
                else
                    talkToNpcOnCell(currentSwitchX, currentSwitchY)
                end
            elseif step==1 or step==2 then
                step=step+1
                talkToNpcOnCell(6, 4)
            elseif step==3 or step==4 then
                moveToMap("Vermilion City")
            end
        end
    end
end
function nextSwitch()
    currentSwitchX = currentSwitchX + 2
    if currentSwitchX > SWITCHES_END_X then
        currentSwitchX = SWITCHES_START_X
        currentSwitchY = currentSwitchY + 2
    end
    if currentSwitchY > SWITCHES_END_Y then
        currentSwitchY = SWITCHES_START_Y
    end
end

function vermilionToCeladon()
    if city == "Pokecenter Vermilion" then
        if getMapName() == "Pokecenter Vermilion" then
            moveToMap("Vermilion City")
        elseif getMapName() == "Vermilion City" then
            moveToMap("Route 6")
        elseif getMapName() == "Route 6" then
            moveToMap("Route 6 Stop House")
        elseif getMapName() == "Route 6 Stop House" then
            moveToMap("Saffron City")
        elseif getMapName() == "Saffron City" then
            moveToMap("Route 7 Stop House")
        elseif getMapName() == "Route 7 Stop House" then
            moveToMap("Route 7")
        elseif getMapName() == "Route 7" then
            moveToMap("Celadon City")
        elseif getMapName() == "Celadon City" then
            moveToMap("Pokecenter Celadon")
        elseif getMapName() == "Pokecenter Celadon" then
            if step== 1 or step==2 then
                step=step+1
                usePokecenter()
            else
                step=1
                leveling=true
                usePokecenter()
                city = "Pokecenter Celadon"
            end
        end

    end
end


function rockedHideout(  )
    if rockedTeam==false then
        if getMapName() == "Pokecenter Celadon" then
          if step != 19 and step !=20 then
            moveToMap("Celadon City")
          elseif step==19 then
            usePokecenter()
            step=step+1
          elseif step==20 then
            usePokecenter()
            step=1
            rockedTeam=true
          end
        elseif getMapName() == "Celadon City" then
          if rockedRetry == false then
            if step ==1 or step==2 then
              if getPlayerX()!= 48 and getPlayerY()!=33 then
                  moveToCell(48,33)
              else   
                if step == 1 then
                  pushDialogAnswer(2)
                else
                  pushDialogAnswer(1)
                end
                step=step+1
                talkToNpcOnCell(48,34)
              end
            elseif step==3 or step ==4 then
              moveToMap("Celadon Gamecorner Stairs")
            elseif step==19 or step ==20 then
              moveToMap("Pokecenter Celadon")
            end
          elseif rockedRetry == true then
            if step ==1 or step==2 then
              moveToMap("Celadon Gamecorner Stairs")
            end
          end
         elseif getMapName() == "Celadon Gamecorner Stairs" then
          if rockedRetry == false then
            if step==3 or step==4 then
                if isNpcOnCell(13, 3) then
                    talkToNpcOnCell(13, 3)
                else
                    moveToMap("Rocket Hideout B1F")
                end
            elseif step==19 or step==20 then
              moveToMap("Celadon City")
            end
          elseif rockedRetry == true then
            if step==1 or step==2 then
               moveToMap("Rocket Hideout B1F")
            end
          end
         elseif getMapName() == "Rocket Hideout B1F" then
          if rockedRetry == false then
            if step==3 or step==4 then
              if isNpcOnCell(24, 20) then
                  talkToNpcOnCell(24, 20)
              else
                  if isNpcOnCell(23, 20) then
                      talkToNpcOnCell(23, 20)
                  else
                      moveToCell(22,29)
                  end
              end
            elseif step ==5 or step == 6 then
                if (getPlayerX()==2 and (getPlayerY()==19 or getPlayerY()==20)) or (getPlayerX()== 6 and getPlayerY()==18) then
                  talkToNpcOnCell(7,18)
                else
                    step=step+2
                    moveToMap("Rocket Hideout B2F")
                end
            elseif step==7 or step==8 then
                moveToMap("Rocket Hideout B2F")
            elseif step==19 or step==20 then
                 moveToMap("Celadon Gamecorner Stairs")
            end
          elseif rockedRetry == true then
            if step==1 or step==2 then
               moveToMap("Rocket Hideout B2F")
            end
          end
          elseif getMapName() == "Rocket Hideout Elevator" then
            if rockedRetry == false then
              if step==3 or step==4 then
                  pushDialogAnswer(2)
                  step=step+1
                  talkToNpcOnCell(1, 1)
              elseif step==5 or step==6 or step==11 or step ==12 or step==19 or step==20 then
                  moveToCell(2,5)
              elseif step==9 or step==10 then
                  pushDialogAnswer(3)
                  step=step+1
                  talkToNpcOnCell(1, 1)
              elseif step==17 or step==18 then
                  pushDialogAnswer(2)
                  step=step+1
                  talkToNpcOnCell(1, 1)
              end
            elseif rockedRetry == true then
                if step==1 or step==2 then
                    pushDialogAnswer(1)
                    step=step+1
                    talkToNpcOnCell(1, 1)
                elseif step==3 or step==4 then
                    moveToCell(2,5)
                    rockedRetry=false
                end
            end
         elseif getMapName() == "Rocket Hideout B2F" then
          if rockedRetry == false then
            if isNpcOnCell(28, 20) then
                  talkToNpcOnCell(28, 20)
            else
                if step ==5 or step == 6 or step== 19 or step==20 then
                   moveToCell(31,4)
                elseif step ==7 or step ==8 then
                   moveToMap("Rocket Hideout B3F")
                elseif step ==9 or step ==10 then
                   moveToCell(31,19)
                end
            end
          elseif rockedRetry == true then
            if isNpcOnCell(28, 20) then
                  talkToNpcOnCell(28, 20)
            else
              if step==1 or step==2 then
                moveToCell(31,19)
              end
            end
          end
         elseif getMapName() == "Rocket Hideout B3F" then
            if step==7 or step==8 then
              if isNpcOnCell(19, 6) then
                  talkToNpcOnCell(19, 6)
              elseif isNpcOnCell(18, 15) then
                  talkToNpcOnCell(18, 15)
              elseif isNpcOnCell(15, 22) then
                  talkToNpcOnCell(15, 22)
              else
                  moveToMap("Rocket Hideout B4F")
              end
            elseif step==9 or step == 10 then
               moveToMap("Rocket Hideout B2F")
            end
          elseif getMapName() == "Rocket Hideout B4F" then
            if step==7 or step==8 then
                if isNpcOnCell(5, 6) then
                    talkToNpcOnCell(5, 6)
                elseif isNpcOnCell(4, 6) then
                    talkToNpcOnCell(4, 6)
                else
                    step=step+2
                    moveToMap("Rocket Hideout B3F")
                end
            elseif step==11 or step == 12 then
               if getPlayerX()!= 18 and getPlayerY()!=16 then
                  moveToCell(18,16)
              else      
                  talkToNpcOnCell(18, 15)
                  step=step+1
              end
            elseif step==13 or step == 14 then
                if isNpcOnCell(19, 4) then
                    talkToNpcOnCell(19, 4)
                elseif isNpcOnCell(18, 6) then
                    talkToNpcOnCell(18, 6)
                else
                  talkToNpcOnCell(20, 3)
                  step=step+1
                end
            elseif step==15 or step == 16 then
              talkToNpcOnCell(18, 15)
              step=step+1
            elseif step==17 or step == 18 then
              moveToCell(20,25)
            end
         end

    end
end
function onBattleMessage(message)
  if stringContains(message, "black out") then
      step=1
      leveling=true
      if city == "Pokecenter Vermilion" then
          vermilionlevel = vermilionlevel+1
      elseif city == "Pokecenter Celadon" then
          rockedRetry=true
          celadonlevel = celadonlevel+1
      elseif city == "Pokecenter Cerulean" then
          ceruleanlevel = ceruleanlevel+1
      elseif city == "Pokecenter Pewter" then
          getFosil=false
          pewterLevel = pewterLevel+1
      end
  end
end

function getCeladonRozet()
    if celadonRozet==false  then
        if getMapName() == "Pokecenter Celadon" then
            
              if step==1 or step==2 then
                  moveToMap("Celadon City")
              elseif step==3 or step==4 then
                  usePokecenter()
                  step=step+1
              else
                  celadonRozet=true
                  step=1
              end
        elseif getMapName() == "Celadon City" then
          log(isNpcOnCell(21, 51))
          
              if step==1 or step==2 then
                  if isNpcOnCell(46, 49) then
                      talkToNpcOnCell(46,49)
                  else  
                    if isNpcOnCell(21, 51) then
                        talkToNpcOnCell(21,51)
                    else
                      --moveToCell(26,51)
                      moveToMap("CeladonGym")
                    end
                  end
              else 
                if isNpcOnCell(21, 51) then
                    talkToNpcOnCell(21,51)
                else
                  moveToMap("Pokecenter Celadon")
              end
            end
        elseif getMapName() == "CeladonGym" then
            if step==1 or step==2 then
                step=step+1
                talkToNpcOnCell(8,4)
            else
                moveToMap("Celadon City")
            end
        end
    end
end