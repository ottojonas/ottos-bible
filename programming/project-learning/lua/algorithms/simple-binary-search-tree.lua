data = {"A", "+", "B", "*", "C", "/", "D", "-", "E"}

left = {nil, 0, nil, 2, nil, 1, nil, 6, nil}
right = {nil, 3, nil, 4, nil, 7, nil, 8, nil}

root = 5

function P(T)
    if left[T] ~= nil then
        P(left[T])
    end
    if right[T] ~= nil then
        P(right[T])
    end
    print(data[T])
end

P(root)