
AddCSLuaFile()

local matWireFrame  = Material( "models/wireframe" )

EFFECT.Time = 1.6
EFFECT.LifeTime = CurTime()

EFFECT.percent = 0
EFFECT.highPer = 0
EFFECT.height = 0
EFFECT.mins = 0
EFFECT.maxs = 0
EFFECT.AddDist = .8

function EFFECT:Init( data )
	self.Fancy = !tobool(LocalPlayer():GetInfo("hvap_cl_air_spawneffect"))
	if render.GetDXLevel() <= 90 or self.Fancy then return false end

    self.LifeTime = CurTime() + self.Time
    self.ParentEntity = data:GetEntity()
    if !IsValid(self.ParentEntity) then return end
    
	self.mins = self.ParentEntity:OBBMins()
	self.maxs = self.ParentEntity:OBBMaxs()
	self.height = self.maxs.z - self.mins.z
	
	if !self.ParentEntity:GetModel() then return end --//Some people manage to get models with no models
	
    self:SetModel( self.ParentEntity:GetModel() )    
    self:SetPos( self.ParentEntity:GetPos() )
    self:SetAngles( self.ParentEntity:GetAngles() )
    self:SetParent( self.ParentEntity )
	local skin = self.ParentEntity:GetSkin()
	if !skin then skin = 0 end
	self:SetSkin(self.ParentEntity:GetSkin())
	self.ParentEntity:SetColor(Color(255,255,255,255))
	self.ParentEntity:SetNoDraw( true )
	self.valid = true
end

function EFFECT:Think( )
	if !self.valid then return end
	if render.GetDXLevel() <= 90 or self.Fancy then return false end

    if !IsValid(self.ParentEntity) then return false end

	if self.highPer <= 0 then
		self.ParentEntity:SetColor(Color(255,255,255,255))
		self.ParentEntity:SetNoDraw( false )
		return false
	else
		return true
	end 
end

function EFFECT:SetMat( mat )
	render.MaterialOverride( mat )
end

function EFFECT:Render()
	if !self.valid then return end
	if render.GetDXLevel() <= 90 or self.Fancy then return false end
 
	if self.ParentEntity == NULL then return false end
 
	self.percent = (self.LifeTime - CurTime()) / self.Time
	self.highPer = self.percent + self.AddDist
	self.percent = math.Clamp( self.percent, 0, 1 )
	self.highPer = math.Clamp( self.highPer, 0, 1 )

	--Drawing original model
	local normal = self.ParentEntity:GetUp() * -1
	local origin = self.ParentEntity:GetPos() + self.ParentEntity:GetUp() * (self.maxs.z - ( self.height * self.highPer ))
	local distance = normal:Dot( origin )
	
	render.EnableClipping( true )
	render.PushCustomClipPlane( normal, distance )
	self:DrawModel()
	render.PopCustomClipPlane()
	
	
	--Drawing wire frame
	self:SetMat( matWireFrame )

	normal = self.ParentEntity:GetUp()
	distance = normal:Dot( origin )
	render.PushCustomClipPlane( normal, distance )
	
	local normal2 = self.ParentEntity:GetUp() * -1
	local origin2 = self.ParentEntity:GetPos() + self.ParentEntity:GetUp() * (self.maxs.z - ( self.height * self.percent ))
	local distance2 = normal2:Dot( origin2 )
	render.PushCustomClipPlane( normal2, distance2 )
	
	self:DrawModel()
	
	render.PopCustomClipPlane()
	render.PopCustomClipPlane()

	self:SetMat( 0 )
	
	render.EnableClipping( false )

end