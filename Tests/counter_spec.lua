counter = require('counter')

_G.love = {
    graphics = {
        
    }
}

function love.graphics.print( text, x, y, r, sx, sy, ox, oy, kx, ky ) return text end
function love.mousepressed(x, y, button, istouch) return end -- 1 == left click

describe('GetCurrentCounter', function()
    it("Initial Current Counter is zero", function()
        assert.is_equal(Counter:GetCurrentCounter(), 0)
    end)
end)

describe('SetCounter', function()
    it("SetCounter to -20, set it to -20", function()
        Counter:SetCounter(-20)
        assert.is_equal(Counter:GetCurrentCounter(), -20)
    end)

    it("SetCounter to 33, set it to 33", function()
        Counter:SetCounter(33)
        assert.is_equal(Counter:GetCurrentCounter(), 33)
    end)

    it("SetCounter to 0, set it to 0", function()
        Counter:SetCounter(0)
        assert.is_equal(Counter:GetCurrentCounter(), 0)
    end)

    it("SetCounter to nil, keeps value", function()
        Counter:SetCounter(nil)
        assert.is_equal(Counter:GetCurrentCounter(), 0)
    end)

    it("SetCounter to 'word', keeps value", function()
        Counter:SetCounter("word")
        assert.is_equal(Counter:GetCurrentCounter(), 0)
    end)
end)

describe('AddToCounter', function()

    before_each(function()
        Counter:SetCounter(0)
    end)

    it("AddToCounter initially set to one", function()
        Counter:AddToCounter()
        assert.is_equal(Counter:GetCurrentCounter(), 1)
    end)

    
    it("AddToCounter called three times change to 3", function()
        Counter:AddToCounter()
        Counter:AddToCounter()
        Counter:AddToCounter()
        assert.is_equal(Counter:GetCurrentCounter(), 3)
    end)
    
    it("AddToCounter when -20, change to -19", function()
        Counter:SetCounter(-20)
        Counter:AddToCounter()
        assert.is_equal(Counter:GetCurrentCounter(), -19)
    end)
end)

describe('LoveDraw', function()
    
    before_each(function()
        Counter:SetCounter(0)
    end)

    it("Draw is calling love function", function()
        local s = spy.on(love.graphics, "print")
        
        local txt = Counter:draw()

        assert.spy(s).was_called()
        assert.is_equal(txt, 0)
    end)

    it("Draw is calling love function after two AddNumber", function()
        local s = spy.on(love.graphics, "print")
        
        Counter:AddToCounter()
        Counter:AddToCounter()

        local txt = Counter:draw()

        assert.spy(s).was_called()
        assert.is_equal(txt, 2)
    end)
end)

describe('LoveMouseClick', function()
    
    before_each(function()
        Counter:SetCounter(0)
    end)

    it("mouseclick once normally call AddToCounter to 1", function()
        local s = spy.on(Counter, "AddToCounter")
        
        Counter:mousepressed(0, 0, 1)

        assert.spy(s).was_called()
        assert.is_equal(Counter:GetCurrentCounter(), 1)
    end)

    it("mouseclick three times normally call AddToCounter to 3", function()
        local s = spy.on(Counter, "AddToCounter")
        
        Counter:mousepressed(0, 0, 1)
        Counter:mousepressed(0, 0, 1)
        Counter:mousepressed(0, 0, 1)

        assert.spy(s).was_called()
        assert.is_equal(Counter:GetCurrentCounter(), 3)
    end)

    it("mouseclick right or middle do nothing", function()
        local s = spy.on(Counter, "AddToCounter")
        
        Counter:mousepressed(0, 0, 2)
        Counter:mousepressed(0, 0, 3)

        assert.spy(s).was_not_called()
        assert.is_equal(Counter:GetCurrentCounter(), 0)
    end)
    
end)