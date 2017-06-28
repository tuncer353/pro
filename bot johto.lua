name = "Chespin Catcher"
author = "Derpro"
description = [[İhtiyaçlar  4. poke sleep powder icerecek,    fresh water olacak]]

city = "Pokecenter Ecruteak"

violetTowerDo = false
violetRozet =false
azaleaRocketMission=false
azaelaRozet=false
goldenrodRadio = true
goldenrodRozet=true
ecruteakMissionRozet=true
step=1


function onPathAction()
  if isOutside() and hasItem("Charizard Mount") and not isSurfing() and not isMounted() then
    useItem("Charizard Mount")
  else
    hepsi()
  end
  --moveToCell(13,7)

end


function hepsi()
  if city == "Pokecenter Cherrygrove City" then
    cherrygroveToViolet()
  elseif city == "Pokecenter Violet City" then
    if violetTowerDo ==false then
      violetTower()
    elseif violetRozet == false then
      getVioletRozet()
    else
      violetToAzelea()
    end
  elseif city == "Pokecenter Azalea" then
    if azaleaRocketMission==false then
      doAzaleaRocketMission()
    elseif azaelaRozet==false then
      getAzaleaRozet()
    else
      azaleaToGoldenrod()
    end
  elseif city == "Pokecenter Goldenrod" then
    if goldenrodRadio == false then
      doGoldenrodRadio()
    elseif goldenrodRozet == false then
      getGoldenRodRozet()
    else
      goldenrodToEcruteak()
    end
  elseif city == "Pokecenter Ecruteak" then
    if ecruteakMissionRozet==false then
      doEcruteakMissionAndGym()
    else
      ecruteakToCianwood()
    end

  end

end

function ecruteakToCianwood()
  if getMapName()== "Pokecenter Ecruteak" then
    moveToMap("Ecruteak City")
  elseif getMapName()== "Ecruteak City" then
    moveToMap("Ecruteak Stop House 1") 
  elseif getMapName()== "Ecruteak Stop House 1" then
    moveToMap("Route 38") 
  elseif getMapName()== "Route 38" then
    moveToMap("Route 39") 
  elseif getMapName()== "Route 39" then
    moveToMap("Olivine City") 
  elseif getMapName()== "Olivine City" then
    moveToMap("Glitter Lighthouse 1F") 
  elseif getMapName()== "Glitter Lighthouse 1F" then
    olivineTower(step)
  end
end

function olivineTower(step2)
  if getMapName()== "Glitter Lighthouse 1F" then
    if step==step2 then
      moveToMap("Glitter Lighthouse 2F") 
    else
      moveToMap("Olivine City") 
    end
  elseif  getMapName()== "Glitter Lighthouse 2F" then
    if step==step2 then
      moveToMap("Glitter Lighthouse 3F") 
    else
      moveToMap("Glitter Lighthouse 1F") 
    end
  end

end

function doEcruteakMissionAndGym()
  if getMapName()== "Pokecenter Ecruteak" then
    if step==1 then
      moveToMap("Ecruteak City")
    elseif step==4 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      ecruteakMissionRozet=true
      step=1
    end
  elseif getMapName()== "Ecruteak City" then
    if step==1 then
      moveToMap("Burned Tower Top Floor")
    elseif step==2 then
      moveToMap("Ecruteak Gym")
    elseif step==4 then
      moveToMap("Pokecenter Ecruteak")
    end
  elseif getMapName()== "Burned Tower Top Floor" then
    if step==1 then
      if isNpcOnCell(17,13) then
        talkToNpcOnCell(17,13)
      else
        moveToMap("Burned Tower Floor 2")
      end
    else 
       moveToMap("Ecruteak City")
    end
  elseif getMapName()== "Burned Tower Floor 2" then
    if isNpcOnCell(15,12) then
      talkToNpcOnCell(15,12)
    else
      step=2
      moveToMap("Burned Tower Top Floor")
    end
  elseif getMapName()== "Ecruteak Gym" then
    if step==2 or step==3 then
        talkToNpcOnCell(6,4)
        step=step+1
    else
      moveToMap("Ecruteak City")
    end
  end
   
end

function goldenrodToEcruteak()
  if getMapName() == "Pokecenter Goldenrod" then
    moveToMap("Goldenrod City")
  elseif getMapName() == "Goldenrod City" then
    if step ==1 then
      moveToMap("Route 35 Stop House")
    elseif step==3 or step==4 then
      talkToNpcOnCell(81,56)
      step=step+1
    elseif step==5 then
      moveToMap("Goldenrod City Flower Shop")
    else
      moveToMap("Route 35 Stop House")
    end
  elseif getMapName() == "Route 35 Stop House" then
    if step ==1 or step==7 then
      moveToMap("Route 35") 
    elseif step ==3 then
      moveToMap("Goldenrod City")
    end
  elseif getMapName()== "Route 35" then
    if step==1 or step==2 then
      talkToNpcOnCell(10,8)
      step=step+1
    elseif step==3 then
      moveToMap("Route 35 Stop House") 
    else
      moveToMap("Route 36")
    end
  elseif getMapName()== "Route 36" then
    if isNpcOnCell(47,25) then
      talkToNpcOnCell(47,25)
    else
      moveToMap("Route 37")
    end
  elseif getMapName()== "Route 37" then
    moveToMap("Ecruteak City")
  elseif getMapName()== "Ecruteak City" then
    moveToMap("Pokecenter Ecruteak")
  elseif getMapName()== "Pokecenter Ecruteak" then
    if step==7 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      city = "Pokecenter Ecruteak"
      step=1
    end

  elseif getMapName()== "Goldenrod City Flower Shop" then
    if step==5 or step==6 then 
      talkToNpcOnCell(0,9)
      step=step+1
    else
      moveToMap("Goldenrod City")
    end
  end

end





function getGoldenRodRozet()
  if getMapName() == "Pokecenter Goldenrod" then
    if step ==1 then
      moveToMap("Goldenrod City")
    elseif step==3 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      goldenrodRozet=true
      step=1
    end
  elseif getMapName() == "Goldenrod City" then
    if step ==1 then
      moveToMap("Goldenrod City Gym")
    else
      moveToMap("Pokecenter Goldenrod")
    end
  elseif getMapName() == "Goldenrod City Gym" then
    if step == 1 or step == 2 then
      talkToNpcOnCell(10,3)
      step=step+1
    else 
      moveToMap("Goldenrod City")
    end
  end


end

function doGoldenrodRadio()
  if getMapName() == "Pokecenter Goldenrod" then
    if step ==1 then
      moveToMap("Goldenrod City")
    elseif step==59 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      goldenrodRadio=true
      step=1
    end
  elseif getMapName() == "Goldenrod City" then
    if step ==1 or step==2 then
      pushDialogAnswer(2)
      talkToNpcOnCell(48,34)
      step=step+1
    elseif step==3 then
      moveToMap("Goldenrod Underground Entrance Top")
    elseif step==5 or step==6 then
      talkToNpcOnCell(48,34)
      step=step+1
    elseif step==7 then
      moveToMap("Goldenrod City House 2")
    elseif step==9 then
      moveToMap("Goldenrod Mart 1")
    elseif step==55 or step==56 then
      talkToNpcOnCell(48,34)
      step=step+1
    elseif step==57 or step==58 then
      talkToNpcOnCell(50,34)
      step=step+1
    elseif step==59 then
      moveToMap("Pokecenter Goldenrod")
    end
  elseif getMapName() == "Goldenrod Underground Entrance Top" then
    if step==3 then
      moveToMap("Goldenrod Underground Path")
    elseif step==5 or step==55 then
      moveToMap("Goldenrod City")
    end
  elseif getMapName() == "Goldenrod Underground Path" then
    if step==3 or step==4 then
      talkToNpcOnCell(17,10)
      step=step+1
    elseif step==5 or step==55 then
      moveToMap("Goldenrod Underground Entrance Top")
    end
  elseif getMapName() == "Goldenrod City House 2" then
    if step==7 or step==8 then
      talkToNpcOnCell(9,5)
      step=step+1
    elseif step==9 then
      moveToMap("Goldenrod City")
    end
  elseif getMapName() == "Goldenrod Mart 1" then
    if step==9 then
      moveToMap("Goldenrod Mart Elevator")
    end
  elseif getMapName() == "Goldenrod Mart Elevator" then
    if step==9 or step==10 then
      talkToNpcOnCell(1,6)
      step=step+1
    elseif step==11 then
      moveToCell(3,6)
    end
  elseif getMapName() == "Goldenrod Mart B1F" then
    if step==11 then
      swapPokemon(1,4)
      step=step+1
    elseif step==12 or step==13 then
      pushDialogAnswer(2)
      talkToNpcOnCell(13,8)
      step=step+1
    elseif step==14 then
      swapPokemon(1,4)
      step=step+1
    elseif step==15 then
      moveToMap("Underground warehouse")
    end
  elseif getMapName() == "Underground Warehouse" then
    if step==15 or step==16 then
      talkToNpcOnCell(19,16)
      step=step+1
    elseif step==17 or step==18 then
      talkToNpcOnCell(15,12)
      step=step+1
    elseif step==19 or step==20 then
      talkToNpcOnCell(20,8)
      step=step+1
    elseif step==21 or step==22 then
      talkToNpcOnCell(23,13)
      step=step+1
    elseif step==23 or step==24 then
      talkToNpcOnCell(24,23)
      step=step+1
    elseif step==25 or step==26 then
      talkToNpcOnCell(12,24)
      step=step+1
    elseif step==27 or step==28 then
      talkToNpcOnCell(11,10)
      step=step+1
    elseif step==29 or step==30 then
      talkToNpcOnCell(5,7)
      step=step+1
    elseif step==31 or step==32 then
      talkToNpcOnCell(5,14)
      step=step+1
    elseif step==33 then
      moveToMap("Goldenrod Underground Basement")
    end
  elseif getMapName() == "Goldenrod Underground Basement"  then
     if step==33 or step==34 then
        talkToNpcOnCell(26,13)
        step=step+1
     elseif step==35 or step==36 or step==39 or step==40 or  step==43 or step==44  then
        talkToNpcOnCell(17,13)
        step=step+1
     elseif step==37 or step==38 or step==45 or step==46 then
        talkToNpcOnCell(17,17)
        step=step+1
    elseif step==41 or step==42 then
        talkToNpcOnCell(26,17)
        step=step+1
    elseif step==47 or step==48 then
        talkToNpcOnCell(5,12)
        step=step+1
    elseif step==49 or step==50 then
        talkToNpcOnCell(8,19)
        step=step+1
    elseif step==51 or step==52 then
        talkToNpcOnCell(5,4)
        step=step+1

     elseif step==53 or step==54 then
        talkToNpcOnCell(17,13)
        step=step+1
    else
        moveToMap("Goldenrod Underground Path")
     end
  end


end




function azaleaToGoldenrod()
  if getMapName() == "Pokecenter Azalea" then
    moveToMap("Azalea Town")
  elseif getMapName() == "Azalea Town" then
    if isNpcOnCell(5,12) then
      talkToNpcOnCell(5,12)
    else
      moveToMap("Ilex Forest Stop House")
    end
  elseif getMapName() == "Ilex Forest Stop House" then
    moveToMap("Ilex Forest")
  elseif getMapName() == "Ilex Forest" then
    if step ==1 then
      if getPlayerX() == 12 and getPlayerY() == 59 then
        talkToNpcOnCell(12,58)
        step=step+1
      else
        moveToCell(12,59)
      end
    elseif step==2 then
      if isNpcOnCell(12,58) then
        if isNpcOnCell(47,42) then
          talkToNpcOnCell(47,42)
        else
          talkToNpcOnCell(12,58)
        end
      else
        moveToMap("Route 34 Stop House")
      end
    end

  elseif getMapName() == "Route 34 Stop House" then
    moveToMap("Route 34")
  elseif getMapName() == "Route 34" then
    moveToMap("Goldenrod City")
  elseif getMapName() == "Goldenrod City" then
    moveToMap("Pokecenter Goldenrod")
  elseif getMapName() == "Goldenrod City" then
    moveToMap("Pokecenter Goldenrod")
  elseif getMapName() == "Pokecenter Goldenrod" then
    if step==2 then
      usePokecenter()
      step=3
    elseif step==3 then
      usePokecenter()
      city = "Pokecenter Goldenrod"
      step=1
    end
  end
end

function getAzaleaRozet()
if getMapName() == "Pokecenter Azalea" then
    if step==1 then
      moveToMap("Azalea Town")
    elseif step==3 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      azaelaRozet=true
      step=1
    end
  elseif getMapName() == "Azalea Town" then
    if step==1 then
      moveToMap("Azalea Town Gym")
    else
      moveToMap("Pokecenter Azalea")
    end
  elseif getMapName() == "Azalea Town Gym" then
    if step==1 or step==2 then
      talkToNpcOnCell(15,3)
      step=step+1
    else
      moveToMap("Azalea Town")
    end
  end
end



function doAzaleaRocketMission()
if getMapName() == "Pokecenter Azalea" then
    if step==1 then
      moveToMap("Azalea Town")
    elseif step==2 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      azaleaRocketMission=true
      step=1
    end
  elseif getMapName() == "Azalea Town" then
    if step==1 then
      moveToMap("Slowpoke Well")
    else
      moveToMap("Pokecenter Azalea")
    end
  elseif getMapName() == "Slowpoke Well" then
    log(step)
    if step==1 or step==2 then

      if isNpcOnCell(12,26) then
        talkToNpcOnCell(12,26)
      else
        step=2
        moveToMap("Azalea Town")
      end
      
    elseif step==2 then
        moveToMap("Azalea Town")
    end
  end

end




function violetToAzelea()
    if getMapName() == "Pokecenter Violet City" then
      moveToMap("Violet City")
    elseif getMapName() == "Violet City" then
      moveToMap("Route 32")
    elseif getMapName() == "Route 32" then
      if isNpcOnCell(26,23) then
        talkToNpcOnCell(26,23)
      else
        moveToMap("Union Cave 1F")
      end
    elseif getMapName() == "Union Cave 1F" then
      moveToMap("Route 33")
    elseif getMapName() == "Route 33" then
      moveToMap("Azalea Town")
    elseif getMapName() == "Azalea Town" then
      moveToMap("Pokecenter Azalea")
    elseif getMapName() == "Pokecenter Azalea" then
      usePokecenter()
      city="Pokecenter Azalea"
    end
end

function getVioletRozet(  )
  if getMapName() == "Pokecenter Violet City" then
    if step==1 then
      moveToMap("Violet City")
    elseif step==3 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      violetRozet=true
      step=1
    end
  elseif getMapName() == "Violet City" then
    if step==1 then
      moveToMap("Violet City Gym Entrance")
    else
      moveToMap("Pokecenter Violet City")
    end
  elseif getMapName() == "Violet City Gym Entrance" then
    if step==1 then
      moveToMap("Violet City Gym")
    else
      moveToMap("Violet City")
    end
  elseif getMapName() == "Violet City Gym" then
    if step==1 or step==2 then
      talkToNpcOnCell(7,4)
      step=step+1
    else
      moveToMap("Violet City Gym Entrance")
    end
  end

end

function violetTower(  )
  if getMapName() == "Pokecenter Violet City" then
    if step==1 then
      moveToMap("Violet City")
    elseif step==8 then
      usePokecenter()
      step=step+1
    else
      usePokecenter()
      violetTowerDo=true
      step=1
    end
  elseif getMapName() == "Violet City" then
    if step==1 then
      moveToMap("Sprout Tower F1")
    else
      moveToMap("Pokecenter Violet City")
    end
  elseif getMapName() == "Sprout Tower F1" then
    if step==1 then
      moveToMap("Sprout Tower F2")
    elseif step==2 or step==3 then
      moveToCell(2,11)
      step=3
    elseif step==6 or step==7 then
      moveToCell(24,3)
      step=7
    elseif step==8 then
      moveToMap("Violet City")
    end
  elseif getMapName() == "Sprout Tower F2" then
    if step==1 or step ==2 then
      moveToCell(23,4)
      step=2
    elseif step==3 then
      moveToMap("Sprout Tower F3")
    elseif step==5 or step==6 then
      moveToCell(3,12)
      step=6
    elseif step==7 or step==8 then
      moveToCell(9,9)
      step=8
    end
  elseif getMapName() == "Sprout Tower F3" then

    if step==3 or step==4 then
      if getPlayerX()!= 13 and getPlayerY()!=5 then
        moveToCell(13,5)
      else
        talkToNpcOnCell(13, 4)
        step=step+1
      end
    elseif step==5 then
        moveToMap("Sprout Tower F2")
    end
  end

end

function cherrygroveToViolet()
  if getMapName() == "Pokecenter Cherrygrove City" then
    moveToMap("Cherrygrove City")
  elseif getMapName() == "Cherrygrove City" then
    moveToMap("Route 30")
  elseif getMapName() == "Route 30" then
    moveToMap("Route 31")
  elseif getMapName() == "Route 31" then
    moveToMap("Violet City Stop House")
  elseif getMapName() == "Violet City Stop House" then
    moveToMap("Violet City")
  elseif getMapName() == "Violet City" then
    moveToMap("Pokecenter Violet City")
  elseif getMapName() == "Pokecenter Violet City" then
    usePokecenter()
    city="Pokecenter Violet City"
  end
  
end

function onBattleAction()
    --if isWildBattle() and ( isOpponentShiny() ) then
       -- if getActivePokemonNumber() == 1 then
           --return sendPokemon(2) --or run()
      --  elseif (getActivePokemonNumber() == 2 ) and (getOpponentHealth() > 1 ) then
     --       return weakAttack() or run()
     --   elseif ((getOpponentHealth() == 1 ) or getActivePokemonNumber() == 3) then
     --       return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") 
    --    end
    --else
       return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
   -- end
    --return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball")
   -- return  run() or sendAnyPokemon()
end

