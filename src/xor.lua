dnn=require('minidnn')
require('se')

math.randomseed(123)
x = se.DoubleMatrix(4,2)
data = {{0,0},{0,1},{1,0},{1,1}}
for i=1,4 do 
    for j=1,2 do 
        x:set(i-1,j-1,data[i][j])
    end 
end 
train = {{0},{1},{1},{0}}
y = se.DoubleMatrix(4,1)
for i=1,4 do 
    y:set(i-1,0,train[i][1])
end 


net = dnn.Network() 

layer1 = dnn.FullyConnectedLayer(dnn.IDENTITY,2,16)
layer2 = dnn.FullyConnectedLayer(dnn.RELU,16,16)
layer3 = dnn.FullyConnectedLayer(dnn.IDENTITY,16,1)

net:add_layer(layer1)
net:add_layer(layer2)
net:add_layer(layer3)

net:set_output(dnn.RegressionMSEOutput())
opt = dnn.SGDOptimizer(0.1)

net:init(0,0.01)

x:transposeInPlace()
y:transposeInPlace()

net:fit(opt,se.to_matrixd(x),se.to_matrixd(y),1,1000)

r=se.from_matrixd(net:predict(se.to_matrixd(x)))

for i=1,4 do 
    print(r:get(0,i-1))
end

