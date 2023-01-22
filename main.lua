local harvest = {}
harvest[1] = {}

for _, v in next, workspace:GetChildren() do
   if v:IsA("Model") and v:FindFirstChildWhichIsA("Vector3Value", true) then
       if #harvest[1] >= 6 then -- Anti - cheat detection ( kicks you if too many wheat is collected at once. )
           game:GetService("ReplicatedStorage").RemoteEvents.Harvest:FireServer(unpack(harvest))
           table.clear(harvest[1])
       end
       harvest[1][#harvest[1] + 1] = v:FindFirstChildWhichIsA("Vector3Value", true)
   end
end
