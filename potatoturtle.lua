1) Needs to empty full chest
2) Needs to make sure he moves (half done. also with turns)

function amIHomeYet()
    blingsuc, blingdat = turtle.inspectDown()
    if blingdat.name == "chisel:diamond_block" then
        return true
    else
        return false
    end
end   

function moveyoudumbfuckingturtle()
    for i=1,8 do
        movsuccess, movdata = turtle.inspectDown()
        if (not movsuccess) or (movdata.metadata == 7) then
            turtle.digDown()
            turtle.placeDown()
        end
        while (not turtle.forward()) do
            os.sleep(1)
        end
    end
end
  
function turn()
    if nextRight == 1 then
        turtle.turnRight()
        tursuccess, turdata = turtle.inspectDown()
        if (not tursuccess) or (turdata.metadata == 7) then
            turtle.digDown()
            turtle.placeDown()
        end
        turtle.forward()
        turtle.turnRight()
        nextRight = 0    
    else
        turtle.turnLeft()
        if (not tursuccess) or (turdata.metadata == 7) then
            turtle.digDown()
            turtle.placeDown()
        end
        turtle.forward()
        turtle.turnLeft()
        nextRight = 1
    end
end

function hibernate()
    rest = true
    while (rest == true) do
        os.sleep(10)
        local success, data = turtle.inspectDown()
        if data.metadata == 7 then
            rest = false
        end
    end
end

function backToHub()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    for i=1,17 do 
        turtle.forward()
    end
    turtle.turnRight()
    for i = 16,1,-1 do
        turtle.select(i)
        turtle.dropUp()
    end
    turtle.forward()
    nextRight = 1
end


while (1 == 1) do
    backToHub()
    while (not amIHomeYet()) do
        moveyoudumbfuckingturtle()
        turn() 
    end
    turtle.turnRight()
    turtle.back()
    hibernate()
end
