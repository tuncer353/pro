name = "Chespin Catcher"
author = "Derpro"
description = [[Chespin and catch every Shiny Pokemon!]]

city = "Pokecenter Fuchsia"

silpCoMission =false
step =1
saffronRozet=true
fuchsiaRozet=true
cinnabarRozet=true
surf=true
cinnabarGymCard=true

function onStart()

    city = getMapName()
    surf = hasItem("HM03 - Surf")
    cinnabarRozet = hasItem("Volcano Badge")
    cinnabarGymCard=hasItem("Volcano Badge")
    saffronRozet= hasItem("Marsh Badge")
    fuchsiaRozet= hasItem("Soul Badge")
    step=1


end


function onPathAction()
  son4()
  --moveViridian()
  --moveToCell(15,33)

end

function onLearningMove(moveName, pokemonIndex)
  return forgetAnyMoveExcept({})
end

function son4()
    if city == "Pokecenter Saffron" or city == "Pokecenter Celadon" then
      if silpCoMission == false then
        silpCo()
      elseif saffronRozet ==false then
        getSaffronRozet()
      else 
        moveToFuchsia()
      end
    elseif city == "Pokecenter Fuchsia" then
      if surf == false then
        getSurf()
      elseif fuchsiaRozet==false then
        getFuchsiaRozet()
      else
        moveCinnabar()
      end
    elseif city == "Pokecenter Cinnabar" then
      if cinnabarGymCard ==false then
        getCinnabarGymCard()
      elseif cinnabarRozet==false then
        getCinnabarRozet()
      else
        moveViridian()
      end
    elseif city == "Pokecenter Viridian" then
        getViridianRozet()
    end
end

function getViridianRozet()
  if getMapName() == "Pokecenter Viridian" then
    if step==1 then
      moveToMap("Viridian City")
    end
  elseif getMapName() =="Viridian City" then
    if step ==1 then
      moveToCell(60,22)
    else
      moveToMap("Pokecenter Viridian")
    end
  elseif getMapName() =="Viridian Gym 2" then
    if step ==1 or step==2 then
      if isNpcOnCell(10,26) then
        talkToNpcOnCell(10,26)
      else
        talkToNpcOnCell(10,8)
        step=step+1
      end
    else
      moveToMap("Viridian City")
    end
  end
end

function moveViridian()
  if getMapName() == "Pokecenter Cinnabar" then
    moveToMap("Cinnabar Island")
  elseif getMapName() == "Cinnabar Island" then
    moveToMap("Route 21")
  elseif getMapName() == "Route 21" then
    moveToMap("Pallet Town")
  elseif getMapName() =="Pallet Town" then
    moveToMap("Route 1")
  elseif getMapName() == "Route 1" then
    moveToMap("Route 1 Stop House")
  elseif getMapName() == "Route 1 Stop House" then
    moveToMap("Viridian City")
  elseif getMapName() =="Viridian City" then
    moveToMap("Pokecenter Viridian")
    city="Pokecenter Viridian"
  end
end

function getCinnabarRozet()
  if getMapName() == "Pokecenter Cinnabar" then
    if step==1 then
      moveToMap("Cinnabar Island")
    elseif step==3 then
      usePokecenter()
      step=step+1
    elseif step==4 then
      usePokecenter()
      step=1
      cinnabarRozet=true
    end
  elseif getMapName() == "Cinnabar Island" then
    if step==1 then
      if isNpcOnCell(28,17) then
        talkToNpcOnCell(28,17)
      else
        moveToMap("Cinnabar Gym")
      end
    else
      moveToMap("Pokecenter Cinnabar")
    end
  elseif getMapName() == "Cinnabar Gym" then
    if step==1 then
      if isNpcOnCell(6,8) then
        talkToNpcOnCell(6,8)
      elseif isNpcOnCell(6,7) then
        talkToNpcOnCell(6,7)
      else
        moveToMap("Cinnabar Gym B1F")
      end
    else
      moveToMap("Cinnabar Island")
    end
  elseif getMapName() == "Cinnabar Gym B1F" then
    if step==1 or step==2 then
      talkToNpcOnCell(18,16)
      step=step+1
    else
      moveToMap("Cinnabar Gym")
    end
  end


end



function getCinnabarGymCard()
  if getMapName() == "Pokecenter Cinnabar" then
    if step==1 then
      moveToMap("Cinnabar Island")
    end
  elseif getMapName() == "Cinnabar Island" then
    if step==1 then
      if isNpcOnCell(18,15) then
        talkToNpcOnCell(18,15)
      else
        moveToMap("Cinnabar Mansion 1")
      end
    else
      moveToMap("Pokecenter Cinnabar")
      cinnabarGymCard=true
      step=1
    end
  elseif getMapName() == "Cinnabar mansion 1" then
    if step==1 then
      moveToMap("Cinnabar Mansion 2")
    else 
      moveToMap("Cinnabar Island")
    end
  elseif getMapName() == "Cinnabar mansion 2" then
    if step==1 then
      moveToCell(9,4)
    end
  elseif getMapName() == "Cinnabar mansion 3" then
    moveToMap("Cinnabar Mansion B1F")
  elseif getMapName() == "Cinnabar mansion B1F" then
    if step==1 then
      if (getPlayerX()!= 5 or getPlayerY()!=27) then
        moveToCell(5,27)
      else
        step=2
        talkToNpcOnCell(5,26)
      end
    else
      if isNpcOnCell(5,19) then
        talkToNpcOnCell(5,19)
      elseif isNpcOnCell(5,15) then
        talkToNpcOnCell(5,15)
      else
        moveToMap("Cinnabar Mansion 1")
      end
    end
  end
end


function moveCinnabar()
  if getMapName() == "Pokecenter Fuchsia" then
    moveToMap("Fuchsia City")
  elseif getMapName() == "Fuchsia City" then
    moveToMap("Fuchsia City Stop House")
  elseif getMapName() == "Fuchsia City Stop House" then
    moveToMap("Route 19")
  elseif getMapName() == "Route 19" then
    moveToMap("Route 20")
  elseif getMapName() == "Route 20" then
    if step ==1 then
        moveToCell(60,32)
    else
      moveToMap("Cinnabar Island")
    end
  elseif getMapName() == "Seafoam 1F" then
    if step ==1 then
      moveToMap("Seafoam B1F")
    else
      moveToMap("Route 20")
    end
  elseif getMapName() == "Seafoam B1F" then
    moveToCell(85,22)
    step=2
  elseif getMapName() == "Cinnabar Island" then
    moveToMap("Pokecenter Cinnabar")
  elseif getMapName() == "Pokecenter Cinnabar" then
    if step==2 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      city = "Pokecenter Cinnabar"
      step=1
    end
  end


end

function getFuchsiaRozet()
  if getMapName() == "Pokecenter Fuchsia" then
    if step ==1 then
      moveToMap("Fuchsia City")
    elseif step==3 then
      usePokecenter()
      step=step+1
    elseif step==4 then
      usePokecenter()
      step=1
      fuchsiaRozet=true
    end
  elseif getMapName() == "Fuchsia City" then
      if step == 1 then
        moveToMap("Fuchsia Gym")
      else
        moveToMap("Pokecenter Fuchsia")
      end
  elseif getMapName() == "Fuchsia Gym" then
    if step == 1 or step==2 then
      if (getPlayerX()== 6 and getPlayerY()==16) then
        moveToCell(6,15)
      else
        talkToNpcOnCell(7,10)
        step=step+1
      end
    else
      moveToMap("Fuchsia City")
    end
  end

end



function getSurf()
  if getMapName() == "Pokecenter Fuchsia" then
    if step ==1 then
      moveToMap("Fuchsia City")
    elseif step==7 then

      if hasMove(4,"Surf") then
          usePokecenter()
          step=step+1
      else
          useItemOnPokemon("HM03 - Surf",4)
      end
    elseif step==8 then
      usePokecenter()
      surf=true
      step=1
    end
  elseif getMapName() == "Fuchsia City" then
      if step == 1 then
        moveToMap("Fuchsia City Stop House")
      elseif step ==3 then
        moveToMap("Safari Stop")
      else
        moveToMap("Pokecenter Fuchsia")
      end
  elseif getMapName() == "Fuchsia City Stop House" then
      if step == 1 then
        moveToMap("Route 19")
      else
        moveToMap("Fuchsia City")
      end
  elseif getMapName() == "Route 19" then
    if step == 1 or step == 2 then
      talkToNpcOnCell(33,19)
      step=step+1
    else
       moveToMap("Fuchsia City Stop House")
    end
  elseif getMapName() == "Safari Stop" then
    if step == 3 or step ==4 then
      talkToNpcOnCell(7,4)
      step=step+1
    else
      moveToMap("Fuchsia City")
    end
  elseif getMapName() == "Safari Entrance" then
    if step ==5 then
      moveToMap("Safari Area 1")
    else 
      talkToNpcOnCell(27,25)
    end
  elseif getMapName() == "Safari Area 1" then
    if step ==5 then
      moveToMap("Safari Area 2")
    else
      moveToMap("Safari Entrance")
    end
  elseif getMapName() == "Safari Area 2" then
    if step ==5 then
      moveToMap("Safari Area 3")
    else
      moveToMap("Safari Area 1")
    end
  elseif getMapName() == "Safari Area 3" then
    if step ==5 then
      moveToMap("Safari House 4")
    else 
      moveToMap("Safari Area 2")
    end
  elseif getMapName() == "Safari House 4" then
    if step ==5 or step==6 then
      if isNpcOnCell(11,3) then
        talkToNpcOnCell(11,3)
        step=step+1
      else
        moveToMap("Safari Area 3")
        step=7
      end

    else
      moveToMap("Safari Area 3")
    end
  end
end

function moveToFuchsia()
  if getMapName() == "Pokecenter Saffron" then
    moveToMap("Saffron City")
  elseif getMapName() == "Saffron City" then
    moveToMap("Route 7 Stop House")
  elseif getMapName() == "Route 7 Stop House" then
    moveToMap("Route 7")
  elseif getMapName() == "Route 7" then
    moveToMap("Celadon City")
  elseif getMapName() == "Celadon City" then
    if isNpcOnCell(14, 42)  then
        talkToNpcOnCell(14, 42)
    else
      moveToMap("Route 16")
    end
  elseif getMapName() == "Route 16" then
    if step==1 then
      moveToCell(70,12)
      step=step+1
    elseif step==2 then
      moveToMap("Route 17")
    end
  elseif getMapName() == "Route 16 Stop House" then
    moveToCell(0,6)
  elseif getMapName() == "Route 17" then
    moveToMap("Route 18")
  elseif getMapName() == "Route 18" then
    if step==2 then
      moveToCell(29,16)
      step=step+1
    elseif step==3 then
      moveToMap("Fuchsia City")
    end
  elseif getMapName() == "Bike Road Stop" then
    moveToCell(10,6)
  elseif getMapName() == "Fuchsia City" then
    moveToMap("Pokecenter Fuchsia")
    city = "Pokecenter Fuchsia"
    step=1 
  end
end

function getSaffronRozet()
    if getMapName() == "Pokecenter Saffron" then
      if step == 1 then
        moveToMap("Saffron City")
      elseif step==9 then
        usePokecenter()
        step=step+1
      else
        usePokecenter()
        step=1
        saffronRozet=true
      end
    elseif getMapName() == "Saffron City" then
      if step == 1 then
        moveToMap("Saffron Gym")
      else
        moveToMap("Pokecenter Saffron")
      end
    elseif getMapName() == "Saffron Gym" then
      if step == 1 then
        moveToCell(15,17)
        step=step+1
      elseif step ==2 then
        moveToCell(18,20)
        step=step+1
      elseif step ==3 then
        moveToCell(6,20)
        step=step+1
      elseif step ==4 then
        moveToCell(2,13)
        step=step+1
      elseif step ==5 then
        moveToCell(2,6)
        step=step+1
      elseif step ==6 or step==7 then
        talkToNpcOnCell(12,10)
        step=step+1
      elseif step ==8 then
        moveToCell(10,13)
        step=step+1
      else
        moveToMap("Saffron City")
      end
    end
end


function silpCo()
    if getMapName() == "Pokecenter Celadon" then
      if step == 1 or step ==2 then
        moveToMap("Celadon City")
      end
    elseif getMapName() == "Celadon City" then
      if step == 1 or step ==2 then
        moveToMap("Route 7")
      end

    elseif getMapName() == "Route 7" then
      if step == 1 or step ==2 then
        moveToMap("Route 7 Stop House")
      end

    elseif getMapName() == "Route 7 Stop House" then
      if step == 1 or step ==2 then
        moveToMap("Saffron City")
      end
    elseif getMapName() == "Pokecenter Saffron" then
      if step == 1 or step ==2 then
        moveToMap("Saffron City")
      elseif step==3 then
        usePokecenter()
        step=step+1
      else
        usePokecenter()
        step=1
        silpCoMission=true
      end
    elseif getMapName() == "Saffron City" then

      if step == 1 or step ==2 then
        moveToMap("Silph Co 1F")
      else
        moveToMap("Pokecenter Saffron")
      end
    elseif getMapName() == "Silph Co 1F" then

      if step == 1 or step ==2 then
        if isNpcOnCell(29, 3)  then
          step=3
          moveToMap("Saffron City")
        else
          moveToMap("Silph Co 2F")
        end
      else
        moveToMap("Saffron City")
      end
    elseif getMapName() == "Silph Co 2F" then
      if step == 1 or step ==2 then
        moveToMap("Silph Co 3F")
      else
        moveToMap("Silph Co 1F")
      end
    elseif getMapName() == "Silph Co 3F" then
      if step == 1 or step ==2 then
        moveToMap("Silph Co 7F")
      else
        moveToMap("Silph Co 2F")
      end
    elseif getMapName() == "Silph Co 7F" then
      if step == 1 or step ==2 then
        moveToMap("Silph Co 11F")
      else
        moveToMap("Silph Co 3F")
      end
    elseif getMapName() == "Silph Co 11F" then
      if isNpcOnCell(3, 13)  then
        talkToNpcOnCell(3, 13)
      elseif isNpcOnCell(6, 15)  then
        talkToNpcOnCell(6, 15)
      elseif step==1 or step == 2 then
        talkToNpcOnCell(9,11)
        step=step+1
      else
        moveToMap("Silph Co 7F")
      end
    end
end






function onBattleAction()
    if isWildBattle() and ( isOpponentShiny() ) then
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") 
    else
        return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
    end
    return  run() or sendAnyPokemon()
end



       -- if getActivePokemonNumber() == 1 then
      --      return sendPokemon(2) or run()
      --  elseif (getActivePokemonNumber() == 2 ) and (getOpponentHealth() > 1 ) then
     --       return weakAttack() or run()
     --   elseif ((getOpponentHealth() == 1 ) or getActivePokemonNumber() == 3) then

         --    end


         --return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball")