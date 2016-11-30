-- Planets

-- Use this function to perform your initial setup
function setup()
    -- print("Hello World!")
    parameter.action("Add Planet", addPlanet)
    parameter.integer("currRadius", 1, 25, 3)
    parameter.boolean("lockPlanet", false)
    
    parameter.integer("colorPal", 1, 10, 1)
    
    parameter.boolean("simulateGravity", false)
    parameter.boolean("pauseSim", false)
    
    parameter.boolean("useSun", false)
    parameter.integer("pA", 0, 255, 255)
    sunExists = false
    
    physics.gravity(0.0, 0.0)
    planets = {}
    curX = WIDTH/2
    curY = HEIGHT/2
    
    -- physics.body(EDGE, vec2(0, 0), vec2(0, HEIGHT))
    -- physics.body(EDGE, vec2(0, 0), vec2(WIDTH, 0))
    -- physics.body(EDGE, vec2(WIDTH, 0), vec2(WIDTH, HEIGHT))
    -- physics.body(EDGE, vec2(0, HEIGHT), vec2(WIDTH, HEIGHT))
    
    starfield = {}
    starLives = {}
    
    smokePos = {}
    smokeLiv = {}
    
    smokeLife = 900
    
    for i = 1, 30 do
        addStar(i)
    end
end

function addPlanet()
    thisPlan = physics.body(CIRCLE, currRadius*3)
    thisPlan.x = curX
    thisPlan.y = curY
    table.insert(planets, thisPlan)
end

function addStar(pos)
    table.insert(starfield, pos, vec3(math.random(WIDTH), math.random(HEIGHT), 1 + math.random(4)))
    table.insert(starLives, pos, 600 + math.random(1320))
end

-- This function gets called once every frame
function draw()
    background(12, 12, 15, 255)
    strokeWidth(2)
    
    fill(212, 215, 192, 255)
    stroke(242, 242, 242, 255)
    
    for i, s in ipairs(starfield) do
        if starLives[i] >= 0 then
            ellipse(s.x, s.y, s.z)
            starLives[i] = starLives[i] - 1
        else
            starfield[i] = vec3(math.random(WIDTH), math.random(HEIGHT), 1 + math.random(4))
            starLives[i] = 600 + math.random(1320)
            i = i + 1
        end
    end
    
    if useSun then
        if sunExists == false then
            physics.pause()
            sun = physics.body(CIRCLE, 100)
            sun.x = WIDTH/2
            sun.y = HEIGHT/2
            sun.type = STATIC
            sunExists = true
            table.insert(planets, sun)
            sunindex = #planets
            physics.resume()
        end
        fill(238, 88, 5, 255)
        stroke(255, 47, 0, 255)
        ellipse(sun.x, sun.y, 200)
    else
        if sunExists == true then
            oldplans = planets
            -- sun:destroy()
            planets = {}
            for i, v in ipairs(oldplans) do
                if i ~= sunindex then table.insert(planets, v) end
            end
            sunExists = false
        end
    end
    
    curX = CurrentTouch.x
    curY = CurrentTouch.y
    
    if pauseSim then
        physics.pause()
    else
        physics.resume()
    end
    
    if lockPlanet == false then
        selectedID = 0
        
        for i, v in ipairs(planets) do
            if vec2(CurrentTouch.x, CurrentTouch.y):dist(vec2(v.x, v.y)) < v.radius then
                selectedID = i
            end
        end
    end
    
    if (CurrentTouch.state == BEGAN or CurrentTouch.state == MOVING) and lockPlanet == true then
        for i, v in ipairs(planets) do
            if i == selectedID then
                if CurrentTouch.state ~= ENDED then
                    stroke(0, 255, 253, 255)
                    line(v.x, v.y, CurrentTouch.x, CurrentTouch.y)
                end
                v:applyForce(vec2(-(v.x - CurrentTouch.x), -(v.y - CurrentTouch.y)))
            end
        end
    end
    
    stroke(197, 197, 197, 155)
    
    line(curX, 0, curX, HEIGHT)
    line(0, curY, WIDTH, curY)
    
    fill(159, 159, 147, 115)
    stroke(255, 0, 0, 0)
    
    for i, s in ipairs(smokePos) do
        if smokeLiv[i] > 0 then
            fill(159, 159, 147, 150*smokeLiv[i]/(smokeLife))
            ellipse(s.x, s.y, 10)
            smokeLiv[i] = smokeLiv[i] - 1
        end
    end
    
    for i, v in ipairs(planets) do
        table.insert(smokePos, vec2(v.x, v.y))
        table.insert(smokeLiv, smokeLife)
        thisFX = 0
        thisFY = 0
        
        if i ~= selectedID then
            stroke(28, 28, 28, 255)
        else
            stroke(21, 179, 29, 255)
        end
        
        math.randomseed(v.radius^colorPal)
        
        if v.radius == 100 then
            fill(math.random(255), math.random(255), math.random(255), 255)
        else
            fill(math.random(255), math.random(255), math.random(255), pA)
        end
        
        ellipse(v.x, v.y, v.radius*2)
        if pauseSim == false then
            if simulateGravity then
                for ni, nv in ipairs(planets) do
                    if i ~= ni then
                        
                        dX = nv.x - v.x
                        dY = nv.y - v.y
                        
                        d = math.sqrt(dX^2 + dY^2)
                        
                        callib = 0.000001
                        
                        fX = dX * v.radius^3 * nv.radius^3 * callib/d^2
                        fY = dY * v.radius^3 * nv.radius^3 * callib/d^2
                        
                        
                        --[[
                        d = vec2(v.x, v.y):dist(vec2(nv.x, nv.y))
                        
                        w = (v.y - nv.y)/(v.x - nv.x)
                        fX = v.x - v.radius * nv.radius/(math.sqrt(1+w)*d^2)
                        -- fX = (v.x*d^4*w^2 + v.x*d^4 + math.sqrt(d^4*v.radius^2*nv.radius^2*w^2 +d^4*v.radius^2*nv.radius^2))/(d^4*w^2 + d^4)
                        fY = fX * w + math.sqrt((nv.y - v.y)^2)
                        
                        if nv.x > v.x then
                        fX = -fX
                    end
                        
                        if nv.y > v.y then
                        fY = -fY
                    end
                        ]]
                        thisFX = thisFX + fX
                        thisFY = thisFY + fY
                    end
                end
                v:applyForce(vec2(thisFX, thisFY))
                -- stroke(255, 0, 253, 255)
                -- line(v.x, v.y, v.x+thisFX, v.y+thisFY)
                -- fill(153, 0, 255, 255)
                -- ellipse(thisFX, thisFY, 10)
                -- print(v.x)
            end
        end
    end
end