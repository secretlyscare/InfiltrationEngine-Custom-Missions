local function addPart(model, baseCFr, offset, size)
	local p = Instance.new("Part")
	p.Size = size
	p.CFrame = baseCFr * CFrame.new(offset)
	p.Anchored = true
	p.CanCollide = false
	p.Name = "Part0"
	p.TopSurface = Enum.SurfaceType.SmoothNoOutlines
	p.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
	p.Material = Enum.Material.SmoothPlastic
	p.CanTouch = false
	p.Parent = model
	p.CollisionGroup = "None"
	p.CastShadow = false
	return p
end

local function CreateModel(self)
	local model = Instance.new("Model")
	local Tape = addPart(model, self.Base.CFrame, 
		Vector3.new(0, self.Base.Size.Y/2 + .001 - .1, 0),
		Vector3.new(.3, .2, self.Base.Size.Z + .001)
	)
	Tape.Name = "Part1"
	Tape.Color = Color3.fromRGB(255, 255, 255)
	local Box = addPart(model, self.Base.CFrame, Vector3.zero, self.Base.Size)
	Box.Name = "Part0"
	Box.Color = Color3.fromRGB(149, 137, 136)
	self.Model = model
	self.Parts = model:GetChildren()
end

return {
	InitModel = CreateModel,
	DefaultSize = Vector3.new(2.05, 1.1, 2.8),
}
