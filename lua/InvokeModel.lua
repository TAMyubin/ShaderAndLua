local myModel = {}
myModel.Height = 100
function myModel:PrintHeight( ... )
	-- body
	print("身高是"..self.Height)
end
return myModel
