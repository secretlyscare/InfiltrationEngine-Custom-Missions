local photos = {
	10995566622,
	10995568902,
	10995570629,
	10995573526,
	10995575610,
	10995578129,
	10995580217,
	10995583089,
	10995584930,
}
local function evalTexture(self)
	local name = self.Base.Name
	local Image
	if name == "LandscapePhotoSquare" then
		Image = Instance.new("Decal")
	elseif name == "LandscapePhotoHorizontalRectangle" then
		Image = Instance.new("Texture")
		Image.OffsetStudsU = 0
		Image.OffsetStudsV = .6
		Image.StudsPerTileU = 5
		Image.StudsPerTileV = 5
	else
		Image = Instance.new("Texture")
		Image.OffsetStudsU = 0
		Image.OffsetStudsV = 0
		Image.StudsPerTileU = 6
		Image.StudsPerTileV = 6
	end
	Image.Face = Enum.NormalId.Left
	Image.Transparency = .2
	Image.TextureContent = Content.fromAssetId(photos[self.Base:GetAttribute("Image")+1 or 1])
	return Image	
end

local function addPart(model, baseCFr, offset, size)
	local p = Instance.new("Part")
	p.Size = size
	p.CFrame = baseCFr * CFrame.new(offset)
	p.Anchored = true
	p.CanCollide = true
	p.TopSurface = Enum.SurfaceType.SmoothNoOutlines
	p.BottomSurface = Enum.SurfaceType.SmoothNoOutlines
	p.CanTouch = false
	p.Parent = model
	p.CastShadow = false
	return p
end

local function createModel(self)
	local model = Instance.new("Model")
	self.Model = model
	local Back = addPart(model, self.Base.CFrame, Vector3.zero, self.Base.Size)
	local Decal = addPart(model, self.Base.CFrame, Vector3.zero, Vector3.new(
			self.Base.Size.X + .001,
			self.Base.Size.Y - .3,
			self.Base.Size.Z - .3
		))
	local Image = evalTexture(self)
	Back.Name = "Part0"
	Back.Color = Color3.fromRGB(27, 42, 53)
	Decal.Color = Color3.fromRGB(27, 42, 53)
	Image.Parent = Decal
end

return {
	InitModel = createModel,
	DefaultSize = Vector3.new(0.1, 4.2, 5.4),
}
