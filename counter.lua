Counter = {
    countNumber = 0
}

function Counter:mousepressed(x, y, button, istouch)
    if(button == 1) then
        self:AddToCounter()
    end
end

function Counter:draw()
    return love.graphics.print(self.countNumber)
end

function Counter:GetCurrentCounter()
    return self.countNumber
end

function Counter:SetCounter(newNumber)

    if(newNumber == nil or type(newNumber) ~= "number") then 
        return 
    end

    self.countNumber = newNumber
end

function Counter:AddToCounter()
    self.countNumber=self.countNumber+1
end