-----------------------------------------------------------------------------------------
--
-- main.lua
--Created by Brandon Yeung
--Created on April 17, 2019
-----------------------------------------------------------------------------------------
-- Gravity

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )
-- physics.setDrawMode( "hybrid" )   -- Shows collision engine outlines only

local theGround = display.newImageRect( "land.png", 300, 90 )
theGround.x = display.contentCenterX
theGround.y = display.contentCenterY +100
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )
-- Character move

local dPad = display.newImageRect( "d-pad.png", 90, 90  )
dPad.x = display.contentCenterX
dPad.y = display.contentCenterY + 200
dPad.id = "d-pad"

local upArrow = display.newImageRect ("upArrow.png", 24, 14  )
upArrow.x = display.contentCenterX
upArrow.y = display.contentCenterY + 168
upArrow.id = "up arrow"
local downArrow = display.newImageRect ("downArrow.png", 24, 14  )
downArrow.x = display.contentCenterX
downArrow.y = display.contentCenterY + 232
downArrow.id = "down arrow"
local leftArrow = display.newImageRect ("leftArrow.png", 14, 24  )
leftArrow.x = display.contentCenterX - 34
leftArrow.y = display.contentCenterY + 202
leftArrow.id = "left arrow"
local rightArrow = display.newImageRect ("rightArrow.png", 14, 24  )
rightArrow.x = display.contentCenterX + 34
rightArrow.y = display.contentCenterY + 202
rightArrow.id = "left arrow"

local theCharacter = display.newImageRect( "Idle.png", 90, 150  )
theCharacter.x = display.contentCenterX
theCharacter.y = display.contentCenterY- 100
theCharacter.id = "the character"
 physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )


function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = -50, -- move up 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end

    

    return true
end
function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = -50, -- move 50 pixels  to the left 
        	y = 0, -- move  0 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end
return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 in the x direction 
        	y = 50, -- move down 50 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end
return true
end
function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
        	x = 50, -- move right 50 pixels
        	y = 0, -- move up 0 pixels
        	time = 100 -- move in a 1/10 of a second
        	} )
    end
return true
end

upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
leftArrow:addEventListener( "touch", leftArrow )
rightArrow:addEventListener( "touch", rightArrow )